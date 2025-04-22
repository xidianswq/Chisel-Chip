#include "sdt.h"

void SDT_Write(SDT_TypeDef* SDTx, uint32_t PortVal)
{
  /* Check the parameters */
  assert_param(IS_SDT_ALL_PERIPH(SDTx));
  
  SDTx->ODR = PortVal;
}
