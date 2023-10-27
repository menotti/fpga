# 
# Generated with: https://godbolt.org/z/EaEbTPKxe
# List instuctions with: awk '{print $1}' game.s | grep -v ':' | grep -v byte | sort -u
#
.data
univ:
        .byte   1200
b1:
        .byte   40
b2:
        .byte   40
tail:
        .byte   40
head:
        .byte   40
.text
main:
.L39:
        li      s1,0
        j       .L2
.L3:
        lui     a5,%hi(univ)
        addi    a5,a5,%lo(univ)
        add     a5,a5,s1
        lbu     a4,0(a5)
        lui     a5,%hi(head)
        addi    a5,a5,%lo(head)
        add     a5,a5,s1
        sb      a4,0(a5)
        li      a5,4096
        addi    a5,a5,-1776
        add     a5,s1,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(tail)
        addi    a5,a5,%lo(tail)
        add     a5,a5,s1
        sb      a4,0(a5)
        addi    s1,s1,1
.L2:
        li      a5,39
        ble     s1,a5,.L3
        li      s1,0
        j       .L4
.L22:
        li      s2,0
        j       .L5
.L18:
        beq     s2,zero,.L6
        addi    a5,s2,-1
        j       .L7
.L6:
        li      a5,39
.L7:
        lui     a4,%hi(tail)
        addi    a4,a4,%lo(tail)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(tail)
        addi    a5,a5,%lo(tail)
        add     a5,a5,s2
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        li      a5,39
        beq     s2,a5,.L8
        addi    a5,s2,1
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
        slli    a3,s1,6
        slli    a5,s1,4
        add     a3,a3,a5
        beq     s2,zero,.L10
        addi    a5,s2,-1
        j       .L11
.L10:
        li      a5,39
.L11:
        add     a5,a5,a3
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        slli    a3,s1,6
        slli    a5,s1,4
        add     a3,a3,a5
        li      a5,39
        beq     s2,a5,.L12
        addi    a5,s2,1
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
        addi    a5,s1,1
        slli    a3,a5,6
        addi    a5,s1,1
        slli    a5,a5,4
        add     a3,a3,a5
        beq     s2,zero,.L14
        addi    a5,s2,-1
        j       .L15
.L14:
        li      a5,39
.L15:
        add     a5,a5,a3
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        addi    a5,s1,1
        slli    a3,a5,6
        addi    a5,s1,1
        slli    a5,a5,4
        add     a5,a3,a5
        add     a5,s2,a5
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        addi    a5,s1,1
        slli    a3,a5,6
        addi    a5,s1,1
        slli    a5,a5,4
        add     a3,a3,a5
        li      a5,39
        beq     s2,a5,.L16
        addi    a5,s2,1
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
        andi    s3,a5,0xff
        slli    a4,s1,6
        slli    a5,s1,4
        add     a5,a4,a5
        add     a5,s2,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a5,0(a5)
        or      a5,s3,a5
        andi    a5,a5,0xff
        addi    a5,a5,-3
        seqz    a5,a5
        andi    a5,a5,0xff
        mv      a4,a5
        lui     a5,%hi(b1)
        addi    a5,a5,%lo(b1)
        add     a5,a5,s2
        sb      a4,0(a5)
        addi    s2,s2,1
.L5:
        li      a5,39
        ble     s2,a5,.L18
        li      s2,0
        j       .L19
.L21:
        slli    a4,s1,6
        slli    a5,s1,4
        add     a5,a4,a5
        add     a5,s2,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(tail)
        addi    a5,a5,%lo(tail)
        add     a5,a5,s2
        sb      a4,0(a5)
        ble     s1,zero,.L20
        addi    a5,s1,-1
        slli    a4,a5,6
        addi    a5,s1,-1
        slli    a5,a5,4
        add     a5,a4,a5
        add     a5,s2,a5
        lui     a4,%hi(b2)
        addi    a4,a4,%lo(b2)
        add     a4,a4,s2
        lbu     a4,0(a4)
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        sb      a4,0(a5)
.L20:
        lui     a5,%hi(b1)
        addi    a5,a5,%lo(b1)
        add     a5,a5,s2
        lbu     a4,0(a5)
        lui     a5,%hi(b2)
        addi    a5,a5,%lo(b2)
        add     a5,a5,s2
        sb      a4,0(a5)
        addi    s2,s2,1
.L19:
        li      a5,39
        ble     s2,a5,.L21
        addi    s1,s1,1
.L4:
        li      a5,28
        ble     s1,a5,.L22
        li      s1,0
        j       .L23
.L36:
        beq     s1,zero,.L24
        addi    a5,s1,-1
        j       .L25
.L24:
        li      a5,39
.L25:
        lui     a4,%hi(tail)
        addi    a4,a4,%lo(tail)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(tail)
        addi    a5,a5,%lo(tail)
        add     a5,a5,s1
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        li      a5,39
        beq     s1,a5,.L26
        addi    a5,s1,1
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
        beq     s1,zero,.L28
        li      a5,4096
        addi    a5,a5,-1777
        add     a5,s1,a5
        j       .L29
.L28:
        li      a5,4096
        addi    a5,a5,-1737
.L29:
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        li      a5,39
        beq     s1,a5,.L30
        li      a5,4096
        addi    a5,a5,-1775
        add     a5,s1,a5
        j       .L31
.L30:
        li      a5,4096
        addi    a5,a5,-1776
.L31:
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        beq     s1,zero,.L32
        addi    a5,s1,-1
        j       .L33
.L32:
        li      a5,39
.L33:
        lui     a3,%hi(head)
        addi    a3,a3,%lo(head)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lui     a5,%hi(head)
        addi    a5,a5,%lo(head)
        add     a5,a5,s1
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        li      a5,39
        beq     s1,a5,.L34
        addi    a5,s1,1
        j       .L35
.L34:
        li      a5,0
.L35:
        lui     a3,%hi(head)
        addi    a3,a3,%lo(head)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    s3,a5,0xff
        li      a5,4096
        addi    a5,a5,-1776
        add     a5,s1,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a5,0(a5)
        or      a5,s3,a5
        andi    a5,a5,0xff
        addi    a5,a5,-3
        seqz    a5,a5
        andi    a5,a5,0xff
        mv      a4,a5
        lui     a5,%hi(b2)
        addi    a5,a5,%lo(b2)
        add     a5,a5,s1
        sb      a4,0(a5)
        addi    s1,s1,1
.L23:
        li      a5,39
        ble     s1,a5,.L36
        li      s1,0
        j       .L37
.L38:
        li      a5,4096
        addi    a5,a5,-1856
        add     a5,s1,a5
        lui     a4,%hi(b1)
        addi    a4,a4,%lo(b1)
        add     a4,a4,s1
        lbu     a4,0(a4)
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        sb      a4,0(a5)
        li      a5,4096
        addi    a5,a5,-1776
        add     a5,s1,a5
        lui     a4,%hi(b2)
        addi    a4,a4,%lo(b2)
        add     a4,a4,s1
        lbu     a4,0(a4)
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        sb      a4,0(a5)
        addi    s1,s1,1
.L37:
        li      a5,39
        ble     s1,a5,.L38
        j       .L39