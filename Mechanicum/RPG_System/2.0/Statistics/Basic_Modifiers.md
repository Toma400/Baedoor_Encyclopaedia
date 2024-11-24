# ♟️ Basic Modifiers

---
Basic modifiers are what is building our hero during the journey. 
All of them are inherited either from hero's secondary modifiers or the journey itself.

During character creation, you can append two attribute points and two skill points to your hero. 
Each levelling up gives you one ability point more to spend.  
Skills level up during your actions.

---
♈ **MAIN MODIFIERS**

- Health (HP)
- Magic Energy (MP)
- Tiredness (SP)
- Experience Points (XP)
- Level (LVL)
- Maximum Weight (WGH)
- Detoxication (DTX)
- Morality Alignment (MORX, MORY)
- Speed (SPD)

♉ **OPTIONAL MODIFIERS**

- Hunger (HNG)
- Thirst (THR)

⛎ **POWER MODIFIERS** (from -20 to 20)

- Technology (TECH)
- Magick (MAGCK)
- Connection (CONN)
- The Void (VOID)

---
### How modifiers are counted?

♈ **MAIN MODIFIERS**
- HP = 20 + ENDx10 (if < 100, HP = 100)
- MP = 20 + INTx10 + MAGCKx10
- SP = default 1000 (look at optionals)
- XP (add) = XPxMOD (MOD = [INT/5]/10, +1)
- XP (limit) = LVLx12 (LVLup = reset XP)
- WGH (limit) = STRx4 (WGH>WGHlimit = lowers the speed with each 4WGH over the limit)
- DTX = END x 0.1 + Survival x 0.1 ``DTX from poison, addictions, alcohol effects and narcotics``
- SPD - depends on AGI, with base value being 1. Uses functions shown below:

<img alt="Speed Func" height="140" src="/Assets/speed_function.jpg" width="360" class="center"/>  
Where f(x) is used for AGI level up to 70, and g(x) is used after that level. This can be shown 
in graph in such manner:  

<img alt="Speed Graph" height="220" src="/Assets/speed_graph.jpg" width="400" class="center"/>

♉ **OPTIONAL MODIFIERS**
- HNG = default 1000
- THR = default 1000  
Use of SP/HNG/THR = 4/1/2  
Used during actions, and within time (1 minute)

**SP/HNG/THR < 0**, abilities temporarily going down -1 for each -100)  
**SP > 1k**, resets back to SP=1000;  
**HNG/THR > 1k**, abilities going down -1 for each +100)

⛎ **POWER MODIFIERS**   
- TECH lowers MAGCK. 1 TECH = -1 MAGCK
- MAGCK lowers TECH. 1 MAGCK = -1 TECH
- CONN does not lower anything
- VOID lowers CONN. 1 VOID = -2 CONN  

They are between values -20 and 20. There are several races which have power lowering disabled, it usually refers to races knowing balance between those powers.  
Initial character creation has predetermined values, so all alignments (increase and decrease) affecting happens during gameplay. Example:
> Initial TECH: 5, MAGCK: 3  
> Receiving +1 TECH  
> Output TECH: 6, MAGCK: 2  

Samely, MAGCK decrease in example wouldn't happen if race has lowering disabled.

---
[💠](/Entrance.md) 〰️ [➰](/Mechanicum/Mechanicum.md) 〰️ [🎲](/Mechanicum/RPG_System/2.0/RPG_System.md)