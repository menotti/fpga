/* 
 * Generated with: https://godbolt.org/z/EaEbTPKxe
 * List instuctions with: awk '{print $1}' game.s | grep -v ':' | grep -v zero | sort -u
 */
univ:
        .zero   307200
b1:
        .zero   640
b2:
        .zero   640
tail:
        .zero   640
head:
        .zero   640
n:
        .zero   1
main:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        sw      zero,-20(s0)
        j       .L2
.L3:
        lui     a5,%hi(univ)
        addi    a4,a5,%lo(univ)
        lw      a5,-20(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(head)
        addi    a3,a5,%lo(head)
        lw      a5,-20(s0)
        add     a5,a3,a5
        sb      a4,0(a5)
        lw      a4,-20(s0)
        li      a5,151552
        addi    a5,a5,1728
        add     a5,a4,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(tail)
        addi    a3,a5,%lo(tail)
        lw      a5,-20(s0)
        add     a5,a3,a5
        sb      a4,0(a5)
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L2:
        lw      a4,-20(s0)
        li      a5,639
        ble     a4,a5,.L3
        sw      zero,-24(s0)
        j       .L4
.L22:
        sw      zero,-28(s0)
        j       .L5
.L18:
        lw      a5,-28(s0)
        beq     a5,zero,.L6
        lw      a5,-28(s0)
        addi    a5,a5,-1
        j       .L7
.L6:
        li      a5,639
.L7:
        lui     a4,%hi(tail)
        addi    a4,a4,%lo(tail)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(tail)
        addi    a3,a5,%lo(tail)
        lw      a5,-28(s0)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lw      a3,-28(s0)
        li      a5,639
        beq     a3,a5,.L8
        lw      a5,-28(s0)
        addi    a5,a5,1
        j       .L9
.L8:
        li      a5,0
.L9:
        lui     a3,%hi(tail)
        addi    a3,a3,%lo(tail)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lw      a5,-24(s0)
        slli    a3,a5,6
        lw      a5,-24(s0)
        slli    a5,a5,8
        add     a3,a3,a5
        lw      a5,-28(s0)
        beq     a5,zero,.L10
        lw      a5,-28(s0)
        addi    a5,a5,-1
        j       .L11
.L10:
        li      a5,639
.L11:
        add     a5,a5,a3
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lw      a5,-24(s0)
        slli    a3,a5,6
        lw      a5,-24(s0)
        slli    a5,a5,8
        add     a3,a3,a5
        lw      a2,-28(s0)
        li      a5,639
        beq     a2,a5,.L12
        lw      a5,-28(s0)
        addi    a5,a5,1
        j       .L13
.L12:
        li      a5,0
.L13:
        add     a5,a5,a3
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lw      a5,-24(s0)
        addi    a5,a5,1
        slli    a3,a5,6
        lw      a5,-24(s0)
        addi    a5,a5,1
        slli    a5,a5,8
        add     a3,a3,a5
        lw      a5,-28(s0)
        beq     a5,zero,.L14
        lw      a5,-28(s0)
        addi    a5,a5,-1
        j       .L15
.L14:
        li      a5,639
.L15:
        add     a5,a5,a3
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lw      a5,-24(s0)
        addi    a5,a5,1
        slli    a3,a5,6
        lw      a5,-24(s0)
        addi    a5,a5,1
        slli    a5,a5,8
        add     a3,a3,a5
        lw      a5,-28(s0)
        add     a5,a3,a5
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lw      a5,-24(s0)
        addi    a5,a5,1
        slli    a3,a5,6
        lw      a5,-24(s0)
        addi    a5,a5,1
        slli    a5,a5,8
        add     a3,a3,a5
        lw      a2,-28(s0)
        li      a5,639
        beq     a2,a5,.L16
        lw      a5,-28(s0)
        addi    a5,a5,1
        j       .L17
.L16:
        li      a5,0
.L17:
        add     a5,a5,a3
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lui     a5,%hi(n)
        sb      a4,%lo(n)(a5)
        lw      a5,-24(s0)
        slli    a4,a5,6
        lw      a5,-24(s0)
        slli    a5,a5,8
        add     a4,a4,a5
        lw      a5,-28(s0)
        add     a5,a4,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(n)
        lbu     a5,%lo(n)(a5)
        or      a5,a4,a5
        andi    a5,a5,0xff
        addi    a5,a5,-3
        seqz    a5,a5
        andi    a5,a5,0xff
        mv      a3,a5
        lui     a5,%hi(b1)
        addi    a4,a5,%lo(b1)
        lw      a5,-28(s0)
        add     a5,a4,a5
        sb      a3,0(a5)
        lw      a5,-28(s0)
        addi    a5,a5,1
        sw      a5,-28(s0)
.L5:
        lw      a4,-28(s0)
        li      a5,639
        ble     a4,a5,.L18
        sw      zero,-32(s0)
        j       .L19
.L21:
        lw      a5,-24(s0)
        slli    a4,a5,6
        lw      a5,-24(s0)
        slli    a5,a5,8
        add     a4,a4,a5
        lw      a5,-32(s0)
        add     a5,a4,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(tail)
        addi    a3,a5,%lo(tail)
        lw      a5,-32(s0)
        add     a5,a3,a5
        sb      a4,0(a5)
        lw      a5,-24(s0)
        ble     a5,zero,.L20
        lw      a5,-24(s0)
        addi    a5,a5,-1
        slli    a4,a5,6
        lw      a5,-24(s0)
        addi    a5,a5,-1
        slli    a5,a5,8
        add     a4,a4,a5
        lw      a5,-32(s0)
        add     a5,a4,a5
        lui     a4,%hi(b2)
        addi    a3,a4,%lo(b2)
        lw      a4,-32(s0)
        add     a4,a3,a4
        lbu     a4,0(a4)
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        sb      a4,0(a5)
.L20:
        lui     a5,%hi(b1)
        addi    a4,a5,%lo(b1)
        lw      a5,-32(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(b2)
        addi    a3,a5,%lo(b2)
        lw      a5,-32(s0)
        add     a5,a3,a5
        sb      a4,0(a5)
        lw      a5,-32(s0)
        addi    a5,a5,1
        sw      a5,-32(s0)
.L19:
        lw      a4,-32(s0)
        li      a5,639
        ble     a4,a5,.L21
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
.L4:
        lw      a4,-24(s0)
        li      a5,478
        ble     a4,a5,.L22
        sw      zero,-36(s0)
        j       .L23
.L36:
        lw      a5,-36(s0)
        beq     a5,zero,.L24
        lw      a5,-36(s0)
        addi    a5,a5,-1
        j       .L25
.L24:
        li      a5,639
.L25:
        lui     a4,%hi(tail)
        addi    a4,a4,%lo(tail)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(tail)
        addi    a3,a5,%lo(tail)
        lw      a5,-36(s0)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lw      a3,-36(s0)
        li      a5,639
        beq     a3,a5,.L26
        lw      a5,-36(s0)
        addi    a5,a5,1
        j       .L27
.L26:
        li      a5,0
.L27:
        lui     a3,%hi(tail)
        addi    a3,a3,%lo(tail)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lw      a5,-36(s0)
        beq     a5,zero,.L28
        lw      a3,-36(s0)
        li      a5,151552
        addi    a5,a5,1727
        add     a5,a3,a5
        j       .L29
.L28:
        li      a5,155648
        addi    a5,a5,-1729
.L29:
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lw      a3,-36(s0)
        li      a5,639
        beq     a3,a5,.L30
        lw      a3,-36(s0)
        li      a5,151552
        addi    a5,a5,1729
        add     a5,a3,a5
        j       .L31
.L30:
        li      a5,151552
        addi    a5,a5,1728
.L31:
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lw      a5,-36(s0)
        beq     a5,zero,.L32
        lw      a5,-36(s0)
        addi    a5,a5,-1
        j       .L33
.L32:
        li      a5,639
.L33:
        lui     a3,%hi(head)
        addi    a3,a3,%lo(head)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lui     a5,%hi(head)
        addi    a3,a5,%lo(head)
        lw      a5,-36(s0)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lw      a3,-36(s0)
        li      a5,639
        beq     a3,a5,.L34
        lw      a5,-36(s0)
        addi    a5,a5,1
        j       .L35
.L34:
        li      a5,0
.L35:
        lui     a3,%hi(head)
        addi    a3,a3,%lo(head)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lui     a5,%hi(n)
        sb      a4,%lo(n)(a5)
        lw      a4,-36(s0)
        li      a5,151552
        addi    a5,a5,1728
        add     a5,a4,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(n)
        lbu     a5,%lo(n)(a5)
        or      a5,a4,a5
        andi    a5,a5,0xff
        addi    a5,a5,-3
        seqz    a5,a5
        andi    a5,a5,0xff
        mv      a3,a5
        lui     a5,%hi(b2)
        addi    a4,a5,%lo(b2)
        lw      a5,-36(s0)
        add     a5,a4,a5
        sb      a3,0(a5)
        lw      a5,-36(s0)
        addi    a5,a5,1
        sw      a5,-36(s0)
.L23:
        lw      a4,-36(s0)
        li      a5,639
        ble     a4,a5,.L36
        sw      zero,-40(s0)
        j       .L37
.L38:
        lw      a4,-40(s0)
        li      a5,151552
        addi    a5,a5,1408
        add     a5,a4,a5
        lui     a4,%hi(b1)
        addi    a3,a4,%lo(b1)
        lw      a4,-40(s0)
        add     a4,a3,a4
        lbu     a4,0(a4)
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        sb      a4,0(a5)
        lw      a4,-40(s0)
        li      a5,151552
        addi    a5,a5,1728
        add     a5,a4,a5
        lui     a4,%hi(b2)
        addi    a3,a4,%lo(b2)
        lw      a4,-40(s0)
        add     a4,a3,a4
        lbu     a4,0(a4)
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        sb      a4,0(a5)
        lw      a5,-40(s0)
        addi    a5,a5,1
        sw      a5,-40(s0)
.L37:
        lw      a4,-40(s0)
        li      a5,639
        ble     a4,a5,.L38
        nop
        nop
        lw      ra,60(sp)
        lw      s0,56(sp)
        addi    sp,sp,64
        jr      ra