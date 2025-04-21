/******************************************************************************/
/*                                                                            */
/*                                   KEY                                      */
/*                                                                            */
/******************************************************************************/

#ifndef KEY_H
#define KEY_H

#include "device.h"

typedef enum
{
    Bit_RESET = 0,
    Bit_SET
}BitAction;

/*******************  Bit definition for KEY register  *******************/
#define KEY_Pin_0                       ((uint32_t)0x00000001)            /* KEY0  selected*/
#define KEY_Pin_1                       ((uint32_t)0x00000002)            /* KEY1  selected*/
#define KEY_Pin_2                       ((uint32_t)0x00000004)            /* KEY2  selected*/
#define KEY_Pin_3                       ((uint32_t)0x00000008)            /* KEY3  selected*/
#define KEY_Pin_4                       ((uint32_t)0x00000010)            /* KEY4  selected*/
#define KEY_Pin_5                       ((uint32_t)0x00000020)            /* KEY5  selected*/
#define KEY_Pin_6                       ((uint32_t)0x00000040)            /* KEY6  selected*/
#define KEY_Pin_7                       ((uint32_t)0x00000080)            /* KEY7  selected*/
#define KEY_Pin_8                       ((uint32_t)0x00000100)            /* KEY8  selected*/
#define KEY_Pin_9                       ((uint32_t)0x00000200)            /* KEY9  selected*/
#define KEY_Pin_10                      ((uint32_t)0x00000400)            /* KEY10 selected*/
#define KEY_Pin_11                      ((uint32_t)0x00000800)            /* KEY11 selected*/
#define KEY_Pin_12                      ((uint32_t)0x00001000)            /* KEY12 selected*/
#define KEY_Pin_13                      ((uint32_t)0x00002000)            /* KEY13 selected*/
#define KEY_Pin_14                      ((uint32_t)0x00004000)            /* KEY14 selected*/
#define KEY_Pin_15                      ((uint32_t)0x00008000)            /* KEY15 selected*/
#define KEY_Pin_16                      ((uint32_t)0x00010000)            /* KEY16 selected*/
#define KEY_Pin_17                      ((uint32_t)0x00020000)            /* KEY17 selected*/
#define KEY_Pin_18                      ((uint32_t)0x00040000)            /* KEY18 selected*/
#define KEY_Pin_19                      ((uint32_t)0x00080000)            /* KEY19 selected*/
#define KEY_Pin_20                      ((uint32_t)0x00100000)            /* KEY20 selected*/
#define KEY_Pin_21                      ((uint32_t)0x00200000)            /* KEY21 selected*/
#define KEY_Pin_22                      ((uint32_t)0x00400000)            /* KEY22 selected*/
#define KEY_Pin_23                      ((uint32_t)0x00800000)            /* KEY23 selected*/
#define KEY_Pin_24                      ((uint32_t)0x01000000)            /* KEY24 selected*/
#define KEY_Pin_25                      ((uint32_t)0x02000000)            /* KEY25 selected*/
#define KEY_Pin_26                      ((uint32_t)0x04000000)            /* KEY26 selected*/
#define KEY_Pin_27                      ((uint32_t)0x08000000)            /* KEY27 selected*/
#define KEY_Pin_28                      ((uint32_t)0x10000000)            /* KEY28 selected*/
#define KEY_Pin_29                      ((uint32_t)0x20000000)            /* KEY29 selected*/
#define KEY_Pin_30                      ((uint32_t)0x40000000)            /* KEY30 selected*/
#define KEY_Pin_31                      ((uint32_t)0x80000000)            /* KEY31 selected*/
#define KEYA_Pin_ALL                    ((uint32_t)0x000000FF)            /* All KEYA selected*/
#define KEYB_Pin_ALL                    ((uint32_t)0x0000FF00)            /* All KEYB selected*/
#define KEYC_Pin_ALL                    ((uint32_t)0x00FF0000)            /* All KEYC selected*/
#define KEYD_Pin_ALL                    ((uint32_t)0xFF000000)            /* All KEYD selected*/
#define KEY_Pin_ALL                     ((uint32_t)0xFFFFFFFF)            /* All KEYs selected*/

#define IS_KEY_PIN(PIN) ((PIN & (uint32_t)0x00) == 0x00 && (PIN != (uint32_t)0x00))

uint32_t KEY_ReadInputData(uint32_t KEY_Pin);
uint8_t KEY_ReadInputDataBit(uint32_t KEY_Pin);

#endif
