.text
    li x2, 0x400004 /*  LEDs */
    li x3, 0x400008 /* 7SEGs */
    li x4, 0x400010 /*   SWs */
loop:
    lw x1, 0(x4)
    sw x1, 0(x2)
    sw x1, 0(x3)
    jal loop
