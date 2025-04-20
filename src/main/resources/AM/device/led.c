#include "led.h"

void led_init(LED_TypeDef* LEDx, LED_InitTypeDef* LED_InitStruct){
    
}

void LED_SetBits(uint32_t LED_Pin)
{
  /* Check the parameters */
  assert_param(IS_LED_PIN(LED_Pin));
  
  LED->LCR |= LED_Pin;
}

void LED_ReSetBits(uint32_t LED_Pin)
{
  /* Check the parameters */
  assert_param(IS_LED_PIN(LED_Pin));
  
  LED->LCR &= !LED_Pin;
}