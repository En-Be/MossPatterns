# APPROACH


## Session 01

Done
- Imported project from phone 
- Stripped away grid generator + debugger, no need
- Commented out all the Branch class, started bringing it back in bit by bit
- Rewrote the symmetry function

---

## Session 02

Minutes: 60 

Todo
- Add colour mode selector
- Add move mode selector

Done
- Tried storing colour values as supplied 'color' datatype, but storage and retrieval as HSB is unreliable, so just using ints again instead
- Hue value cycles 0-360
- Colour has a variation value 
- Movemode selected by chance with likelihood
- Checked if x and y position have decimals, they do

---

## Session 03

Minutes: 55

TODO
- Change line directions to work with decimals
- Add size variation
- Add grow function

DONE
- Line directions work with decimals, lines not contrained to right angles
- Constrained lines back to 45 degree intervals, looks better
- Added likelihood weighting for different move modes
- Branches have a chance to clone themselves

---

## Session 04

Minutes: 60

TODO
- Add options for branches to die
- If no branches, add new branch
- Add curve move mode
- Add colour stepped mode
- Circles can be big sometimes

DONE
- Branches can die if at least one will remain
- Curve move mode (need to change to rotation rather than decimals of position)

---

## Session 05

Minutes: 30

TODO
- Add likelihoods for a move mode to be chosen and to be exited

DONE
- Added likelihoods for move modes to be chosen and to be exited

---