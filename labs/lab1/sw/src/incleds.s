.text
	li x1, 0
    li x2, 0x400004 /*  LEDs */
    li x3, 0x400008 /* 7SEGs */
loop:
    sw x1, 0(x2)
    sw x1, 0(x3)
    addi x1, x1, 1
    jal loop
