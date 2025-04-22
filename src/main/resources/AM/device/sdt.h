/******************************************************************************/
/*                                                                            */
/*                            7 Segment DigtalTube                            */
/*                                                                            */
/******************************************************************************/

#ifndef _SDT_H
#define _SDT_H

#include "device.h"

#define IS_SDT_ALL_PERIPH(PERIPH) (((PERIPH) == SDTA) || \
                                   ((PERIPH) == SDTB)

void SDT_Write(SDT_TypeDef* SDTx, uint32_t PortVal);

#endif
