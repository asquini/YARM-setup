#!/bin/bash

EXTRA_PATH=`pwd`/gcc-arm-none-eabi-5_4-2016q2/bin/
if [ "`which arm-none-eabi-gcc`" != "$EXTRA_PATH/arm-none-eabi-gcc" ]; then
  export PATH=$EXTRA_PATH:$PATH
fi

