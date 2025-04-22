.section .text.init
.globl _start
.type _start, @function
_start:
    /* 1. 初始化栈指针 */
    la sp, _sp             /* 从链接脚本加载栈顶地址到 sp 寄存器 */

    call main
