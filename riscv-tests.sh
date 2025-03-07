#!/bin/bash
# .\rsicv-tests.sh <package name> <directory name>
# Example: .\riscv-tests.sh riscv-tests riscv-tests

UI_INSTS=(sw lw add addi sub and andi or ori xor xori sll srl sra slli srli srai slt sltu slti sltiu beq bne blt bge bltu bgeu jal jalr lui auipc)
MI_INSTS=(csr scall)

WORK_DIR=./src
RESULT_DIR=$WORK_DIR/riscv-tests/results
mkdir -p $RESULT_DIR
rm $RESULT_DIR/*.txt

function loop_test(){
    INSTS=${!1}
    PACKAGE_NAME=$2     #package name
    ISA=$3
    DIRECTORY_NAME=$4   #directory name
    #change package name to $PACKAGE_NAME in CPUTests.scala
    sed -e "s/{package}/$PACKAGE_NAME/" $WORK_DIR/riscv-tests/RiscvTests_temp.scala > $WORK_DIR/test/scala/riscv-tests/RiscvTests.scala
    
    for INST in ${INSTS[@]}
    do
        echo $INST
        #change package name and HEX file name in Memory.scala
        sed -e "s/{package}/$PACKAGE_NAME/" -e "s/{isa}/$ISA/" -e "s/{inst}/$INST/" $WORK_DIR/riscv-tests/Mem_temp.scala > $WORK_DIR/main/scala/riscv-tests/Mem.scala
        sbt "testOnly $PACKAGE_NAME.RiscvTest" > $RESULT_DIR/$INST.txt
    done
}

PACKAGE_NAME=$1
DIRECTORY_NAME=$2
loop_test UI_INSTS[@] $PACKAGE_NAME "ui" $DIRECTORY_NAME
loop_test MI_INSTS[@] $PACKAGE_NAME "mi" $DIRECTORY_NAME
