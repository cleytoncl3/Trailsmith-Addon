# Text for the CurseForge project page (copy and paste)

**Summary (one line):** Crafting simulator that plans your profession leveling for the lowest cost or the best profit, plus a gathering guide with community node locations, ore and herb filters and prices.

---

# Trailsmith

**Trailsmith is a toolkit for crafting and gathering.**

**Crafting.** Simulate everything you need to level a profession while spending as little as possible, or while making a profit. Trailsmith builds the plan skill by skill, tells you exactly which materials to buy and how many, and uses **Auctionator** (or TradeSkillMaster / Auctioneer) prices to show whether crafting and selling an item makes you money or loses it. It also tells you in plain words when buying the materials is not worth it and you are better off gathering them yourself.

**Gathering.** Trailsmith shows you the ore and herb nodes known by the community in WoW Forever / Classic: a direction arrow, minimap and world map icons. In **Resources** you choose which ores and herbs you want to see, set the distance, and so build a route with only the materials that matter to you. Each resource also shows its **price from Auctionator**, so you can decide what is worth farming to make gold right now.

> Trailsmith only **shows information**. It never moves, targets, casts or clicks for your character. Crafting is always done by the game's own crafting window.

## Download

Install **Trailsmith**. That is everything you need: the community node locations are included.

## What is inside (one window, five tabs)

Open the window with the **minimap icon**, `/tsp`, `/gt` or **Ctrl+K** (the key can be changed or turned off in Settings; plain K keeps opening the game's own crafting window). The text size and window size are adjustable.

### 1. Leveling guide
Pick a profession (Alchemy, Blacksmithing, Cooking, Enchanting, Engineering, First Aid, Leatherworking, Mining/Smelting, Tailoring) and a skill range, from your current skill to the maximum, or any range you like.

- **Step-by-step plan**: which recipe to craft at each skill range, how many times, the full material list, and the cost. Quantities are an average estimate (skill-up chances: orange 100%, yellow 75%, green 25%).
- **Summary cards**: skill points, crafts, what you have to **buy at market price**, what the crafted items **sell for**, and the **profit or loss**.
- **Buy or gather?** If a plan loses money, Trailsmith compares it with gathering the raw materials yourself and tells you which is cheaper.
- **Three modes**: cheapest, best profit, fewest crafts.
- **Total materials for the whole plan** in a footer, with what you already own (bags and bank) and what is missing.
- **Honest about gaps**: if no recipe gives skill points in some range, the plan says so and does not count the steps after it, so you do not buy materials you cannot use yet. When a recipe you do not have yet could fill the gap (for example one taught by a "Blueprint" or "Recipe" item), it is suggested with where to get it.
- **Learns from the game**: when you open a profession window, Trailsmith reads the colour the game shows for each recipe you know and corrects its own skill table where they disagree.
- Recipes you still have to learn are marked, with a **Find trainer / Find vendor** button that finds the **nearest one for your faction**, opens the world map on the right zone and marks it (plus a map waypoint or a TomTom arrow when available).
- **Update prices** button to read the auction prices again after a scan.
- **Pin all materials** puts every material of the plan on your screen as a list you can follow while you shop (see *Pin to screen* below).

### 2. Craft simulator
Pick any recipe of a profession, set a quantity and see everything before you spend a copper:

- the **step-by-step** crafts, including intermediate items (for example Copper Bars from Mining when you craft Blacksmithing items);
- the **shopping list** with market prices and where each price came from, the **total cost**, what the items **sell for** and the **profit or loss**;
- an option to use what you already have in your bags **and in your bank** (saved when you visit it);
- the required station (forge, anvil, loom, cooking fire...);
- the recipe list can be ordered by **required skill, profit or name**, and shows both on every line;
- **Pin to screen**: a small movable list like a quest tracker. Materials turn green when you have them, and the raw materials are shown for items you still have to craft. You can pin several things (a whole leveling plan, one or more crafts): each one stays as its own section with a title, a blank line between them and its own remove button;
- **Open crafting window** buttons that open the game's own profession window (and try to select the recipe), so the game does the crafting.

A **Simulation** button is also added next to the game's crafting window.

**Prices** come from **Auctionator, TradeSkillMaster or Auctioneer** (picked automatically, or choose one), plus Trailsmith's own list: whenever you search or scan the auction house it saves the **median of the three cheapest buyouts**, ignoring absurdly low listings (bait listings meant to trick auto-posters). Each price shows its source, and vendor values are the fallback. The 5% auction house cut is subtracted from what you sell.

**Bank:** visit your bank once and Trailsmith remembers what is in it, so plans, the simulator and the pinned list count those items and tell you how many are in the bank, even when you are far away.

You can count raw materials as free if you gather them yourself, and choose which recipe sources are allowed (known only, trainer, vendor, recipe items, other).

### 3. Gathering
- **Gathering guide**: quick switches for the gathering features (see below) and the detection range.
- **Advanced options**: every Trailsmith option, in three sub-tabs: **General**, **Display** and **Resources**. In Resources you tick the ores and herbs you want to see, with the skill needed and the Auctionator price on the same line, sort by price, keep only the most valuable ones, and hide nodes far below your skill.

### 4. Combat Tutor (optional, off by default)
Formerly the MVAT addon. One floating icon shows the ability to use **right now**, with your key binding: emergency, interrupt, dispel, heal, taunt, procs and combos, AoE and missing buffs, for all 9 Classic classes. Extra panels show what the enemy is casting, boss warnings, group debuffs you can remove and the next abilities in the queue. It only suggests abilities you know (by default only ones on your action bars) and nothing from this module runs until you turn it on. Its own windows (`/mvat`, `/tutor`) are currently in Portuguese.

### 5. Settings
Window scale, opacity, text and number size, the simulator key, minimap icon, price source, and an optional debug log (`/tsp log`).

## Gathering features

- **Learns as you play**: every node you gather is saved as confirmed, and the minimap hover teaches Trailsmith new veins and plants, including spawns that exist only in WoW Forever and are not in the starter database.
- **Directional arrow** to the nearest node your skill can gather, with its name and distance. Move it with Shift+drag. A **Skip** button hides a node that turned out to be empty (Shift+click removes it for good).
- **Minimap and world map icons**, round and clean:
  - green ring = your skill is high enough, red ring (grey icon) = your skill is too low;
  - ores use the icon of the smelted bar, so Tin and Gold are easy to tell apart;
  - **transparency scales with rarity**: common nodes fade out, rare ones stay visible. You choose the base transparency and the icon size.
- **Line on the minimap** to the closest node, drawn only when the node is confirmed.
- **Adjustable range**, 50 to 2000 yards.
- **Smart autoloot**, two separate switches in the Gathering tab:
  - *Gathering autoloot*: loots everything from a gather (ore, herb, skinning) automatically, and only from gathers;
  - *Quest and gold autoloot*: from mobs, bosses and containers it takes only money and quest items and leaves the rest for you to choose.
- **Auto-hide empty points**: rest the mouse on a Trailsmith icon with tracking on and, if the game shows nothing there, the point is hidden for a while.

## How it finds nodes (read this)

The game draws the nodes of *Find Minerals* / *Find Herbs* on the minimap itself and **does not give their positions to addons**. So Trailsmith works from known locations:

1. **Starter database** (included): node locations from the community GatherMate2 data.
2. **What you gather**: when you gather a node, its exact location is saved as *confirmed*.
3. **Minimap hover**: with tracking on, hovering a node on the minimap shows its name; Trailsmith learns it and snaps it to the nearest known location.

The icons show **where nodes can be**; the game's own tracking shows what is up *right now*. Use both together.

**Good to know (limits of the game, not of the addon):**
- The game does not tell addons where a node is spawned at this moment, so Trailsmith cannot point to a vein that is up right now. It points to known locations.
- Locations the community has not recorded yet appear only after you (or Trailsmith's minimap hover) find them.
- Some ores and herbs listed in Resources do not exist in this version of the game yet; they show a mystery name until they do.
- Prices need an auction house addon (Auctionator is the main one) and a recent scan.

## Commands and keys

- `/tsp` or `/professions`: open or close the window (`/tsp sim` opens the Simulator, `/tsp log` shows the debug log).
- `/gt` or `/gathertrail`: open the Gathering tab (advanced options). Others: `/gt range <50-2000>`, `/gt test`, `/gt lock`, `/gt skip`, `/gt unskip`, `/gt toggle`, `/gt scan`, `/gt clear`.
- `/mvat` or `/tutor`: Combat Tutor windows.
- **Ctrl+K**: open the window (changeable in Settings). There is also a key binding for *Skip current point* under Key Bindings > AddOns.

## FAQ

**Do I need another addon for the node locations?** No. The starter database is included in Trailsmith. (If you had the separate GatherTrailData addon, you can delete it.)

**Does it craft for me?** No. It simulates and plans; the game's own crafting window does the crafting.

**Does it show nodes that are spawned right now?** No, the game does not expose that to addons. Use the game tracking for live spawns.

**Prices are missing.** Install Auctionator (or TradeSkillMaster / Auctioneer) and scan the auction house, then press *Update prices*. Without one of them the simulator falls back to vendor values.

**The plan says no recipe works in a range.** The game is the final judge: open the profession window once so Trailsmith can read the real colours. If the gap is real, gather or mine by hand to cross it.

**Is it safe to use?** Yes. It only reads public API data and draws information. It does not automate anything.

**Can I hide the minimap icon or change the key?** Yes, in Settings.

## Feedback and bugs

Found a problem or have an idea? Open an issue: https://github.com/cleytoncl3/Trailsmith-Addon/issues . If something looks wrong, type `/tsp log` and include what it shows.

## Credits and license

- Recipe, reagent and item data: public DB2 exports from wago.tools; trainer, vendor and recipe-source data from the cmangos classic-db project (GPL-2.0).
- Starter node locations: GatherMate2 data by kagaro, Xinhuan and Nevcairiel (GPL), included in the Data folder.
- Optional prices: Auctionator, TradeSkillMaster, Auctioneer.
- Trailsmith is licensed under the GNU GPL v2 or later (see LICENSE), because it includes GPL data.

## Project setup notes (for the author, not for the page)

The separate GatherTrailData project is no longer needed: its data is inside Trailsmith. On its page, point users to Trailsmith.
