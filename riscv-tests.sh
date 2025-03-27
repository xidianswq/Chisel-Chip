#!/bin/bash
# .\rsicv-tests.sh <package name> <directory name>
# Example: .\riscv-tests.sh cpu_riscv_tests cpu

UI_INSTS=(sw lw add addi sub and andi or ori xor xori sll srl sra slli srli srai slt sltu slti sltiu beq bne blt bge bltu bgeu jal jalr lui auipc)
MI_INSTS=(csr scall)

WORK_DIR=./src
SRC_DIR=$WORK_DIR/main/scala
TEST_DIR=$WORK_DIR/test/scala
RESULT_DIR=$WORK_DIR/riscv-tests/results

function arg_check(){
    if [ "$#" -ne 2 ]; then
        echo "[INFO] Usage: .\riscv-tests.sh <package name> <directory name in src/main/scala>"
        echo "[EXAMPLE] .\riscv-tests.sh cpu_riscv_tests cpu"
        echo "[EXAMPLE] .\riscv-tests.sh cpu_pipeline_riscv_tests cpu_pipeline"
        read
        exit 1
    fi
}

function clean(){
    echo "[WARNNING] clean former results[Y/n]?"
    read -n 1 -r
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        rm -rf $RESULT_DIR/$DIR_NAME/
    fi

    echo -e '\n'
    echo "[WARNNING] clean former riscv-tests files[y/N]?"
    read -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf $SRC_DIR/riscv-tests/$DIR_NAME/
        return 1
    fi
    return 0
}

function file_copy(){
    PACKAGE_NAME=$1     #package name
    DIR_NAME=$2         #directory name
    
    echo -e '\n'
    echo "[INFO] copy $SRC_DIR/$DIR_NAME to $SRC_DIR/riscv-tests/$DIR_NAME..."
    
    cp -r $SRC_DIR/$DIR_NAME $SRC_DIR/riscv-tests/$DIR_NAME
    for f in $SRC_DIR/riscv-tests/$DIR_NAME/*
    do
        if [[ $f =~ ".scala" ]]; then
            sed -i "s/$DIR_NAME/$PACKAGE_NAME/" $f
        fi
    done
}

function loop_test(){
    INSTS=${!1}
    PACKAGE_NAME=$2     #package name
    ISA=$3
    DIR_NAME=$4   #directory name

    echo -e '\n'
    echo "[INFO] start $ISA test [Y/n]?"
    read -n 1 -r
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        return 0
    fi

    mkdir -p $TEST_DIR/riscv-tests/$DIR_NAME
    #change package name to $PACKAGE_NAME in CPUTests.scala
    sed -e "s/{package}/$PACKAGE_NAME/" $WORK_DIR/riscv-tests/RiscvTests_temp.scala > $TEST_DIR/riscv-tests/$DIR_NAME/RiscvTests.scala
    
    mkdir -p $RESULT_DIR/$DIR_NAME
    succeed=0
    isa_num=0
    for INST in ${INSTS[@]}
    do
        isa_num=$((isa_num+1))
        echo $INST
        #change package name and HEX file name in Memory.scala
        sed -e "s/{package}/$PACKAGE_NAME/" -e "s/{isa}/$ISA/" -e "s/{inst}/$INST/" $WORK_DIR/riscv-tests/Memory_temp.scala > $SRC_DIR/riscv-tests/$DIR_NAME/Memory.scala
        sbt "testOnly $PACKAGE_NAME.RiscvTest" > $RESULT_DIR/$DIR_NAME/$INST.txt
        if [ $? -ne 0 ]; then
            echo -e "[ERROR] $INST \t test failed"
            echo -e "[ERROR] $INST \t test failed" >> $RESULT_DIR/$DIR_NAME/summary.txt
        else
            succeed=$((succeed+1))
            echo -e "[INFO] $INST \t test succeed"
            echo -e "[INFO] $INST \t test succeed" >> $RESULT_DIR/$DIR_NAME/summary.txt
        fi
    done
    echo -e "[SUMMARY] $succeed/$isa_num \t $ISA \t tests succeed"
    echo -e "[SUMMARY] $succeed/$isa_num \t $ISA \t tests succeed" >> $RESULT_DIR/$DIR_NAME/summary.txt

    return 1
}

function main(){
    arg_check $@
    PACKAGE_NAME=$1
    DIR_NAME=$2

    clean
    if [ $? -eq 1 ]; then
        file_copy $PACKAGE_NAME $DIR_NAME
    fi
    
    loop_test UI_INSTS[@] $PACKAGE_NAME "ui" $DIR_NAME
    loop_test MI_INSTS[@] $PACKAGE_NAME "mi" $DIR_NAME

    echo "[INFO] test finished, check results in $RESULT_DIR/$DIR_NAME/summary.txt"
    read
}

main $@