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

## Session 06

Minutes: 30

TODO
- Occasional big circles


DONE
- Occasional big circles

---

## Session 07

Minutes: 30

TODO
- Stepped colour mode

DONE
- Stepped colour mode (set with first branch parameters and persists)

---

## Session 08

Minutes: 45

TODO
- Test acceleration on framerate, export video/stills

DONE
- Accelerated generation works on laptop
- Fixed branch hue randomisation
- Specified frame rate and number of seconds to record
- Stills exported when recording set to true

---

## Session 09

Minutes: 30

TODO
- reset by time (every 24hrs, start at 7am)
- return to phone, install as wallpaper

DONE
- Saves a still every minute and then resets
- Will transfer to phone and change settings there for reset every day as live wallpaper

---

## Session 10

Minutes: 30

TODO
- Install on phone as wallpaper
- Add tone setting to start light or dark

DONE
- Install on phone as wallpaper
- Add tone setting to start light or dark

---

## Session 11

Minutes: 60

TODO
- Branch parameters collected in colour modes

DONE
- Profile class with colour parameters
- Branch checks current profile for random at branch and hue

---

## Session 012

Minutes: 60

TODO
- Branch parameters to colour profile

DONE
- More parameters moved to profile

---

## Session 013

Minutes: 60

TODO
- All colour parameters to profiles
- List of preset profiles

DONE
- All colour parameters to profiles
- List of preset profiles to choose from
    - Dark and saturated, slight hue change
        ![pic](/MossPattern-1754.png)
    - Light and pastel, hue drift
        ![pic](/MossPattern-2119.png)
    - Frequent random
        ![pic](/MossPattern-1162.png)

