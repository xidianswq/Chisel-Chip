#include <stdio.h>
#include <stdint.h>

#define     __I     volatile                  /*!< defines 'read only' permissions      */
#define     __O     volatile                  /*!< defines 'write only' permissions     */
#define     __IO    volatile                  /*!< defines 'read / write' permissions   */

/*!< LED Control Register (32 LEDs) */
typedef struct
{
  __IO uint32_t LCR;                          /*!< Offset: 0x000  LED Control Register (32 LEDs) */
}  LED_TypeDef;

/*!< USART Control Register */
typedef struct
{
  __IO uint16_t SR;
  uint16_t  RESERVED0;
  __IO uint16_t DR;
  uint16_t  RESERVED1;
  __IO uint16_t BRR;
  uint16_t  RESERVED2;
  __IO uint16_t CR1;
  uint16_t  RESERVED3;
  __IO uint16_t CR2;
  uint16_t  RESERVED4;
  __IO uint16_t CR3;
  uint16_t  RESERVED5;
  __IO uint16_t GTPR;
  uint16_t  RESERVED6;
} USART_TypeDef;


#define SRAM_BASE           ((uint32_t)0x00000000) /*!< FLASH base address in the alias region */
#define PERIPH_BASE         ((uint32_t)0x00010000) /*!< Peripheral base address in the alias region */

/*!< Peripheral memory map */
#define APB1PERIPH_BASE     PERIPH_BASE
//#define APB2PERIPH_BASE     (PERIPH_BASE + 0x10000)

#define LED_BASE            (APB1PERIPH_BASE + 0x0000)
#define USART_BASE          (APB1PERIPH_BASE + 0x0400)

#define LED                 ((LED_TypeDef *) LED_BASE) /*!< LED base address */
#define USART               ((USART_TypeDef *) USART_BASE) /*!< USART base address */

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

int main()
{
    while(1){
        LED->LCR |= (LED_Pin_0);
        LED->LCR |= (LED_Pin_1);
        LED->LCR |= (LED_Pin_2);
        LED->LCR |= (LED_Pin_3);
        LED->LCR &= !(LED_Pin_0);
        LED->LCR &= !(LED_Pin_1);
        LED->LCR &= !(LED_Pin_2);
        LED->LCR &= !(LED_Pin_3);
    }
    asm volatile("unimp");
    return 0;
}
