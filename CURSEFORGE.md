# Text for the CurseForge project page (copy and paste)

**Summary (one line):** Crafting simulator (leveling plans, shopping list, profit or loss), gathering guide with arrow and map icons, smart autoloot and an optional combat tutor.

---

# Trailsmith

Trailsmith is a toolkit for **crafting and gathering**. It tells you what a profession level-up or a craft will cost and whether it will make or lose money, points you to the ore and herbs you can actually gather, loots the right things for you, and can optionally show the best ability to press in combat.

> Trailsmith only **shows information**. It never moves, targets, casts or clicks for your character. Crafting is always done by the game's own crafting window.

## Download

Install **Trailsmith**. That is everything you need. **GatherTrailData** is an optional second addon with starter node locations (see *How it finds nodes*).

## What is inside (one window, five tabs)

Open the window with the **minimap icon**, `/tsp`, `/gt` or **Ctrl+K** (the key can be changed or turned off in Settings; plain K keeps opening the game's own crafting window). The text size and window size are adjustable.

### 1. Profession leveling
Pick a profession (Alchemy, Blacksmithing, Cooking, Enchanting, Engineering, First Aid, Leatherworking, Mining/Smelting, Tailoring) and a skill range, from your current skill to the maximum, or any range you like.

- **Step-by-step plan**: which recipe to craft at each skill range, how many times, the full material list, and the cost.
- **Summary cards**: skill points, crafts, what you have to **buy at market price**, what the crafted items **sell for**, and the **profit or loss**.
- **Three modes**: cheapest, best profit, fewest crafts.
- **Total materials for the whole plan** in a footer, with what you already own and what is missing.
- Recipes you still have to learn are marked, with a **Find trainer / Find vendor** button that finds the **nearest one for your faction**, opens the world map on the right zone and marks it (plus a map waypoint or a TomTom arrow when available).
- Click any step to simulate it.

### 2. Simulator
Pick any recipe of a profession, set a quantity and see everything before you spend a copper:

- the **step-by-step** crafts, including intermediate items (for example Copper Bars from Mining when you craft Blacksmithing items);
- the **shopping list** with market prices, the **total cost**, what the items **sell for** and the **profit or loss**;
- an option to use what you already have in your bags;
- the required station (forge, anvil, loom, cooking fire...);
- **Pin to screen**: a small movable list like a quest tracker. Materials turn green when you have them, and the raw materials are shown for items you still have to craft;
- **Open crafting window** buttons that open the game's own profession window (and try to select the recipe), so the game does the crafting.

A **Simulation** button is also added next to the game's crafting window.

**Prices** come from **Auctionator, TradeSkillMaster or Auctioneer** (picked automatically, or choose one), with vendor values as a fallback. You can count raw materials as free if you gather them yourself, and choose which recipe sources are allowed (known only, trainer, vendor, recipe items, other).

### 3. Gathering
- **Gathering guide**: quick switches for the gathering features (see below) and the detection range.
- **Advanced options**: every Trailsmith option, in three sub-tabs: **General**, **Display** and **Resources** (per-resource filter with the skill needed and the current Auctionator price, sort by price, best-value-only button, hide nodes far below your skill).

### 4. Combat Tutor (optional, off by default)
Formerly the MVAT addon. One floating icon shows the ability to use **right now**, with your key binding: emergency, interrupt, dispel, heal, taunt, procs and combos, AoE and missing buffs, for all 9 Classic classes. Extra panels show what the enemy is casting, boss warnings, group debuffs you can remove and the next abilities in the queue. It only suggests abilities you know (by default only ones on your action bars) and nothing from this module runs until you turn it on. Its own windows (`/mvat`, `/tutor`) are currently in Portuguese.

### 5. Settings
Window scale, opacity, text and number size, the simulator key, minimap icon, price source, and an optional debug log (`/tsp log`).

## Gathering features

- **Directional arrow** to the nearest node your skill can gather, with its name and distance. Move it with Shift+drag. A **Skip** button hides a node that turned out to be empty (Shift+click removes it for good).
- **Minimap and world map icons**, round and clean:
  - green ring = your skill is high enough, red ring (grey icon) = your skill is too low;
  - ores use the icon of the smelted bar, so Tin and Gold are easy to tell apart;
  - **transparency scales with rarity**: common nodes fade out, rare ones stay visible. You choose the base transparency and the icon size.
- **Line on the minimap** to the closest node, drawn only when the node is confirmed.
- **Adjustable range**, 50 to 2000 yards.
- **Smart autoloot**: *gathering autoloot* loots everything from a gather automatically; *quest and gold autoloot* takes only money and quest items from mobs and containers.
- **Auto-hide empty points**: rest the mouse on a Trailsmith icon with tracking on and, if the game shows nothing there, the point is hidden for a while.

## How it finds nodes (read this)

The game draws the nodes of *Find Minerals* / *Find Herbs* on the minimap itself and **does not give their positions to addons**. So Trailsmith works from known locations:

1. **Starter database** (optional, recommended): install **GatherTrailData**, with node locations from GatherMate2 data.
2. **What you gather**: when you gather a node, its exact location is saved as *confirmed*.
3. **Minimap hover**: with tracking on, hovering a node on the minimap shows its name; Trailsmith learns it and snaps it to the nearest known location.

The icons show **where nodes can be**; the game's own tracking shows what is up *right now*. Use both together.

## Commands and keys

- `/tsp` or `/professions`: open or close the window (`/tsp sim` opens the Simulator, `/tsp log` shows the debug log).
- `/gt` or `/gathertrail`: open the Gathering tab (advanced options). Others: `/gt range <50-2000>`, `/gt test`, `/gt lock`, `/gt skip`, `/gt unskip`, `/gt toggle`, `/gt scan`, `/gt clear`.
- `/mvat` or `/tutor`: Combat Tutor windows.
- **Ctrl+K**: open the window (changeable in Settings). There is also a key binding for *Skip current point* under Key Bindings > AddOns.

## FAQ

**Do I need GatherTrailData?** No. Trailsmith works without it, but then it only shows the points you learn yourself.

**Does it craft for me?** No. It simulates and plans; the game's own crafting window does the crafting.

**Does it show nodes that are spawned right now?** No, the game does not expose that to addons. Use the game tracking for live spawns.

**Prices are missing.** Install Auctionator (or TradeSkillMaster / Auctioneer) and scan the auction house. Without one of them the simulator falls back to vendor values.

**Is it safe to use?** Yes. It only reads public API data and draws information. It does not automate anything.

**Can I hide the minimap icon or change the key?** Yes, in Settings.

## Update without opening a browser

If you installed from GitHub, run `Update.bat` inside the Trailsmith folder to pull the newest version: https://github.com/cleytoncl3/Trailsmith-Addon

## Credits and license

- Recipe, reagent and item data: public DB2 exports from wago.tools; trainer, vendor and recipe-source data from the cmangos classic-db project (GPL-2.0).
- Starter node locations: GatherMate2 data by kagaro, Xinhuan and Nevcairiel (GPL), shipped separately as GatherTrailData.
- Optional prices: Auctionator, TradeSkillMaster, Auctioneer.
- Trailsmith itself is MIT licensed.

## Project setup notes (for the author, not for the page)

On the project page, under *Relations*, add **GatherTrailData** as an **optional** dependency.
