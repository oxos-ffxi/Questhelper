# Bard
[Unlock] Path of the Bard - DONE (one entry covering all three quests)
[AF]     Choral set - TODO
[Hands]  Borghertz's Harmonious Hands - TODO

## The chain, all in one entry
Authored as a single "super quest" because the two lead-ins are Lower Jeuno quests - a player
following the Bard line would never find them in data/Quests. The entry name normalises to
PATHOFTHEBARD so sync ties it to quest 20 and the whole thing ticks when the unlock completes.

| Step | Quest | Where | Event |
|---|---|---|---|
| 1 | The Old Monument (Q11) | Mertaire, Lower Jeuno (I-8) | 102 |
| 2 | - | buy a Sheet of Parchment | item obtain |
| 3 | " | Song Runes, Buburimu | cutscene 0 |
| 4 | " | trade Sheet of Parchment to the runes | 2 -> Poetic Parchment, quest done |
| 5 | A Minstrel in Despair (Q12) | trade Poetic Parchment to Mertaire | 101 -> starts AND completes it |
| 6 | Path of the Bard (Q20) | Bki Tbujhja, Lower Jeuno (I-8) | 182 |
| 7 | " | Song Runes, Valkurm Dunes | 2 -> unlocks BRD |

Sheet of Parchment: Pikini-Mikini, Mhaura (G-9), or AH [Materials > Leathercraft]. Mhaura is one
zone from the Buburimu runes, so the shopping trip sits naturally between steps 1 and 3.

Notes:
- Only ONE Sheet of Parchment is strictly needed. The Old Monument's reward IS a Poetic
  Parchment, and Mertaire's check is `tradeHas({POETIC_PARCHMENT})`, so the rubbing you already
  hold can go straight to him. The Minstrel section's own Song Runes trade exists to replace one
  you no longer have.
- A Minstrel in Despair has no separate "accept" - trading the parchment to Mertaire starts and
  finishes it in the same action.
- Event id 2 appears twice (step 4 at Buburimu, step 7 at Valkurm), and step 3 waits on event 0.
  All three carry a zone filter - `trigger_on_event_id = { 0, "Buburimu Peninsula" }` - so they
  cannot be completed by an unrelated cutscene elsewhere.

    Mertaire     !pos -17 0 -61 245    (Lower Jeuno)
    Bki Tbujhja  !pos -22 0 -60 245    (Lower Jeuno)
    Song Runes   !pos -244 16 -280 118 (Buburimu Peninsula)
    Song Runes   !pos -721 -7 102 103  (Valkurm Dunes)

