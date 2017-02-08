#include "xparameters.h"
#include "xgpio.h"
#include "myip.h"

int main (void)
{
	XGpio switches;
	int switches_check;
	u32 myip_BaseAddress = XPAR_MYIP_0_S_AXI_BASEADDR;

	print("-- Start of the Program --\r\n");

	XGpio_Initialize(&switches, XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&switches, 1, 0xffffffff);

	while (1)
	{
		switches_check = XGpio_DiscreteRead(&switches, 1);
		MYIP_mWriteReg(myip_BaseAddress, 0, switches_check);
		xil_printf("Switch Status : %x\r\n", switches_check);
		sleep(1);
	}
}
