+++
draft=false
title='goo'
+++

Goo is a stack based programming language with an interpreter written in C. Normally it's quite verbose, but it could be adapted to but more concise (see `words.h`)

Here's a hello world:

```
pushstr "hello world!\n"
print
```

Here's the equation 3*(1+5)-8/3:

```
pushnum 3
pushnum 1
pushnum 5
add
mul
pushnum 8
pushnum 3
div
sub
```

gah im too tired to write more, pls look at the readme in github


---

GitHub: [CalSch/goo](https://github.com/CalSch/goo)