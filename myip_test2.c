#include "xparameters.h"
#include "xgpio.h"
#include "myip.h"
#include "xtime_l.h"

int main (void)
{
  XGpio switches;
  XTime tEnd, tCur, seconds=1;
  int switches_check;
  u32 myip_BaseAddress = XPAR_MYIP_0_S_AXI_BASEADDR;

  xil_printf("-- Start of the Program --\r\n");

  XGpio_Initialize(&switches, XPAR_AXI_GPIO_0_DEVICE_ID);
  XGpio_SetDataDirection(&switches, 1, 0xffffffff);

  while (1)
  {
    XTime_GetTime(&tCur);
    tEnd  = tCur + (((XTime) seconds) * COUNTS_PER_SECOND);
    switches_check = XGpio_DiscreteRead(&switches, 1);
    MYIP_mWriteReg(myip_BaseAddress, 0, switches_check);
    xil_printf("Switch Status : %x\r\n", switches_check);
    do
    {
      XTime_GetTime(&tCur);
    } while (tCur < tEnd);
  }
}
