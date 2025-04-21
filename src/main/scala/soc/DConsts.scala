package soc

import chisel3._
import public.PConsts._

/*  
name: Device_configuration_Constants
note: Constants for MMU & peripherals
*/
object DConsts {
  val SRAM_BASE       = 0x00000000.U(WORD_LEN.W)        // SRAM base address
  val SRAM_SIZE       = 0x00010000.U(WORD_LEN.W)        // SRAM size (64KB)

  val PERIPH_BASE     = 0x00010000.U(WORD_LEN.W)        // Peripheral base address
  val PERIPH_SIZE     = 0x00010000.U(WORD_LEN.W)        // Peripheral size (64KB)
  val APB1PERIPH_BASE = PERIPH_BASE                     // APB1 peripheral base address
  // val APB2PERIPH_BASE = (PERIPH_BASE + PERIPH_SIZE)     // APB2 peripheral base address
  val APB2PERIPH_BASE = 0x00020000.U(WORD_LEN.W)        // APB2 peripheral base address

  val PERIPH_SIZE_1   = 0x00000400.U(WORD_LEN.W)        // Peripheral size (1KB)
  // val LED_BASE        = (APB1PERIPH_BASE + 0x00000000.U(WORD_LEN.W))  // LED base address
  val LED_BASE        = 0x00010000.U(WORD_LEN.W)        // LED base address
  // val KEY_BASE        = (APB1PERIPH_BASE + 0x00000400.U(WORD_LEN.W))  // KEY base address
  val KEY_BASE        = 0x00010400.U(WORD_LEN.W)        // KEY base address
  // val SDT_BASE        = (APB1PERIPH_BASE + 0x00000800.U(WORD_LEN.W))  // SDT base address
  val SDT_BASE        = 0x00010800.U(WORD_LEN.W)        // SDT base address
  val SDT_END         = 0x00010808.U(WORD_LEN.W)        // SDT end address

  // val USART_BASE      = (APB2PERIPH_BASE + 0x00000000.U(WORD_LEN.W))  // USART base address
  val UART_BASE       = 0x00020000.U(WORD_LEN.W)        // UART base address


  val LED_SIZE        = 32
  val KEY_SIZE        = 32
  val SDT_SIZE        = 16
}
