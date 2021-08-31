#!/bin/bash

for f in pdpclib/*.a; do rm -rf $f; done
for f in pdpclib/*.lib; do rm -rf $f; done
for f in pdpclib/*.o; do rm -rf $f; done
for f in pdpclib/*.obj; do rm -rf $f; done

if [ -f pdpclib/pdptest ]; then rm -rf pdpclib/pdptest; fi
if [ -f pdpclib/pdptest.exe ]; then rm -rf pdpclib/pdptest.exe; fi

for f in src/*.a; do rm -rf $f; done
for f in src/*.lib; do rm -rf $f; done
for f in src/*.map; do rm -rf $f; done
for f in src/*.o; do rm -rf $f; done
for f in src/*.obj; do rm -rf $f; done
