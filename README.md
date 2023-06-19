# MOSS PATTERNS

A pattern generator inspired by woven rug art and embroidery

![pic](/4.gif)

Phone version: a live wallpaper, slowly generating, that resets every 24hrs

Desktop version: speed variable for faster generation and production of stills/short videos

---

## Generation
In the 'setup' function of Main.pde, changing the number will change the chosen colour preset. 
You can also make your own by adding to the list in Presets.pde. There are other rules for generation, and tweaking the values is the best way to see how much variety you can get.

## Recording
In the setup function of Main.pde, changing the 'recording' boolean to true will export images at the framerate specified by 'framespersecond' for as long as specified by 'secondstorecord'.

## Reset
In the 'UpdateTiming' function of Main.pde, you can choose whether the app will reset every second (s), minute (m), hour (h), or day (d). I'd recommend adjusting 'speed' in the 'setup' function too.

---
This app requires [Processing](https://processing.org/) to run. Install it by following the link above, then use it to open this.

Approx time in development: 10 hours.

See the [approach file](APPROACH.md) for details of the development process.