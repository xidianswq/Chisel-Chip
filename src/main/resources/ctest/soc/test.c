#include <stdio.h>
#include "device/device.h"
#include "device/led.h"
#include "device/key.h"
#include "device/sdt.h"

int main()
{
    unsigned int a = 0;
    unsigned int b = 0;
    unsigned int c = 0;
    unsigned int d = 0;
    while (1)
    {
        LED_SetBits(LED_Pin_ALL);
        a = KEY_ReadInputData(KEYA_Pin_ALL);
        b = KEY_ReadInputData(KEYB_Pin_ALL) >> 8;
        c = a + (b << 16);
        d = a + b;
        LED_ResetBits(LED_Pin_ALL);
        SDT_Write(SDTA, c);
        SDT_Write(SDTB, d);
    }

    asm volatile("unimp");
    return 0;
}
