OUTPUT_ARCH( "riscv" )
ENTRY(_start)

__stack_size = 2048;

PROVIDE( _stack_size = __stack_size );


MEMORY
{
	RAM (xrw) : ORIGIN = 0x00000000, LENGTH = 16K
}

SECTIONS
{
  . = 0x00000000;
  .text : { *(.text) }
  .stack ORIGIN(RAM) + LENGTH(RAM) - __stack_size :
    {
        PROVIDE( _heap_end = . );
        . = ALIGN(4);
        PROVIDE(_susrstack = . );
        . = . + __stack_size;
        PROVIDE( _eusrstack = .);
    } >RAM 
}
