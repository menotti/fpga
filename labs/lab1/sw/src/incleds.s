.text
	li x1, 0
    li x2, 0x400004 /*  LEDs */
    li x3, 0x400008 /* 7SEGs */
    li x4, 0x400010 /*   SWs */
loop:
    lw x5, 0(x4)
    add x1, x1, x5
    sw x1, 0(x2)
    sw x1, 0(x3)
    jal loop
