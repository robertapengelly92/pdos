sectread 0 0/0/1 boot.com
xychop pbootsec.com boot.001 0 10
xychop pbootsec.com boot.003 62 511
xychop boot.com boot.002 11 61
copy /b boot.001+boot.002+boot.003 boot2.com
sectwrit 0 0/0/1 boot2.com
