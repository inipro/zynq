#include "xparameters.h"
#include "xgpio.h"

int main (void)
{
  XGpio switches, leds;
  int switches_check;

  print("-- Start of the Program --\r\n");

  XGpio_Initialize(&switches, XPAR_SWITCHES_DEVICE_ID);
  XGpio_SetDataDirection(&switches, 1, 0xffffffff);

  XGpio_Initialize(&leds, XPAR_LEDS_DEVICE_ID);
  XGpio_SetDataDirection(&leds, 1, 0x00000000);

  while (1)
  {
    switches_check = XGpio_DiscreteRead(&switches, 1);
    XGpio_DiscreteWrite(&leds, 1, switches_check);
    xil_printf("Switch Status : %x\r\n", switches_check);
    sleep(1);
  }
}
