OUTPUT_ARCH( "riscv" )
ENTRY(_start)


__stack_size = 1024;

PROVIDE( _stack_size = __stack_size );

MEMORY
{
	RAM (xrw) : ORIGIN = 0x00000000, LENGTH = 8K
}

PROVIDE(_stack_pointer = ORIGIN(RAM) + LENGTH(RAM));

SECTIONS
{
    . = 0x00000000;
    .text : { *(.text) }
  

    .stack ORIGIN(RAM) + LENGTH(RAM) - __stack_size :
    {
        . = ALIGN(4);
        PROVIDE(_susrstack = . );
        . = . + __stack_size;
        PROVIDE( _eusrstack = .);
    } >RAM 
    
}
