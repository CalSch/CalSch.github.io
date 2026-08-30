+++
title="how to prevent all malware forever (this is a lie)"
+++

so theres malware in the aur. who could've guessed? certainly not myself.

here's how i check for weird packages:

```bash
git clone https://github.com/programmersd21/aur_checker
cd aur_checker
pacman -Qqm | grep -v -debug | uv run . batch --file /dev/stdin
```

- `pacman -Qqm` lists AUR packages
- `grep -v debug` gets rid of debug packages, which are weird and i dont understand them
- `uv run .` runs the thing in its own virtual environment. (uv is very nice; you should use it anytime you do python projects)

i kinda just found the first AUR/PKGBUILD checker i could find, so it's not like it's a good source.
in the future i might add other checkers, but im lazy rn.
