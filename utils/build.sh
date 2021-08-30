#!/bin/bash

cd pdpclib
./comp.sh

for f in *.obj; do rm -rf $f; done

cd ../src
./comp1.sh
./comp2.sh
./comp3.sh
./compb.sh

if [ -d 16bit ]; then rm -rf 16bit; fi

mkdir -p 16bit
mv pload.com 16bit/io.sys
mv pdos.exe 16bit/msdos.sys
mv pcomm.exe 16bit/command.com

for f in *.map; do rm -rf $f; done
for f in *.obj; do rm -rf $f; done

cd ..

if [ -f pdos16.img ]; then rm -rf pdos16.img; fi
utils/linux/mkdosfs --boot src/pbootsec.com -C pdos16.img 1440

utils/linux/doscp -i pdos16.img src/16bit/io.sys ::
utils/linux/doscp -i pdos16.img src/16bit/msdos.sys ::
utils/linux/doscp -i pdos16.img src/16bit/command.com ::

if [ -f pdpclib/pdptest.exe ]; then rm -rf pdpclib/pdptest.exe; fi
if [ -f pdpclib/watcom.lib ]; then rm -rf pdpclib/watcom.lib; fi

for f in pdpclib/*.obj; do rm -rf $f; done
for f in src/*.mapj; do rm -rf $f; done
for f in src/*.obj; do rm -rf $f; done

if [ -f src/bootupd ]; then rm -rf src/bootupd; fi
if [ -f src/os.lib ]; then rm -rf src/os.lib; fi
if [ -f src/pbootsec.com ]; then rm -rf src/pbootsec.com; fi
if [ -f src/watcom.lib ]; then rm -rf src/watcom.lib; fi

qemu-system-i386 -drive file=pdos16.img,format=raw,if=floppy,index=0
