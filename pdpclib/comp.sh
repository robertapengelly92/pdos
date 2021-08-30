#!/bin/bash

if [ -f pdptest.exe ]; then rm -rf pdptest.exe; fi
if [ -f watcom.lib ]; then rm -rf watcom.lib; fi

for f in *.obj; do rm -rf *.obj; done
wmake -u -f makefile.lnx
