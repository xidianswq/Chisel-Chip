OUTPUT_ARCH( "riscv" )
ENTRY(_start)
 
PROVIDE( _stack_size = __stack_size );

MEMORY
{
	RAM (xrw) : ORIGIN = 0x00000000, LENGTH = 64K
	Periph (xrw) : o = 0x00010000, l = 64K
}

SECTIONS
{
  . = 0x00000000;
  .text.init : { *(.text.init) } >RAM AT>RAM
  . = ALIGN(4);
  .tohost : { *(.tohost) } >RAM AT>RAM
  . = ALIGN(4);
  .text : { *(.text) } >RAM AT>RAM
  . = ALIGN(4);
  .data : { *(.data) } >RAM AT>RAM
  .bss : { *(.bss) } >RAM AT>RAM
  _stack_top = ORIGIN(RAM) + LENGTH(RAM);  /* 栈顶地址（高地址） */
  _stack_size = 2K;                        /* 栈大小 */
  _stack_end = _stack_top - _stack_size;   /* 栈底地址（低地址） */
  . = _stack_end;
  .stack _stack_end :
  {
    . = ALIGN(4);
    . = . + _stack_size;
    _sp = .;
  } >RAM AT>RAM
}

