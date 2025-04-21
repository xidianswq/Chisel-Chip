#include "key.h"

uint32_t KEY_ReadInputData(uint32_t KEY_Pin){
    /* Check the parameters */
    assert_param(IS_KEY_PIN(KEY_Pin));

    return KEY->IDR & KEY_Pin;
}

uint8_t KEY_ReadInputDataBit(uint32_t KEY_Pin){
    /* Check the parameters */
    assert_param(IS_KEY_PIN(KEY_Pin));
    
    uint8_t bitstatus = 0x00;

    if((KEY->IDR & KEY_Pin) != (uint32_t)Bit_RESET){
        bitstatus = (uint8_t)Bit_SET;
    }
    else{
        bitstatus = (uint8_t)Bit_RESET;
    }
    
    return bitstatus;
}
