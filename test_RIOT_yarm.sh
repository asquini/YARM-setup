#!/bin/bash

if [ ! -d RIOT ]; then
  git clone https://github.com/ant9000/RIOT.git
fi

if [ ! -f gcc-arm-none-eabi-5_4-2016q2-20160622-linux.tar.bz2 ]; then
  wget https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q2-update/+download/gcc-arm-none-eabi-5_4-2016q2-20160622-linux.tar.bz2
fi

if [ ! -d gcc-arm-none-eabi-5_4-2016q2 ]; then
  tar xvf gcc-arm-none-eabi-5_4-2016q2-20160622-linux.tar.bz2
fi

EXTRA_PATH=`pwd`/gcc-arm-none-eabi-5_4-2016q2/bin/
if [ "`which arm-none-eabi-gcc`" != "$EXTRA_PATH/arm-none-eabi-gcc" ]; then
  export PATH=$EXTRA_PATH:$PATH
fi

exit 0
cd RIOT/examples/default

BOARD=yarm make flash
BOARD=yarm make term
