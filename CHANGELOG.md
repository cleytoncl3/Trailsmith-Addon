# Trailsmith

## 1.6.0
- **Choose the language.** Settings has a Language button: Automatic (follows the game, as before), English, Español or Português. The interface reloads to apply it. The Combat Tutor texts are still only in Portuguese.
- **GatherTrailData is now part of Trailsmith.** The starter node database (community GatherMate2 data) ships inside Trailsmith, in the Data folder, so there is only one addon to install. If you had GatherTrailData, you can delete its folder. Because the data is GPL, Trailsmith is now licensed GPL-2.0-or-later (it was MIT).
- **One Trailsmith.** The addon list and the minimap now show a single Trailsmith entry with the anvil icon (the old pickaxe icon is gone). Left click opens the window, right click turns the gathering guide on or off. The window is simply called "Trailsmith".
- **Clearer tab names:** "Leveling guide" and "Craft simulator" (translated to your game language).
- **Pin all materials** in the Leveling guide, and a pinned list with sections: everything you pin (a leveling plan, one or more crafts) stays in its own section with a title, a blank line between sections and its own remove button, instead of replacing the previous one.
- **Resources list is easier to read.** The skill and price columns now sit right after the resource name (with room for long names) instead of at the far right of the window, and every row has a thin, faint line so your eye can follow it from name to price. The name column grows to fit the longest name, so it can never cover the skill number. Ores and herbs that this game version does not have yet show a mysterious name in purple ("Ore Yet Unknown to Azeroth", "Bloom Shrouded in Mystery"...) instead of a bare item number.
- **More reliable prices.** Trailsmith now keeps its own price list: whenever you search or scan the auction house it reads the listings and saves the **median of the three cheapest buyouts**, ignoring absurdly low outliers (typos, bots) and counting each listing once. While that scan is at most 2 days old it is used before the other addons; after that TradeSkillMaster, Auctionator or Auctioneer take over. If the chosen source has no price for an item, the others are tried before falling back to vendor values. A price below what a vendor pays for the item is treated as a bait listing and raised to the vendor price.
- The shopping list and item tooltips show **where each price came from** (and how old it is for the Trailsmith scan). The 5% auction house cut is still subtracted from sale values.
- **Bank awareness.** When you visit the bank, Trailsmith saves what is in it. Plans, the simulator, the pinned tracker and the material footer then count your bank items (in blue) and tell you how many are in the bank, even when you are far away. Can be turned off in the crafting options.

- **Update prices** button (crafting options panel, used by both leveling and the simulator, and next to the recipe list). It reads Auctionator, TSM, Auctioneer and the Trailsmith list again; prices also refresh by themselves a moment after a scan is read and when you close the auction house. Trailsmith's own scan no longer overrides Auctionator data that is newer.
- **Recipe order** button in the simulator list (all professions): by required skill (lowest first), by profit (highest first, recipes without a sale value last) or by name. Each row now shows the required skill and the estimated profit.

- **Plans no longer count recipes you cannot reach.** If no recipe gives skill points in some range (a gap), the steps after the gap are shown as "after the gap" and left out of the totals, the materials list and the cost, so you do not buy materials you cannot use yet. A message explains the gap and, when possible, which recipe could cover it.
- **Calibration with the game.** Whenever you open a profession window, Trailsmith reads the colour (orange/yellow/green/grey) the game shows for each recipe you know and corrects its own skill table where they disagree (Debug log: `/tsp log`). Recipes also carry the Classic Anniversary range as a hint.
- **Buy or gather?** The leveling tab now says in plain words whether buying the materials pays off. If the plan loses money, it compares with gathering the raw materials yourself and tells you which is cheaper.
- **Recipes you do not have yet.** The recipe database now links 1,000+ more recipes to the item that teaches them (for example "Blueprint: Rock Garden"). When none of your recipes gives skill points in a range, the plan suggests one you could obtain, says where it comes from, counts the recipe's auction price when known, and marks the step "get: <recipe item>".
- Quantities are labelled as an average estimate (skill-up chances 100% orange, 75% yellow, 25% green).

## 1.5.1
- Skinning, Herbalism and Fishing no longer show a dead end. Each has a page that explains what it feeds (Skinning -> Leatherworking, Herbalism -> Alchemy, Fishing -> Cooking), with buttons that open that profession's leveling plan or simulator. Skinning shows a progression guide (which creature levels to skin at each skill range, which leather you get and how many recipes use it); Herbalism lists every herb with the skill to pick it and how many recipes use it.

## 1.5.0
- **Gathering** tab now has two sub-tabs: **Gathering guide** (quick switches) and **Advanced options** with every Trailsmith option (General, Display, Resources with per-resource filter and prices). The separate options window is gone; the Trailsmith minimap button opens this tab.
- **Combat Tutor** has its own tab next to Gathering (it was inside the Trailsmith options). Still off by default.
- New home: github.com/cleytoncl3/Trailsmith-Addon.

## 1.4.2
- **K is yours again.** A bug kept the old K takeover alive for people who had used an earlier version. The simulator now opens with **Ctrl+K** (changeable or removable in Settings, with a warning when the key already does something). Plain K opens the game's own window.
- The game's crafting window no longer opens behind the simulator (the simulator sits on the same layer and the game window is raised when it opens). The pinned tracker stays on top.
- Crafting icon for the simulator: registered with LibDBIcon / data broker when available (so minimap button collectors list it), with the addon compartment when the client has one, and with its own minimap button otherwise.

## 1.4.1
- The crafting simulator has its own minimap icon (can be hidden in Settings). The K key is not used at all.
- Smaller, fixed text sizes; the text no longer grows when the window is enlarged. Sliders for text and number size remain in Settings.
- Profession leveling: the Materials tab is gone; the total materials for the whole plan are listed in a footer. Taller plan rows, no cut-off text.
- Simulator: recipe list with two lines per recipe, cleaner header and quantity row, bigger spacing in the step list.
- Pinned tracker: more spacing, shorter buttons, text sizes that match the rest.
- "Open crafting window" now uses the profession's own spell (Smelting for Mining) with a click setup that works with the keydown option, and falls back to the profession API; the result is written to the log.

## 1.4.0
- The profession window is now a **crafting simulator** that complements the game's own crafting window and never replaces it. The K key is no longer taken over (older versions did; that is switched off automatically).
- Open it from the minimap button (Shift+click), the General options tab, `/tsp`, or the new **Simulation** button added next to the game's crafting window.
- Tabs: **Profession leveling** (from skill X to Y: steps, crafts, what to buy at market price, what the items sell for, profit or loss) and **Simulator** (pick any recipe and a quantity: step-by-step crafts including intermediate items such as bars, shopping list with prices, cost, sale value and profit or loss).
- Intermediate items can come from any profession you have (for example Copper Bar from Mining when you craft Blacksmithing items).
- **Pin to screen**: a small movable tracker like a quest objective list. Materials turn green when you have them, with the raw materials shown for items you still have to craft.
- **Open the game's crafting window** buttons open the real profession window (and try to select the recipe). Crafting itself is always done by the game.
- Plan rows are taller so the full material list is readable; click a row to simulate it.

## 1.3.3
- Debug log: every click, option change, profession/recipe selection, craft attempt (APIs tried and their results), trainer lookup, key binding and Lua error in the Professions window and in the main options is recorded. Game events during crafting (spell cast start/fail/success, UI error messages, blocked actions) are recorded too. View it with `/tsp log` (copy with Ctrl+C), clear with `/tsp log clear`, switch it off in Settings. It is saved in the SavedVariables file.

## 1.3.2
- Recipes you still have to learn now have a **Find trainer / Find vendor** button. It picks the nearest one for your faction, opens the world map on the right zone, marks it with a pin (and a map waypoint or TomTom arrow when available) and prints the name and coordinates in chat.
- New footer in the Crafting tab, like the default crafting window: selected recipe, required station (forge, anvil, loom, cooking fire...), materials with how many you have, and Craft / Craft all buttons.
- Layout fixes: the crafting options panel no longer overlaps (long labels wrap and spacing follows the text size), smaller numbers in the summary cards, wider profession list so names such as First Aid are not cut.
- The recipe database now includes about 280 trainer and vendor locations (converted to world-map coordinates) and the station each recipe needs.

## 1.3.1
- Profession window redesigned in the standard WoW style (same frame and red buttons as the Trailsmith options). Profession list with names on the left, crafting options (mode, recipe sources, prices) in a panel on the right, plan/materials/recipes in the middle.
- The window can be resized by dragging the bottom-right corner, and the text scales with the window size. + / - buttons on the title bar change the window scale; sliders for text and number size in Settings.

## 1.3.0
- The window now works like a character-panel tab: it opens with the **K** key (changeable, can be turned off; the old action stays on Shift+K), with a square icon per profession down the left side and tabs along the top: **Crafting**, **Gathering** and **Settings**.
- New **Gathering** tab: the gathering guide switches (ore, herbs, autoloot, auto-hide, range) without leaving the window. Herbalism, Skinning and Fishing now show in the side list.
- A button to open Blizzard's own window for the same key.

## 1.2.1
- Profession planner: search bar at the top (recipes, crafted items and materials across all professions), separate text-size and number-size sliders in Settings, wider window, shorter card titles and labels so nothing overlaps.

## 1.2.0
- New **Profession planner** (on by default). Open it with `/tsp`, `/gt prof`, Shift-click on the minimap button, or the button in the General tab.
- Pick a profession (Alchemy, Blacksmithing, Cooking, Enchanting, Engineering, First Aid, Leatherworking, Mining/Smelting, Tailoring), set a skill range and get a step-by-step leveling plan with crafts, materials and cost.
- Three plan modes: cheapest, best profit, fewest crafts. Shopping list with what you already own, a full recipe browser with difficulty bands, and a settings tab.
- Prices from Auctionator, TradeSkillMaster or Auctioneer (automatic), vendor prices as a fallback. Option to count raw materials as free if you gather them yourself.
- Recipe database (about 2,500 recipes) generated from public data, see `tools/build_recipes.js` and the README.
- Four window skins, scale and opacity options. English, Spanish and Portuguese, chosen from the game language.

## 1.1.1
- The addon folder is now `Trailsmith` (was `GatherTrail`); saved data moves to the new name. If you update from 1.1.0, delete the old `GatherTrail` folder.

## 1.1.0
- New **Combat** tab: the Combat Tutor (formerly MVAT) is now a module inside Trailsmith, off by default. Enable it to get the floating ability icon, enemy cast panel, boss warnings and group dispel panel.
- Saved data for the tutor lives in `MVAT_DB`; `/mvat` and `/tutor` still work (they point to the Combat tab while the module is off).

## 1.0.0
- Directional arrow, minimap line and minimap / world map icons for ore and herbs (green ring = skill is enough, red = too low).
- Ore icons use the smelted bar; icon transparency scales with node rarity; icon size and transparency are adjustable.
- Resources tab: per-resource filter, skill requirement, Auctionator price, sort by price, best value only, hide nodes far below your skill.
- Gathering autoloot and smart autoloot (gold and quest items only).
- Learns confirmed spawns when you gather or hover nodes on the minimap; optional auto-hide of empty points.
- Optional starter database through the separate GatherTrailData addon.
- Resizable, tabbed options window; English, Spanish and Portuguese picked from the game language.
