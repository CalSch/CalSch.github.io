+++
title='Home'
+++

Free ideas for you, make them real:

1. a maze game that uses wave function collapse to procedurally generate the maze, but anything that you can't see (ie. outside the screen or outside a field of view) gets regenerated 
1. a raytracer that logs everything about the image
    - for each pixel it logs data about each bounce and their ray position and direction, what object they hit, their new color
    - then make an inspector thing so you can see what happened for each pixel
    - if you make this, i want to see how big the log file is
    - also by log i mean a json file or some outher format
1. an audio generator where you write a function (in python, c, glsl, etc.) that gets run for each sample and returns the sample position (im already doing this in Godot, but its very much a WIP, its [here](https://github.com/CalSch/audio-gen))
    - example: `float audio(float t) { return sin(t*440.0); }` would make a 440 Hz sine wave
    - other features:
        - custom variable sliders
        - helper functions
            - converts a string to a tone, ex. `note(A#5)` returns `932.2` (Hz)
            - wave functions like sine (with a corrected period by multiplying by tau), square (maybe with optional duty cycle), triangle, and sawtooth
            - math stuff like max, random (with seed), lerp, remap
        - oscilloscope viewer
        - another function that gets run once a frame or one that gets triggered by a button (so you can make randomly generated chords)
    - maybe something that inputs a sound and outputs another to you can make custom sound effects
1. Reverse regex, you input a regex and it outputs all of the possible matches
    - ex. in: `/(a|b){3}/`, out: `aaa, aab, aba, abb, baa, bab, bba, bbb`
    - how do you deal with `*` or `+`? maybe have a limit
1. Game where you interact with the world by dragging the window around or by resizing it.

also if these already exist or you have made one, please let me know (i wont take them off this page or anything, i just want to see them)
