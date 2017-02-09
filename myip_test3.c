#include "xparameters.h"
#include "xgpio.h"
#include "myip.h"
#include "xscutimer.h"

#define TIMER_DEVICE_ID	XPAR_XSCUTIMER_0_DEVICE_ID

int main (void)
{
  XGpio switches;
  int Status;
  int switches_check;
  u32 myip_BaseAddress = XPAR_MYIP_0_S_AXI_BASEADDR;
  volatile u32 CntValue = 0;
  XScuTimer Timer;
  XScuTimer_Config *ConfigPtr;
  XScuTimer *TimerInstancePtr = &Timer;

  xil_printf("-- Start of the Program --\r\n");
  XGpio_Initialize(&switches, XPAR_AXI_GPIO_0_DEVICE_ID);
  XGpio_SetDataDirection(&switches, 1, 0xffffffff);

  ConfigPtr = XScuTimer_LookupConfig(TIMER_DEVICE_ID);
  Status = XScuTimer_CfgInitialize(TimerInstancePtr, ConfigPtr,ConfigPtr->BaseAddr);
  if (Status != XST_SUCCESS){
    return XST_FAILURE;
  }

  XScuTimer_LoadTimer(TimerInstancePtr,
  XPAR_PS7_CORTEXA9_0_CPU_CLK_FREQ_HZ/2);
  XScuTimer_Start(TimerInstancePtr);

  while (1){
    CntValue = XScuTimer_GetCounterValue(TimerInstancePtr);
    if (CntValue == 0){
      XScuTimer_RestartTimer(TimerInstancePtr);
      switches_check = XGpio_DiscreteRead(&switches, 1);
      MYIP_mWriteReg(myip_BaseAddress, 0, switches_check);
      xil_printf("Switch Status : %x\r\n", switches_check);
    }
  }
}
