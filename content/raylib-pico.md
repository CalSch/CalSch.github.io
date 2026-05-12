# How to compile Raylib for the Raspberry Pi Pico

1. Get the `arm-none-eabi-` toolchain
    - I use Arch btw, so I installed the `arm-none-eabi-gcc` package
    - I might figure out other distros later
        - No idea how to do it on Windows or Mac, sorry
2. Get Raylib
    - `git clone https://github.com/raysan5/raylib`
3. Get my changes
    - `wget https://home.calschwick.net/cdn/raylib.patch`
4. Make the changes
    - `git apply the-file-you-made.patch`
    - If that doesn't work (which it probably won't in the near future), checkout to commit `5aa3de194c5da8725148e6c9322a9d4864797553`. This is the commit I was on at the time of making the patch.
5. Enter `src/`
6. Compile it with `make PLATFORM=PLATFORM_MEMORY CUSTOM_CFLAGS="-nostdlib -ffreestanding -static -Wno-incompatible-pointer-types -DSUPPORT_MODULE_RAUDIO=0 -mcpu=cortex-m0plus -mthumb" CC="arm-none-eabi-gcc" AR="arm-none-eabi-ar"`
7. You're done!

Now there should be `libraylib.a`, as well as the other `.o` files.
Running `file rcore.o` gives me this: `rcore.o: ELF 32-bit LSB relocatable, ARM, EABI5 version 1 (SYSV), not stripped`. The important part here is "32-bit" and "ARM", which means the cross-compiler part worked.

At this point, you can include `libraylib.a` and `raylib.h` (and some other `.h` files) in your RPI Pico project and use Raylib's functions.

---
## Code integration details

### Getting the framebuffer data

It's kinda useless to have Raylib if you can't see what it's drawing, so you can use `rlCopyFramebuffer` (defined in `rlgl.h`) to, you guessed it, get a copy of the framebuffer.

Due to my lack of experience in Raylib's internals, I had trouble finding the right value for `int format`, but I found that `PIXELFORMAT_UNCOMPRESSED_R8G8B8A8` worked, although it will be different if you change the pixel format Raylib uses.

### Using `GetTime()`

Since `GetTime` usually uses the OS's timing code, I had to remove it. I replaced it with a call to `double c_get_time()`, a function pointer declared in `raylib.h` and defined in `rcore.c`.
Importantly, this will change soon, since making a global function pointer with a non-standard-conforming name isn't exactly a good programming practice. But it works for me :)

Anywho, for now, if you want `GetTime` to work, make a function like this:
```c
double my_get_time() {
    return (double)to_ms_since_boot(get_absolute_time()) / 1000.0;
}
```
and assign `c_get_time` to your function.

