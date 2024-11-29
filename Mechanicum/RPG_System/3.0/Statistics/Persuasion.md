# ♟️ Persuasion index

**Persuasion index** is created each time you talk with any NPC, being overall indicator for 
positive or negative effect you have on said person.

Value is set based on:
- General societal status you have in community (minor factor, ommited with non-societal characters 
  like bandits)
- Previous index of said NPC (meaning you can override your history, but only to some extent)
- Race and sex bias
- Factions, guilds and political powers belonging
- Actions and dialogue choices on that NPC
- Your statistics

Value then affects dialogue options of NPCs - in many cases it does not matter, 
but there are times person will offer you different choices due to that index.

---
**Index formula** is as follows:
```
 current index = (previous index + general formula)/2
```
So, as you see, index is just average of two indexes - old one and new one. This is calculated
everytime said NPC didn't see you for over a month (30 in-game days) or 45 days after previous
index was calculated.  
So if you want to refresh your index, quickest way is to not talk with NPC, but if said NPC is
somehow important and requires talk, index will reset anyway - just after longer time.

If there wasn't any indexes made by far, index is made out of general formula only.

General formula looks like it:
```
a
```

| key | description          |   min    |   max   | dependency | importance | accelerated |
|:---:|----------------------|:--------:|:-------:|------------|:-----------|:-----------:|
|  s  | **societal status**  | ``-100`` | ``100`` | Location   | ♨️♨️♨️     |     🟢      |     
|  f  | **associations**     |  ``-5``  |  ``5``  | NPC        | ♨️♨️       |     🟢      |
|  b  | **bias value**       |  ``-3``  |  ``2``  | NPC        | 🔆🔆       |     🟢      |
|  c  | **charisma value**   |  ``1``   | ``inf`` | Player     | ♨️         |     ⚫️      |
|  p  | **persuasion value** |  ``0``   | ``inf`` | Player     | 🔆         |     🟣      |

Dialogue choices changes index "on the run", so they are not counted towards formula, but they
directly affects the index without touching extensive math.

---
♜: no formula  
[💠](/Entrance.md) 〰️ [➰](/Mechanicum/Mechanicum.md) 〰️ [🎲](/Mechanicum/RPG_System/3.0/RPG_System.md)