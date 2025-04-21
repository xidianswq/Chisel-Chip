/******************************************************************************/
/*                                                                            */
/*                            7 Segment DigtalTube                            */
/*                                                                            */
/******************************************************************************/

#ifndef _SDT_H
#define _SDT_H

#include "device.h"

#define IS_SDT_ALL_PERIPH(PERIPH) (((PERIPH) == SDTA) || \
                                   ((PERIPH) == SDTB) || \
                                   ((PERIPH) == SDTC) || \
                                   ((PERIPH) == SDTD))

void SDT_Write(SDT_TypeDef* SDTx, uint16_t PortVal);

#endif
