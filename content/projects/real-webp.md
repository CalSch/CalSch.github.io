+++
#date='2025-05-25T21:41:33'
draft=false
title='Real WEBP'
+++

Real WEBP (or RWP) is a new image file format made to be a competitor to Google's WEBP.

It stores images by encoding the color of each pixel as an HTML/CSS color name. An example RWP file goes as follows:
```
RWP 4 3
red orange yellow green
cyan blue magenta red
white grey dimgrey black
```

Which becomes this:
![The image](/img/rwp/demo-small.png)
and when resized becomes this:
![The image](/img/rwp/demo-big.png)

---

# How does it do an a regular image?
Here's the original:
![Original image](/img/rwp/flowers/og.jpg)
It's a 22 MB, 6000 x 4000 JPEG

## Without dithering

When converted into RWP (without dithering) it makes a 224 MB file. If you want to download it I have a gzipped version [here](/img/rwp/flowers/nodither.rwp.gz) that's only 8.8 MB

Just for fun, here's a small part from the beginning of the file
```
RWP 6000 4000
PowderBlue PaleTurquoise PowderBlue LightBlue PowderBlue PowderBlue PaleTurquoise LightBlue LightBlue LightBlue PaleTurquoise LightBlue LightBlue LightBlue LightBlue LightBlue PowderBlue LightBlue LightBlue LightBlue LightBlue PowderBlue PowderBlue PaleTurquoise LightBlue LightBlue LightBlue LightBlue LightBlue LightBlue LightBlue PaleTurquoise PowderBlue LightBlue LightBlue LightBlue LightBlue LightBlue LightBlue LightBlue LightBlue LightBlue LightBlue PowderBlue LightBlue LightBlue LightBlue LightBlue LightBlue PowderBlue PowderBlue LightBlue LightBlue LightBlue LightBlue LightBlue LightBlue LightBlue
```
There are **4000** lines, each of them with **6000** color names

When converted back into a PNG it makes this 9.8 MB file:
![The PNG](/img/rwp/flowers/nodither.png)

---

## With dithering

When dithering is on, the RWP file is 229 MB. The gzip is [here](/img/rwp/flowers/dither.rwp.gz) and it's 15 MB.

When converted back into a PNG it makes this:
![The PNG again](/img/rwp/flowers/dither.png)

---

GitHub: [CalSch/real-webp](https://github.com/CalSch/real-webp)