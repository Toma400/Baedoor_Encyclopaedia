# 🧱 Gridmap Guide

---
## Krita Gridmap Settings
Just because Krita has different settings from GIMP, writing down my own "reference".

### Layers Transparency
- Regions - 50%
- Factions - 50% (above regions)

### Tiers
- T1 (city, Andothren) - size `8` with first letter `10`, Titillium Web Regular, `uppercase`
- T2 (small city, Balmora) - size `7` with first letter `8`, Titillium Web Regular, `uppercase`
- T3 (town) - size `6` with first letter `7`, Titillium Web Regular, `uppercase`
- T4 (village) - size `6`, Titillium Web Regular, `lowercase`
- T5 (outpost) - size `5`, Titillium Web Regular, `lowercase`
- T00 (megalopolis) - size `11` with first letter `13`, Titillium Web Semi-Bold Itallic, `uppercase`

### Cultures
- layers - transparency `100`
- borders - brush `30`, transparency `100`
- fill - transparency `50`
- text - size `18`, white, Titillum Web, `bold italic`

### Current gridmaps following the rules:
- Baedoor Island `ensure`
(to be edited)

### Claims
- claims - Titillium Web Light, size `9`, colour `#8628b7`
- claim borders - size `3`, colour `#8628b7`
- release borders - size `3`, on top, colour `#140ca8`

---
## Layers and maps planned
That's rough plan for all layers and gridmap types.

**Layers**
- [water]
- regions
- base landmass
- [grid]
- settlements/state ownership & PoIs
- [legend]

**Map Types**
- standard
  - simple
  - heightmap (ideally TESAnnwyn-compatibile)
  - regions
  - claims
- detailed
  - minerals
  - guilds
  - cultures (w/ overlaps)
  - architecture sets (if not aligned with factions)
  - terrain features (w/ names of rivers, lakes, mountains etc.)

---
## Resizing workflow

Current map size: **18 000 x 21 000** (with Permafrost not included entirely to save space)
Size should be increased by thirds, for some reason I don't recall (I think it's one that let 
me keep grid working?)

There's two proposals for final global map size:
- +99% size: **36 000 x 42 000** (rejected upon test)
- +132% size: **42 000 x 49 000** (actually used)

Effectively:
- +99% = Disane is a bit smaller than Stirk
- +132% = Disane is tiny bit bigger than Stirk

Cell counts:
- +0%: **450 x 525**
- +99%: **900 x 1050**
- +132%: **1050 x 1225**

Grid: 40 pixels, 1 pixel for border (I think I used bottom-left so far)

**Global map management**  
Unlike now, the idea for new gridmap system is to work on small continuous pieces (so big 
continent landmasses are treated as one, but so is small archipelago, the point being that 
there should not be "leftover landmass" as in PTR).  
Eventually, the app (to be made) will stitch them all by analysing their layers, skip local 
grid and water layer, and apply global ones at the end into the full map. I imagine there would 
need to be a file that directs every .kra file towards specific coordinate, so it is consistent 
in where they are (unless manually adjusted).  
The original map exported for 10 minutes, so I assume +132% will take around an hour for each 
generation? also if possible, it'd be amazing to be able to make smaller chunks of 
map, e.g. map of single continent (this could be a first goal for programming the tool, for
easier testing)

**Map cuts must have cell amount dividable by thirds to be resized**:
as we use +1/3 as resize factor, it means that minimal map cut must be 3 x 3, then 6 x 3 / 3 x 6 / 6 x 6, and so on

## Gridmap queue
- Seiteh*
- East Moon
- Evyvind
- Forevind*
- Jitado*
- Mes Inpea*
- Agoi
- Dyalnesi Islands
- Central Moon*
- West Moon*

* has notebook