#!/bin/bash

FILES=./src/riscv-tests/isa/rv32*i-p-*
SAVE_DIR=./src/riscv-tests/hex

for f in $FILES
do
    FILE_NAME="${f##*/}"
    if [[ ! $f =~ "dump" ]]; then 
        riscv64-unknown-elf-objcopy -O binary $f $SAVE_DIR/$FILE_NAME.bin
        od -An -tx1 -w1 -v $SAVE_DIR/$FILE_NAME.bin > $SAVE_DIR/$FILE_NAME.hex   
        rm -f $SAVE_DIR/$FILE_NAME.bin
    fi
done
