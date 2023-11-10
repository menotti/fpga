.data
univ:
        .space   76800
b1:
        .space   320
b2:
        .space   320
tail:
        .space   320
head:
        .space   320

.text
main:
        li      a0, 0
        lui     a1, %hi(univ)
        addi    a1, a1, %lo(univ)
        li      s0, 272
        li      a6, 320
.LBB0_1:                                # =>This Loop Header: Depth=1
        li      a4, 240
        mv      a5, a1
.LBB0_2:                                #   Parent Loop BB0_1 Depth=1
        srli    s1, s0, 16
        srli    a3, s0, 14
        xor     a3, a3, s1
        srli    a2, s0, 13
        srli    s1, s0, 11
        xor     a2, a2, s1
        xor     a2, a2, a3
        andi    a2, a2, 1
        slli    s0, s0, 1
        or      s0, s0, a2
        sb      a2, 0(a5)
        addi    a4, a4, -1
        addi    a5, a5, 320
        bnez    a4, .LBB0_2
        addi    a0, a0, 1
        addi    a1, a1, 1
        bne     a0, a6, .LBB0_1
        lui     a0, 19
        addi    s6, a0, -1344
        lui     a0, %hi(head)
        addi    s3, a0, %lo(head)
        lui     a0, %hi(univ)
        addi    s10, a0, %lo(univ)
        li      s8, 320
        add     a0, s10, s6
        sw      a0, 8(sp)                       # 4-byte Folded Spill
        lui     a0, %hi(tail)
        addi    s9, a0, %lo(tail)
        lui     a0, %hi(b1)
        addi    s11, a0, %lo(b1)
        lui     a0, %hi(b2)
        addi    s2, a0, %lo(b2)
        li      s7, 239
.LBB0_5:                                # =>This Loop Header: Depth=1
        li      a2, 320
        mv      a0, s3
        mv      a1, s10
        call    memcpy@plt
        li      a2, 320
        mv      a0, s9
        lw      a1, 8(sp)                       # 4-byte Folded Reload
        call    memcpy@plt
        li      a7, 0
        mv      a6, s10
.LBB0_6:                                #   Parent Loop BB0_5 Depth=1
        li      s1, 0
        mul     t1, a7, s8
        addi    t0, t1, 320
        mv      a5, a6
        mv      a1, s11
.LBB0_7:                                #   Parent Loop BB0_5 Depth=1
        addi    a4, s1, -1
        mv      a3, a4
        bnez    s1, .LBB0_9
        li      a3, 319
.LBB0_9:                                #   in Loop: Header=BB0_7 Depth=3
        add     a0, s9, a3
        lbu     t2, 0(a0)
        add     a2, s9, s1
        lbu     a2, 0(a2)
        addi    a4, a4, -318
        seqz    a4, a4
        addi    s1, s1, 1
        addi    a4, a4, -1
        and     a4, a4, s1
        add     a0, s9, a4
        add     s0, a3, t1
        add     s0, s0, s10
        lbu     s0, 0(s0)
        lbu     a0, 0(a0)
        add     a2, a2, t2
        add     a2, a2, s0
        add     a0, a0, a2
        add     a2, s10, t1
        add     a2, a2, a4
        lbu     a2, 0(a2)
        add     a3, a3, t0
        add     a3, a3, s10
        lbu     a3, 0(a3)
        add     s0, s10, t0
        add     a4, a4, s0
        lbu     s0, 320(a5)
        lbu     a4, 0(a4)
        add     a2, a2, a3
        add     a0, a0, a2
        lbu     a2, 0(a5)
        add     a4, a4, s0
        add     a0, a0, a4
        andi    a0, a0, 255
        or      a0, a0, a2
        addi    a0, a0, -3
        seqz    a0, a0
        sb      a0, 0(a1)
        addi    a1, a1, 1
        addi    a5, a5, 1
        bne     s1, s8, .LBB0_7
        li      a1, 320
        mv      a2, s9
        mv      a3, a6
        mv      a4, s11
        mv      a5, s2
.LBB0_11:                               #   Parent Loop BB0_5 Depth=1
        lbu     a0, 0(a3)
        sb      a0, 0(a2)
        beqz    a7, .LBB0_13
        lbu     a0, 0(a5)
        sb      a0, -320(a3)
.LBB0_13:                               #   in Loop: Header=BB0_11 Depth=3
        lbu     a0, 0(a4)
        sb      a0, 0(a5)
        addi    a1, a1, -1
        addi    a5, a5, 1
        addi    a4, a4, 1
        addi    a3, a3, 1
        addi    a2, a2, 1
        bnez    a1, .LBB0_11
        addi    a7, a7, 1
        addi    a6, a6, 320
        bne     a7, s7, .LBB0_6
        li      a0, 0
        lui     a7, 19
        lui     t0, %hi(univ)
        lui     t1, %hi(tail)
        lui     t2, %hi(b2)
.LBB0_16:                               #   Parent Loop BB0_5 Depth=1
        addi    a2, a0, -1
        mv      a1, a2
        bnez    a0, .LBB0_18
        li      a1, 319
.LBB0_18:                               #   in Loop: Header=BB0_16 Depth=2
        addi    a3, t1, %lo(tail)
        add     a4, a3, a1
        lbu     a6, 0(a4)
        add     a5, a3, a0
        lbu     a5, 0(a5)
        addi    a2, a2, -318
        seqz    a2, a2
        addi    s1, a0, 1
        addi    a2, a2, -1
        and     a2, a2, s1
        add     a3, a3, a2
        lbu     a3, 0(a3)
        add     s0, a1, s6
        addi    s5, t0, %lo(univ)
        add     s0, s0, s5
        lbu     s0, 0(s0)
        add     a4, s5, s6
        add     a4, a4, a2
        lbu     a4, 0(a4)
        add     a1, a1, s3
        lbu     a1, 0(a1)
        add     a5, a5, a6
        add     a5, a5, s0
        add     a3, a3, a5
        add     a1, a1, a4
        add     a1, a1, a3
        add     a3, s3, a0
        lbu     a3, 0(a3)
        add     a2, a2, s3
        lbu     a2, 0(a2)
        add     a4, s5, a0
        add     a4, a4, a7
        lbu     a4, -1344(a4)
        add     a2, a2, a3
        add     a1, a1, a2
        andi    a1, a1, 255
        or      a1, a1, a4
        addi    a1, a1, -3
        seqz    a1, a1
        addi    s4, t2, %lo(b2)
        add     a0, a0, s4
        sb      a1, 0(a0)
        mv      a0, s1
        bne     s1, s8, .LBB0_16
        addi    a0, a7, -1664
        add     a0, a0, s5
        lui     a1, %hi(b1)
        addi    a1, a1, %lo(b1)
        li      a2, 320
        call    memcpy@plt
        add     a0, s5, s6
        li      a2, 320
        mv      a1, s4
        call    memcpy@plt
        j       .LBB0_5