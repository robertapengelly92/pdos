#!/bin/bash

if [ -f pcomm.exe ]; then rm -rf pcomm.exe; fi
if [ -f pcomm.map ]; then rm -rf pcomm.map; fi

for f in *.obj; do rm -rf *.obj; done

wasm -zq -zcm -fo=.obj -Dmemodel=large support.asm
wcl -q -w -c -I. -ml -zl -D__MSDOS__ -fpi87 -s -zdp -zu -fo=.obj -I../pdpclib pcomm.c pos.c dostime.c

wlink F { pcomm.obj pos.obj dostime.obj support.obj } N pcomm.exe Form dos Library ../pdpclib/watcom.lib Option quiet,map
