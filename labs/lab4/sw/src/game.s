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
        li      s2,272
        li      s1,0
        j       .L2
.L5:
        li      ra,0
        j       .L3
.L4:
        mv      a5,s2
        srli    a4,a5,16
        mv      a5,s2
        srli    a5,a5,14
        xor     a4,a4,a5
        mv      a5,s2
        srli    a5,a5,13
        xor     a4,a4,a5
        mv      a5,s2
        srli    a5,a5,11
        xor     a5,a4,a5
        andi    a4,a5,1
        mv      a5,s2
        slli    a5,a5,1
        or      a5,a4,a5
        mv      s2,a5
        andi    a4,s2,0xff
        slli    a3,ra,8
        slli    a5,ra,6
        add     a5,a3,a5
        add     a5,s1,a5
        andi    a4,a4,1
        andi    a4,a4,0xff
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        sb      a4,0(a5)
        addi    ra,ra,1
.L3:
        li      a5,239
        ble     ra,a5,.L4
        addi    s1,s1,1
.L2:
        li      a5,319
        ble     s1,a5,.L5
.L43:
        li      ra,0
        j       .L6
.L7:
        lui     a5,%hi(univ)
        addi    a5,a5,%lo(univ)
        add     a5,a5,ra
        lbu     a4,0(a5)
        lui     a5,%hi(head)
        addi    a5,a5,%lo(head)
        add     a5,a5,ra
        sb      a4,0(a5)
        li      a5,77824
        addi    a5,a5,-1344
        add     a5,ra,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(tail)
        addi    a5,a5,%lo(tail)
        add     a5,a5,ra
        sb      a4,0(a5)
        addi    ra,ra,1
.L6:
        li      a5,319
        ble     ra,a5,.L7
        li      ra,0
        j       .L8
.L26:
        li      s1,0
        j       .L9
.L22:
        beq     s1,zero,.L10
        addi    a5,s1,-1
        j       .L11
.L10:
        li      a5,319
.L11:
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
        li      a5,319
        beq     s1,a5,.L12
        addi    a5,s1,1
        j       .L13
.L12:
        li      a5,0
.L13:
        lui     a3,%hi(tail)
        addi    a3,a3,%lo(tail)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        slli    a3,ra,8
        slli    a5,ra,6
        add     a3,a3,a5
        beq     s1,zero,.L14
        addi    a5,s1,-1
        j       .L15
.L14:
        li      a5,319
.L15:
        add     a5,a5,a3
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        slli    a3,ra,8
        slli    a5,ra,6
        add     a3,a3,a5
        li      a5,319
        beq     s1,a5,.L16
        addi    a5,s1,1
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
        addi    a5,ra,1
        slli    a3,a5,8
        addi    a5,ra,1
        slli    a5,a5,6
        add     a3,a3,a5
        beq     s1,zero,.L18
        addi    a5,s1,-1
        j       .L19
.L18:
        li      a5,319
.L19:
        add     a5,a5,a3
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        addi    a5,ra,1
        slli    a3,a5,8
        addi    a5,ra,1
        slli    a5,a5,6
        add     a5,a3,a5
        add     a5,s1,a5
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        addi    a5,ra,1
        slli    a3,a5,8
        addi    a5,ra,1
        slli    a5,a5,6
        add     a3,a3,a5
        li      a5,319
        beq     s1,a5,.L20
        addi    a5,s1,1
        j       .L21
.L20:
        li      a5,0
.L21:
        add     a5,a5,a3
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    s2,a5,0xff
        slli    a4,ra,8
        slli    a5,ra,6
        add     a5,a4,a5
        add     a5,s1,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a5,0(a5)
        or      a5,s2,a5
        andi    a5,a5,0xff
        addi    a5,a5,-3
        seqz    a5,a5
        andi    a5,a5,0xff
        mv      a4,a5
        lui     a5,%hi(b1)
        addi    a5,a5,%lo(b1)
        add     a5,a5,s1
        sb      a4,0(a5)
        addi    s1,s1,1
.L9:
        li      a5,319
        ble     s1,a5,.L22
        li      s1,0
        j       .L23
.L25:
        slli    a4,ra,8
        slli    a5,ra,6
        add     a5,a4,a5
        add     a5,s1,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(tail)
        addi    a5,a5,%lo(tail)
        add     a5,a5,s1
        sb      a4,0(a5)
        ble     ra,zero,.L24
        addi    a5,ra,-1
        slli    a4,a5,8
        addi    a5,ra,-1
        slli    a5,a5,6
        add     a5,a4,a5
        add     a5,s1,a5
        lui     a4,%hi(b2)
        addi    a4,a4,%lo(b2)
        add     a4,a4,s1
        lbu     a4,0(a4)
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        sb      a4,0(a5)
.L24:
        lui     a5,%hi(b1)
        addi    a5,a5,%lo(b1)
        add     a5,a5,s1
        lbu     a4,0(a5)
        lui     a5,%hi(b2)
        addi    a5,a5,%lo(b2)
        add     a5,a5,s1
        sb      a4,0(a5)
        addi    s1,s1,1
.L23:
        li      a5,319
        ble     s1,a5,.L25
        addi    ra,ra,1
.L8:
        li      a5,238
        ble     ra,a5,.L26
        li      ra,0
        j       .L27
.L40:
        beq     ra,zero,.L28
        addi    a5,ra,-1
        j       .L29
.L28:
        li      a5,319
.L29:
        lui     a4,%hi(tail)
        addi    a4,a4,%lo(tail)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lui     a5,%hi(tail)
        addi    a5,a5,%lo(tail)
        add     a5,a5,ra
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        li      a5,319
        beq     ra,a5,.L30
        addi    a5,ra,1
        j       .L31
.L30:
        li      a5,0
.L31:
        lui     a3,%hi(tail)
        addi    a3,a3,%lo(tail)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        beq     ra,zero,.L32
        li      a5,77824
        addi    a5,a5,-1345
        add     a5,ra,a5
        j       .L33
.L32:
        li      a5,77824
        addi    a5,a5,-1025
.L33:
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        li      a5,319
        beq     ra,a5,.L34
        li      a5,77824
        addi    a5,a5,-1343
        add     a5,ra,a5
        j       .L35
.L34:
        li      a5,77824
        addi    a5,a5,-1344
.L35:
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        beq     ra,zero,.L36
        addi    a5,ra,-1
        j       .L37
.L36:
        li      a5,319
.L37:
        lui     a3,%hi(head)
        addi    a3,a3,%lo(head)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        lui     a5,%hi(head)
        addi    a5,a5,%lo(head)
        add     a5,a5,ra
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        li      a5,319
        beq     ra,a5,.L38
        addi    a5,ra,1
        j       .L39
.L38:
        li      a5,0
.L39:
        lui     a3,%hi(head)
        addi    a3,a3,%lo(head)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    s2,a5,0xff
        li      a5,77824
        addi    a5,a5,-1344
        add     a5,ra,a5
        lui     a4,%hi(univ)
        addi    a4,a4,%lo(univ)
        add     a5,a4,a5
        lbu     a5,0(a5)
        or      a5,s2,a5
        andi    a5,a5,0xff
        addi    a5,a5,-3
        seqz    a5,a5
        andi    a5,a5,0xff
        mv      a4,a5
        lui     a5,%hi(b2)
        addi    a5,a5,%lo(b2)
        add     a5,a5,ra
        sb      a4,0(a5)
        addi    ra,ra,1
.L27:
        li      a5,319
        ble     ra,a5,.L40
        li      ra,0
        j       .L41
.L42:
        li      a5,77824
        addi    a5,a5,-1664
        add     a5,ra,a5
        lui     a4,%hi(b1)
        addi    a4,a4,%lo(b1)
        add     a4,a4,ra
        lbu     a4,0(a4)
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        sb      a4,0(a5)
        li      a5,77824
        addi    a5,a5,-1344
        add     a5,ra,a5
        lui     a4,%hi(b2)
        addi    a4,a4,%lo(b2)
        add     a4,a4,ra
        lbu     a4,0(a4)
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        sb      a4,0(a5)
        addi    ra,ra,1
.L41:
        li      a5,319
        ble     ra,a5,.L42
        j       .L43