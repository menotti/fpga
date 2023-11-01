.text
    li x2, 0x400004 /*  LEDs */
    li x3, 0x400008 /* 7SEGs */
    li x4, 0x400010 /*   SWs */
    li x5, 0xFF
loop:
    lw x1, 0(x4)
    ble x1, x5, led
segs:
    sw x1, 0(x3)
    jal loop
led:    
    sw x1, 0(x2)
    jal loop