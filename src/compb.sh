#!/bin/bash

if [ -f pbootsec.com ]; then rm -rf pbootsec.com; fi
if [ -f pbootsec.map ]; then rm -rf pbootsec.map; fi
if [ -f pbootsec.obj ]; then rm -rf pbootsec.obj; fi

wasm -zq -zcm -fo=.obj -Dmemodel=tiny pbootsec.asm
wlink F { pbootsec.obj } N pbootsec.com Format dos com Option quiet,map
