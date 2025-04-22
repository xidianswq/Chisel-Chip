#include "led.h"

void led_init(LED_TypeDef* LEDx, LED_InitTypeDef* LED_InitStruct){
    
}

uint32_t LED_ReadInputData(uint32_t LED_Pin){
  /* Check the parameters */
  assert_param(IS_LED_PIN(LED_Pin));

  return LED->LCR & LED_Pin;
}

uint8_t LED_ReadInputDataBit(uint32_t LED_Pin){
  /* Check the parameters */
  assert_param(IS_LED_PIN(LED_Pin));

  uint8_t bitstatus = 0x00;

  if((LED->LCR & LED_Pin) != (uint32_t)LED_Mode_OFF){
      bitstatus = (uint8_t)LED_Mode_ON;
  }
  else{
      bitstatus = (uint8_t)LED_Mode_OFF;
  }
  
  return bitstatus;
}

void LED_SetBits(uint32_t LED_Pin)
{
  /* Check the parameters */
  assert_param(IS_LED_PIN(LED_Pin));
  
  LED->LCR |= LED_Pin;
}

void LED_ResetBits(uint32_t LED_Pin)
{
  /* Check the parameters */
  assert_param(IS_LED_PIN(LED_Pin));
  
  LED->LCR &= !LED_Pin;
}
