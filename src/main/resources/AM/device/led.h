/******************************************************************************/
/*                                                                            */
/*                                   LED                                      */
/*                                                                            */
/******************************************************************************/

#ifndef _LED_H
#define _LED_H

#include "device.h"

typedef enum
{ 
    LED_Mode_ON   = 0x0,
    LED_Mode_OFF  = 0x1,
} LEDMode_TypeDef;

typedef struct
{
    LEDMode_TypeDef LED_Mode;
} LED_InitTypeDef;

/*******************  Bit definition for LED register  *******************/
#define  LED_Pin_0                      ((uint32_t)0x00000001)            /*!< LED0  selected*/
#define  LED_Pin_1                      ((uint32_t)0x00000002)            /*!< LED1  selected*/
#define  LED_Pin_2                      ((uint32_t)0x00000004)            /*!< LED2  selected*/
#define  LED_Pin_3                      ((uint32_t)0x00000008)            /*!< LED3  selected*/
#define  LED_Pin_4                      ((uint32_t)0x00000010)            /*!< LED4  selected*/
#define  LED_Pin_5                      ((uint32_t)0x00000020)            /*!< LED5  selected*/
#define  LED_Pin_6                      ((uint32_t)0x00000040)            /*!< LED6  selected*/
#define  LED_Pin_7                      ((uint32_t)0x00000080)            /*!< LED7  selected*/
#define  LED_Pin_8                      ((uint32_t)0x00000100)            /*!< LED8  selected*/
#define  LED_Pin_9                      ((uint32_t)0x00000200)            /*!< LED9  selected*/
#define  LED_Pin_10                     ((uint32_t)0x00000400)            /*!< LED10 selected*/
#define  LED_Pin_11                     ((uint32_t)0x00000800)            /*!< LED11 selected*/
#define  LED_Pin_12                     ((uint32_t)0x00001000)            /*!< LED12 selected*/
#define  LED_Pin_13                     ((uint32_t)0x00002000)            /*!< LED13 selected*/
#define  LED_Pin_14                     ((uint32_t)0x00004000)            /*!< LED14 selected*/
#define  LED_Pin_15                     ((uint32_t)0x00008000)            /*!< LED15 selected*/
#define  LED_Pin_16                     ((uint32_t)0x00010000)            /*!< LED16 selected*/
#define  LED_Pin_17                     ((uint32_t)0x00020000)            /*!< LED17 selected*/
#define  LED_Pin_18                     ((uint32_t)0x00040000)            /*!< LED18 selected*/
#define  LED_Pin_19                     ((uint32_t)0x00080000)            /*!< LED19 selected*/
#define  LED_Pin_20                     ((uint32_t)0x00100000)            /*!< LED20 selected*/
#define  LED_Pin_21                     ((uint32_t)0x00200000)            /*!< LED21 selected*/
#define  LED_Pin_22                     ((uint32_t)0x00400000)            /*!< LED22 selected*/
#define  LED_Pin_23                     ((uint32_t)0x00800000)            /*!< LED23 selected*/
#define  LED_Pin_24                     ((uint32_t)0x01000000)            /*!< LED24 selected*/
#define  LED_Pin_25                     ((uint32_t)0x02000000)            /*!< LED25 selected*/
#define  LED_Pin_26                     ((uint32_t)0x04000000)            /*!< LED26 selected*/
#define  LED_Pin_27                     ((uint32_t)0x08000000)            /*!< LED27 selected*/
#define  LED_Pin_28                     ((uint32_t)0x10000000)            /*!< LED28 selected*/
#define  LED_Pin_29                     ((uint32_t)0x20000000)            /*!< LED29 selected*/
#define  LED_Pin_30                     ((uint32_t)0x40000000)            /*!< LED30 selected*/
#define  LED_Pin_31                     ((uint32_t)0x80000000)            /*!< LED31 selected*/
#define  LED_ALL                        ((uint32_t)0xFFFFFFFF)            /*!< All LEDs selected*/

#define IS_LED_PIN(PIN) ((PIN & (uint32_t)0x00) == 0x00 && (PIN != (uint32_t)0x00))

void LED_SetBits(uint32_t LED_Pin);
void LED_ReSetBits(uint32_t LED_Pin);

#endif _LED_H