+++
title="shells are boring"
date="2026-09-28"
+++

ok guys i got a crazy idea.
you know how current unix shells are all boring text inputs that spawn a linear series of processes?
what if the shell was a graph?
like blender geometry nodes but for unix processes.

then you can do stuff like have to processes write to the same stream at the same time. or have two processes read from the same stream at the same time. why would you need it? idk. would it work? not really.

so fairly far into making this i realized that my main desire, one process being piped into two other ones, was not going to work. you can do it, but it doesn't work how one would expect. generally, each `write()` syscall would be "consumed" by a single `read()` syscall, which means only one of the two `read()`ing processes would actually get data at a time.

<details>
<summary>(example)</summary>

(see [notes](#nifty-notes) about some terminology)
- process A (`echo hello world`) writes to a pipe (eg. fd `0` is the pipe's write-end)
- process B (`xxd`) reads from that pipe (eg. fd `1` is the pipe's read-end)
- process C (`cowsay`) does the same
- you would expect that B outputs the hex dump of `hello world`, and that C outputs a cow saying `hello world`, but this does not happen
- instead, you either see that the cow says nothing, or that the hex dump is empty 

try with bash:
```sh
mkfifo pipe
echo hello world > pipe &
xxd < pipe &
cowsay < pipe &
```

(since this is a named pipe, this leaves one process hanging instead of reading nothing)

</details>

one could fix this by making a program that reads a chunk, and writes that to `stdout` and `stderr`, and those could be piped to different streams, but this is higher level than i was thinking.

having two processes writing to the same stream would work, though i see no practical use for it, since i think in most situations race conditions would occur. this can also be done in bash with ` | tee stream1 stream2 > /dev/null` or maybe ` | tee stream1 > stream2`

anyways, i had dreams of turning a node graph into a big unix process pipeline, operating at a fairly low level, but realistically most things can be done with really long bash one-liners. bash is amazing.

even though i probably wont make anything from this idea, working on prototypes taught me a lot about low level linux stuff. i found the `{read,write,open,pipe,fork,execve}(2) fifo(7)` man pages helpful.

## nifty notes
- "file descriptor" is too long so i will also be writing it as "fd"
    - fd `0` (`STDIN_FILENO`) is `stdin`; things like `scanf()` work by `read()`ing from `STDIN_FILENO`
    - fd `1` (`STDOUT_FILENO`) is `stdout`; things like `printf()` work by `write()`ing a string to `STDOUT_FILENO`
    - fd `2` (`STDOUT_FILENO`) is `stdout`; things like `perror()` work by `write()`ing a string to `STDERR_FILENO`
        - usually both `stdout` and `stderr` go to the terminal, but when redirecting (eg. `curl calschwick.net > file`), *only* `stdout` is redirected, leaving `stderr` still printed on screen.
        - in bash you can do `&>` to redirect both `stdout` and `stderr`, and respectively `|&` to pipe both to a process
        - there's also `2>&1` to explicitly redirect `stderr` *into* `stdout`, but i usually do `&>` (`2>&1` has better compatibility i think?)
- shells spawn new processes by duplicating themselves with `fork()`, changing file descriptors with `dup2()` if part of a pipe, and killing themselves and becoming a new executable with `execve()`
- the `pipe()` syscall returns 2 file descriptors, the first points to the read end, the second points to the write end.
    - shells "apply" pipes by doing ex. `dup2(STDOUT_FILENO, pipes[1]);`, which makes any `write()`'s to `stdout` go to the pipe, instead of the usual pseudoterminal.
    - this is also how file redirections work (ex. `echo hi > file`), but doing `open()` instead of `pipe()`
- reading from a pipe is blocking until something is written (or instant if something is already in the buffer)
    - `read()` returns 0 bytes read (EOF) *only* when the write-end is closed, which means *all* processes have to close it
        - this can cause problems when one child process reads from a pipe, the other is done writing, but the `read()` blocks because the first child has the write-end (that it never uses) open. this can be fixed by doing `pipe2(pipes, O_CLOEXEC)`, which makes the pipe file descriptors close themselves when `execve()` is run. (it doesn't close the pipe itself, but just the fd. don't ask me how, i don't get it)
        - also remember, as the parent process, to close the pipes once you are done spawning the child processes
- writing to a pipe is usually instant, unless the buffer is full in which case it is blocking until it is sufficiently emptied
    - i think the buffer is like 1MiB on modern linux? not sure
- you can do `mkfifo hey` to make a "named pipe" called `hey`. this is like a regular pipe, but you can open it with `open()` and persists even when no processes have it open
    - this provides a higher level way to create pipes. instead of using syscalls you can simply use shell tools
    - this gave me the idea to make the graph shell in godot, where i can keep pipes as files
    - running `open()` on a named pipe will block until both ends are opened
- in bash you can do `echo hi > file` to redirect `stdout` into a file; you can also do `echo hi 2> file` to redirect `stderr` into a file (because `STDERR_FILENO` is 2). i learned you can also do `3> file` for bash to open `file` for writing in file descriptor 3.
    - this doesn't have much use normally, considering no normal programs expect fd 3 to be open, but feel free to make your program's UX worse with this knowledge
- i wonder if you could take a graph and just generate a bash script from it


i might release some code later, but i have nothing presentable yet.