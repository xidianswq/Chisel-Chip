#include <stdio.h>
#include "led.h"
int main()
{
    while(1){
        LED_SetBits(LED_Pin_0);
        LED_SetBits(LED_Pin_1);
        LED_SetBits(LED_Pin_2);
        LED_SetBits(LED_Pin_3);
        LED_ReSetBits(LED_Pin_0);
        LED_ReSetBits(LED_Pin_1);
        LED_ReSetBits(LED_Pin_2);
        LED_ReSetBits(LED_Pin_3);
    }
    asm volatile("unimp");
    return 0;
}
