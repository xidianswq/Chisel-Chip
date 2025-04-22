#ifndef _DEVICE_H
#define _DEVICE_H
#include <stdint.h>

#define     __I     volatile                  /*!< defines 'read only' permissions      */
#define     __O     volatile                  /*!< defines 'write only' permissions     */
#define     __IO    volatile                  /*!< defines 'read / write' permissions   */

/* LED Control Register (32 LEDs) */
typedef struct
{
  __IO uint32_t LCR;                          /* Offset: 0x000  LED Control Register (32 LEDs) */
} LED_TypeDef;

/* KEY Inputdata Register (32 Keys) */
typedef struct
{
  __I uint32_t IDR;                           /* Offset: 0x000  KEY Inputdata Register (32 Keys) */
} KEY_TypeDef;

/* 7 Segment DigtalTube Outputdata Register (32 LEDs) */
typedef struct
{
  __IO uint32_t ODR;                          /* Offset: 0x000  DigtalTube Outputdata Register */
} SDT_TypeDef;

/* USART Control Register */
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


#define SRAM_BASE           ((uint32_t)0x00000000) /* FLASH base address in the alias region */
#define PERIPH_BASE         ((uint32_t)0x00010000) /* Peripheral base address in the alias region */

/*!< Peripheral memory map */
#define APB1PERIPH_BASE     PERIPH_BASE
#define APB2PERIPH_BASE     (PERIPH_BASE + 0x10000)

#define LED_BASE            (APB1PERIPH_BASE + 0x0000)
#define KEY_BASE            (APB1PERIPH_BASE + 0x0400)
#define SDT_BASE            (APB1PERIPH_BASE + 0x0800)
#define USART_BASE          (APB2PERIPH_BASE + 0x0400)

#define LED                 ((LED_TypeDef *) LED_BASE) /* LED base address */
#define KEY                 ((KEY_TypeDef *) KEY_BASE) /* KEY base address */
#define SDTA                ((SDT_TypeDef *) (SDT_BASE + 0x000)) /* SDT A base address */
#define SDTB                ((SDT_TypeDef *) (SDT_BASE + 0x004)) /* SDT B base address */
#define USART               ((USART_TypeDef *) USART_BASE) /* USART base address */

#define assert_param(expr) ((void)0)

#endif
