.text
    xor x1,  x1, x1
    li  x2, 0x400000 /* MMIO */
loop:
    lw  x5, 0x10(x2) /* SWs */
    add x1,  x1, x5
    sw  x1, 0x04(x2) /* LEDs */
    sw  x1, 0x08(x2) /* 7SEGs */
    j loop

