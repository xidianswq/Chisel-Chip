package soc

import chisel3._
import public.PConsts._

/*  
name: Device_configuration_Constants
note: Constants for MMU & peripherals
*/
object DConsts {
  val SRAM_SIZE       = 0x00010000.U(WORD_LEN.W) // SRAM size (1GB)
  val PERIPH_SIZE     = 0x00010000.U(WORD_LEN.W) // Peripheral size (64KB)

  val SRAM_BASE       = 0x00000000.U(WORD_LEN.W) // SRAM base address
  val PERIPH_BASE     = 0x00010000.U(WORD_LEN.W) // Peripheral base address

  val APB1PERIPH_BASE = PERIPH_BASE // APB1 peripheral base address
  //val APB2PERIPH_BASE = (PERIPH_BASE + 0x00010000.U(WORD_LEN.W)) // APB2 peripheral base address

  val LED_BASE        = (APB1PERIPH_BASE + 0x00000000.U(WORD_LEN.W)) // LED base address
  val USART_BASE      = (APB1PERIPH_BASE + 0x00000400.U(WORD_LEN.W)) // USART base address

}

object LED_Consts {
  val LED_WIDTH = 32 // LED width
}