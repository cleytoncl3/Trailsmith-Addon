-- Trailsmith: market prices from the auction house and a saved copy of the bank contents.
-- Everything here only READS the game. Nothing is bought, sold, moved or clicked for the player.
local _, ns = ...
local M = {}
ns.Market = M
M.src = {}   -- item id -> where the price shown for it came from

local time, floor, sort = time, math.floor, table.sort

local function DB()
    GatherTrailDB = GatherTrailDB or {}
    local d = GatherTrailDB.market
    if not d then
        d = { prices = {}, bank = {} }
        GatherTrailDB.market = d
    end
    d.prices = d.prices or {}
    d.bank = d.bank or {}
    return d
end

local function Char()
    local n = UnitName and UnitName("player") or "?"
    local r = GetRealmName and GetRealmName() or "?"
    return n .. "-" .. r
end

---------------------------------------------------------------- price from the cheapest listings
-- Takes the sorted unit buyouts of one item. Ignores absurdly low ones (typos, bots) and returns the
-- median of the cheapest three that remain, plus how many listings were seen.
local function Robust(list)
    local n = #list
    if n == 0 then return nil end
    sort(list)
    local head = {}
    for i = 1, (n < 5 and n or 5) do head[i] = list[i] end
    local ref = head[floor((#head + 1) / 2)]
    local kept = {}
    for i = 1, n do
        local v = list[i]
        if v >= ref * 0.5 and v <= ref * 2.5 then
            kept[#kept + 1] = v
            if #kept == 3 then break end
        end
    end
    if #kept == 0 then kept[1] = ref end
    local mid
    if #kept == 1 then mid = kept[1]
    elseif #kept == 2 then mid = (kept[1] + kept[2]) / 2
    else mid = kept[2] end
    return floor(mid + 0.5), n, list[1]
end
M.Robust = Robust

local acc, seen = {}, {}   -- per search: item id -> unit buyouts (all pages so far), and listings already counted

local function ResetScan() acc, seen = {}, {} end

local function IdFromLink(link)
    return link and tonumber(link:match("item:(%d+)"))
end

local function ReadPage()
    if not GetNumAuctionItems or not GetAuctionItemInfo then return end
    local ok, count = pcall(GetNumAuctionItems, "list")
    if not ok or not count or count <= 0 then return end
    local touched = {}
    for i = 1, count do
        -- GetAuctionItemInfo: 3 count, 8 minBid, 10 buyout, 14 owner, 17 itemId
        local r = { pcall(GetAuctionItemInfo, "list", i) }
        if r[1] then
            local stack, buyout, itemId = r[4], r[11], r[18]
            if not itemId or itemId == 0 then
                local okL, link = pcall(GetAuctionItemLink, "list", i)
                itemId = okL and IdFromLink(link) or nil
            end
            if itemId and stack and stack > 0 and buyout and buyout > 0 then
                -- the same page can be reported several times: count a listing only once
                local key = itemId .. ":" .. stack .. ":" .. buyout .. ":" .. tostring(r[9]) .. ":" .. tostring(r[15])
                if not seen[key] then
                    seen[key] = true
                    local l = acc[itemId]
                    if not l then l = {} acc[itemId] = l end
                    l[#l + 1] = buyout / stack
                    touched[itemId] = true
                end
            end
        end
    end
    local db = DB().prices
    local n = 0
    for id in pairs(touched) do
        local copy = {}
        for i, v in ipairs(acc[id]) do copy[i] = v end
        local p, seen, low = Robust(copy)
        if p and p > 0 then
            db[id] = { p = p, n = seen, low = floor(low + 0.5), t = time() }
            n = n + 1
        end
    end
    if n > 0 then
        M.scanned = (M.scanned or 0) + n
        if ns.Prof and ns.Prof.PricesChanged then ns.Prof.PricesChanged() end
    end
end

-- our own market price for an item; also returns age in seconds and listings seen
function M.Own(id)
    local e = DB().prices[id]
    if e and e.p and e.p > 0 then return e.p, time() - (e.t or 0), e.n end
    return nil
end

function M.PriceCount()
    local c = 0
    for _ in pairs(DB().prices) do c = c + 1 end
    return c
end

function M.AgeText(sec)
    if not sec then return "" end
    if sec < 3600 then return floor(sec / 60) .. "m" end
    if sec < 86400 then return floor(sec / 3600) .. "h" end
    return floor(sec / 86400) .. "d"
end

---------------------------------------------------------------- bank copy
local function NumSlots(bag)
    if C_Container and C_Container.GetContainerNumSlots then return C_Container.GetContainerNumSlots(bag) or 0 end
    if GetContainerNumSlots then return GetContainerNumSlots(bag) or 0 end
    return 0
end
local function SlotInfo(bag, slot)
    if C_Container and C_Container.GetContainerItemInfo then
        local info = C_Container.GetContainerItemInfo(bag, slot)
        if type(info) == "table" then return info.itemID, info.stackCount or 1 end
        return nil
    end
    if GetContainerItemInfo then
        local _, count, _, _, _, _, link = GetContainerItemInfo(bag, slot)
        return IdFromLink(link), count or 1
    end
end

local BANK_BAG = -1
local function BankBagIds()
    local ids = { BANK_BAG }
    local first = (NUM_BAG_SLOTS or 4) + 1
    local last = first + (NUM_BANKBAGSLOTS or 6) - 1
    for b = first, last do ids[#ids + 1] = b end
    return ids
end

local atBank = false
function M.ScanBank()
    local items = {}
    for _, bag in ipairs(BankBagIds()) do
        for slot = 1, NumSlots(bag) do
            local id, n = SlotInfo(bag, slot)
            if id then items[id] = (items[id] or 0) + n end
        end
    end
    DB().bank[Char()] = { t = time(), items = items }
end

function M.BankSeen()
    local e = DB().bank[Char()]
    return e and e.t or nil
end

-- bag count, bank count (from the last bank visit)
function M.Counts(id)
    local bag = GetItemCount and (GetItemCount(id, false) or 0) or 0
    local bank = 0
    if GetItemCount then
        local all = GetItemCount(id, true) or 0
        if all > bag then bank = all - bag end
    end
    local e = DB().bank[Char()]
    if e and e.items and not atBank then
        local saved = e.items[id] or 0
        if saved > bank then bank = saved end
    end
    return bag, bank
end

function M.Total(id, useBank)
    local bag, bank = M.Counts(id)
    if useBank == false then return bag, 0, bag end
    return bag + bank, bank, bag
end

---------------------------------------------------------------- modern auction house (C_AuctionHouse)
-- Store the prices of a set of items: map item id -> list of unit buyouts.
local function Store(map)
    local db = DB().prices
    local n = 0
    for id, l in pairs(map) do
        local p, seen, low = Robust(l)
        if p and p > 0 then
            db[id] = { p = p, n = seen, low = floor(low + 0.5), t = time() }
            n = n + 1
        end
    end
    if n > 0 then
        M.scanned = (M.scanned or 0) + n
        if ns.Prof and ns.Prof.PricesChanged then ns.Prof.PricesChanged() end
    end
    return n
end
M.Store = Store

local function ReadItemSearch(itemKey)
    local AH = C_AuctionHouse
    if not (AH and itemKey and itemKey.itemID) then return end
    local l = {}
    for i = 1, (AH.GetNumItemSearchResults(itemKey) or 0) do
        local info = AH.GetItemSearchResultInfo(itemKey, i)
        if info and info.buyoutAmount and info.buyoutAmount > 0 then
            l[#l + 1] = info.buyoutAmount / (info.quantity and info.quantity > 0 and info.quantity or 1)
        end
    end
    if #l > 0 then Store({ [itemKey.itemID] = l }) end
end

local function ReadCommodity(itemID)
    local AH = C_AuctionHouse
    if not (AH and itemID) then return end
    local l = {}
    for i = 1, (AH.GetNumCommoditySearchResults(itemID) or 0) do
        local info = AH.GetCommoditySearchResultInfo(itemID, i)
        if info and info.unitPrice and info.unitPrice > 0 then l[#l + 1] = info.unitPrice end
    end
    if #l > 0 then Store({ [itemID] = l }) end
end

-- full scan ("Replicate"): read every listing in slices so the game does not freeze
local replicating = false
local function ReadReplicate()
    local AH = C_AuctionHouse
    if replicating or not (AH and AH.GetNumReplicateItems) then return end
    local total = AH.GetNumReplicateItems() or 0
    if total <= 0 then return end
    replicating = true
    local map, i = {}, 0
    local function Step()
        local stop = i + 1500
        if stop > total then stop = total end
        while i < stop do
            local r = { AH.GetReplicateItemInfo(i) }
            local count, buyout, id = r[3], r[10], r[17]
            if id and count and count > 0 and buyout and buyout > 0 then
                local l = map[id]
                if not l then l = {} map[id] = l end
                l[#l + 1] = buyout / count
            end
            i = i + 1
        end
        if i < total then
            C_Timer.After(0, Step)
        else
            replicating = false
            local n = Store(map)
            if ns.Log then ns.Log("full scan read: %d listings, %d items priced", total, n) end
        end
    end
    Step()
end

---------------------------------------------------------------- events
local f = CreateFrame("Frame")
-- not every client has every event; an unknown name must not break the others
for _, e in ipairs({ "AUCTION_ITEM_LIST_UPDATE", "ITEM_SEARCH_RESULTS_UPDATED", "COMMODITY_SEARCH_RESULTS_UPDATED",
    "REPLICATE_ITEM_LIST_UPDATE", "AUCTION_HOUSE_CLOSED", "BANKFRAME_OPENED", "BANKFRAME_CLOSED", "PLAYERBANKSLOTS_CHANGED",
    "PLAYERBANKBAGSLOTS_CHANGED" }) do
    pcall(f.RegisterEvent, f, e)
end
f:SetScript("OnEvent", function(_, ev, a1)
    local ok, err = pcall(function()
        if ev == "AUCTION_ITEM_LIST_UPDATE" then
            ReadPage()
        elseif ev == "ITEM_SEARCH_RESULTS_UPDATED" then
            ReadItemSearch(a1)
        elseif ev == "COMMODITY_SEARCH_RESULTS_UPDATED" then
            ReadCommodity(a1)
        elseif ev == "AUCTION_HOUSE_CLOSED" then
            if ns.Prof and ns.Prof.PricesChanged then ns.Prof.PricesChanged() end
        elseif ev == "REPLICATE_ITEM_LIST_UPDATE" then
            ReadReplicate()
        elseif ev == "BANKFRAME_OPENED" then
            atBank = true
            M.ScanBank()
        elseif ev == "BANKFRAME_CLOSED" then
            if atBank then M.ScanBank() end
            atBank = false
            if ns.Prof and ns.Prof.PricesChanged then ns.Prof.PricesChanged() end
        elseif atBank then
            M.ScanBank()
        end
    end)
    if not ok and ns.Log then ns.Log("market event %s failed: %s", ev, tostring(err)) end
end)

-- every new search starts a fresh set of listings (old auction house)
if hooksecurefunc and QueryAuctionItems then hooksecurefunc("QueryAuctionItems", ResetScan) end
