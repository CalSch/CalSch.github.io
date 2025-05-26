+++
#date='2025-05-25T21:41:33'
draft=false
title='Tiny Tron'
+++

This is a Commodore 64 Tron port I made for [Hackclub Say Cheese](https://saycheese.hackclub.com/), a challenge where you have to make a program that fits into a QR code.

To play, you load the file as a disk into a Commodore 64 (or an emulator) and press space to start. Player 1 starts on the left and uses WASD to move, and player 2 starts on the right and uses IJKL to move. When someone loses, the game over screen shows who won and what the score is. 


---

## About

The main challenge of fitting a program in a QR code is that the maximum amount of data one can handle is only 2,953 bytes. To put that into perspective, here are some comparisons:

- A typical 24 megapixel image would be ~12MB when using JPEG compression. This would fit in a mere 4,064 QR codes
- A Windows install ISO (~4.5GB) would fit in 1,523,874 QR codes

It's written in C, compiled by cc65, and uses no external libraries as they use too much space. It used to be a lot cooler, but then I realized that I can't just put the bytes into the QR code, it needs to be a URL. You can put a file into a QR code by using a data URL and putting the binary data in it with base64 encoding. This made the size limit even lower, down to 2,193 bytes. Because of this, I ended up removing most of the cool things like the title screen and making a lot of optimizations.

---

## Download

Here's the QR code:
![The QR code](/img/tron/qr.png)

And if you're lazy like me and don't want to scan it, here's the binary that's encoded in the QR code:

[tron.bin](https://home.calschwick.net/cdn/tron.bin)

---

## Screenshots

![Screenshot of the game](/img/tron/scr1.png)
![Screenshot of the game over screen](/img/tron/scr2.png)

---

GitHub: [CalSch/c64-tiny](https://github.com/CalSch/c64-tiny)