+++
title='BPU (a CPU in Blender)'
+++

Once I had an idea, can you use Blender's Geometry nodes to emulate a CPU? Probably. And then I did it. Kinda.

The CPU is not standard. For starters, it has one only register, the program counter. All operations are done on memory values directly.
The program is separate from working memory since I figured I didn't really need self modifying code.
It also has separate memory for integers and floats, with instructions to move data between them.

It has instructions for add, sub, mul, div, mod, pow, log, root, sin, cos, tan asin, acos, and atan, with room for more functions if necessary.

And to make it turing complete, it can conditionally jump.

Unfortunately, writing code for it sucks. Look at this:
```
006
064
001
000
196
000
010
000
```
Do you know what this means? I don't anymore, I'm writing this 6 months after I made it. I don't think it even works correctly in some areas, but I'm way too tired to fix it.

To end this off, here is the amazing way that I convert a hexadecimal digit into a number in geonodes: (this was before "String to Value" was a thing)
![a terrible mess of nodes](https://raw.githubusercontent.com/CalSch/bpu/refs/heads/main/stuff/manynoodles.png)

On a similar note, it would've saved so much time if Blender had an "Is Even" node so I wouldn't have to make my own...

Anyways, here's the source i guess: [CalSch/bpu](https://github.com/CalSch/bpu)
