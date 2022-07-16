# ♟️ Podstawowe modyfikatory

---
Podstawowe modyfikatory tworzą naszą postać podczas podróży. Każde z nich opiera się
albo na drugorzędnych modyfikatorach, albo na podróży samej w sobie.

Podczas tworzenia postaci, możesz rozdysponować dwa punkty cech i dwa punkty umiejętności
do swojej postaci. Każdy awans da Ci jeden punkt cech do rozdysponowania więcej.  
Umiejętności rosną w miarę używania ich.

---
♈ **MODYFIKATORY GŁÓWNE**

- Życie (HP)
- Energia Magiczna (MP)
- Zmęczenie (SP)
- Punkty Doświadczenia (XP)
- Poziom (LVL)
- Maksymalne Obciążenie (WGH)
- Detoksykacja (DTX)
- Indeks Moralności (MORX, MORY)
- Prędkość (SPD)

♉ **MODYFIKATORY OPCJONALNE**

- Głód (HNG)
- Pragnienie (THR)

⛎ **MODYFIKATORY SIŁ** (od -20 do 20)

- Technologia (TECH)
- Magia (MAGCK)
- Zjednoczenie (CONN)
- Pustka (VOID)

---
### Jak modyfikatory są liczone?

♈ **MODYFIKATORY GŁÓWNE**
- HP = 20 + ENDx10 (if < 100, HP = 100)
- MP = 20 + INTx10 + MAGCKx10
- SP = default 1000 (zobacz opcjonalne)
- XP (add) = XPxMOD (MOD = [INT/5]/10, +1)
- XP (limit) = LVLx12 (LVLup = reset XP)
- WGH (limit) = STRx4 (WGH>WGHlimit = pomniejsza prędkość z każdym przekroczeniem 
                limitu o 4WGH)
- DTX = END x 0.1 + Survival x 0.1 ``DTX od trucizn, uzależnień, efektu alkoholowego i narkotyków``
- SPD - zależy od AGI, z domyślną wartością 1. Używa funkcji:

<img alt="Speed Func" height="140" src="/Assets/speed_function.jpg" width="360" class="center"/>  
Gdzie f(x) jest używane do poziomu 70 AGI, natomiast g(x) używane jest powyżej tego poziomu. Można to przedstawić w sposób taki jak na grafice poniżej:  

<img alt="Speed Graph" height="220" src="/Assets/speed_graph.jpg" width="400" class="center"/>

♉ **MODYFIKATORY OPCJONALNE**
- HNG = domyślnie 1000
- THR = domyślnie 1000  
Użycie SP/HNG/THR = 4/1/2  
Używane podczas akcji i wraz z czasem (1 minuta)

**SP/HNG/THR < 0**, cechy tymczasowo obniżają się o -1 za każde -100)  
**SP > 1k**, powraca do domyślnego SP=1000;  
**HNG/THR > 1k**, cechy tymczasowo obniżają się o -1 za każde +100)

⛎ **MODYFIKATORY SIŁ**   
- TECH obniża MAGCK. 1 TECH = -1 MAGCK
- MAGCK obniża TECH. 1 MAGCK = -1 TECH
- CONN nie obniża niczego
- VOID obniża CONN. 1 VOID = -2 CONN  

Modyfikatory te przyjmują wartości od -20 do 20. Niektóre rasy mają wyłączone obniżanie
sił, zwykle tyczy się to ras które znajdują balans pomiędzy nimi.  
Początkowe tworzenie charakteru ma z góry określone wartości sił, więc jakiekolwiek
zmiany (przyrost czy obniżenie) następuje w trakcie gry. Na przykład:

> Początkowo TECH: 5, MAGCK: 3  
> Otrzymano +1 TECH  
> Ostatecznie TECH: 6, MAGCK: 2  

Obniżenie MAGCK nie nastąpiłoby oczywiście gdyby postać była rasy o wyłączonym
obniżaniu tych sił.

---
[💠](/Entrance.md) 〰️ [➰](/Mechanicum/Mechanicum.md)