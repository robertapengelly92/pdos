#!/bin/bash

if [ -f pload.com ]; then rm -rf pload.com; fi
if [ -f pload.map ]; then rm -rf pload.map; fi

if [ -f watcom.lib ]; then rm -rf watcom.lib; fi
for f in *.obj; do rm -rf *.obj; done

wasm -zq -zcm -fo=.obj -Dmemodel=tiny -DWATCOM ploadst.asm
wasm -zq -zcm -fo=.obj -Dmemodel=tiny -DWATCOM nearw.asm

wasm -zq -zcm -fo=.obj -Dmemodel=tiny int13x.asm
wasm -zq -zcm -fo=.obj -Dmemodel=tiny lldos.asm
wasm -zq -zcm -fo=.obj -Dmemodel=tiny support.asm

wcl -ecc -q -w -c -I. -mt -zl -D__MSDOS__ -fpi87 -s -zdp -zu -fo=.obj -DNEED_DUMP -I../pdpclib pload.c minifat.c bos.c pdosload.c ../pdpclib/string.c ../pdpclib/dossupc.c
wcl -ecc -q -w -c -I. -mt -zl -D__MSDOS__ -fpi87 -s -zdp -zu -fo=.obj -I../pdpclib ../pdpclib/ctype.c

wlib -b -q watcom +support.obj
wlib -b -q watcom +bos.obj
wlib -b -q watcom +dossupc.obj
wlib -b -q watcom +minifat.obj
wlib -b -q watcom +string.obj
wlib -b -q watcom +pdosload.obj
wlib -b -q watcom +lldos.obj
wlib -b -q watcom +ctype.obj

wlink F { ploadst.obj pload.obj int13x.obj nearw.obj } N pload.com Form dos com Library watcom.lib Option quiet,map
