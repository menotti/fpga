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
.L45:
        li      a0, 0x400010
        lw      a5, (a0)
        xor     s2, s2, ra
        beq     a5,zero,.L2
        li      s1,0
        j       .L3
.L6:
        li      ra,0
        j       .L4
.L5:
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
.L4:
        li      a5,239
        ble     ra,a5,.L5
        addi    s1,s1,1
.L3:
        li      a5,319
        ble     s1,a5,.L6
        j       .L45
.L2:
        li      ra,0
        j       .L8
.L9:
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
.L8:
        li      a5,319
        ble     ra,a5,.L9
        li      ra,0
        j       .L10
.L28:
        li      s1,0
        j       .L11
.L24:
        beq     s1,zero,.L12
        addi    a5,s1,-1
        j       .L13
.L12:
        li      a5,319
.L13:
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
        beq     s1,a5,.L14
        addi    a5,s1,1
        j       .L15
.L14:
        li      a5,0
.L15:
        lui     a3,%hi(tail)
        addi    a3,a3,%lo(tail)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        slli    a3,ra,8
        slli    a5,ra,6
        add     a3,a3,a5
        beq     s1,zero,.L16
        addi    a5,s1,-1
        j       .L17
.L16:
        li      a5,319
.L17:
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
        beq     s1,a5,.L18
        addi    a5,s1,1
        j       .L19
.L18:
        li      a5,0
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
        add     a3,a3,a5
        beq     s1,zero,.L20
        addi    a5,s1,-1
        j       .L21
.L20:
        li      a5,319
.L21:
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
        beq     s1,a5,.L22
        addi    a5,s1,1
        j       .L23
.L22:
        li      a5,0
.L23:
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
.L11:
        li      a5,319
        ble     s1,a5,.L24
        li      s1,0
        j       .L25
.L27:
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
        ble     ra,zero,.L26
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
.L26:
        lui     a5,%hi(b1)
        addi    a5,a5,%lo(b1)
        add     a5,a5,s1
        lbu     a4,0(a5)
        lui     a5,%hi(b2)
        addi    a5,a5,%lo(b2)
        add     a5,a5,s1
        sb      a4,0(a5)
        addi    s1,s1,1
.L25:
        li      a5,319
        ble     s1,a5,.L27
        addi    ra,ra,1
.L10:
        li      a5,238
        ble     ra,a5,.L28
        li      ra,0
        j       .L29
.L42:
        beq     ra,zero,.L30
        addi    a5,ra,-1
        j       .L31
.L30:
        li      a5,319
.L31:
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
        beq     ra,a5,.L32
        addi    a5,ra,1
        j       .L33
.L32:
        li      a5,0
.L33:
        lui     a3,%hi(tail)
        addi    a3,a3,%lo(tail)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        beq     ra,zero,.L34
        li      a5,77824
        addi    a5,a5,-1345
        add     a5,ra,a5
        j       .L35
.L34:
        li      a5,77824
        addi    a5,a5,-1025
.L35:
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        li      a5,319
        beq     ra,a5,.L36
        li      a5,77824
        addi    a5,a5,-1343
        add     a5,ra,a5
        j       .L37
.L36:
        li      a5,77824
        addi    a5,a5,-1344
.L37:
        lui     a3,%hi(univ)
        addi    a3,a3,%lo(univ)
        add     a5,a3,a5
        lbu     a5,0(a5)
        add     a5,a4,a5
        andi    a4,a5,0xff
        beq     ra,zero,.L38
        addi    a5,ra,-1
        j       .L39
.L38:
        li      a5,319
.L39:
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
        beq     ra,a5,.L40
        addi    a5,ra,1
        j       .L41
.L40:
        li      a5,0
.L41:
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
.L29:
        li      a5,319
        ble     ra,a5,.L42
        li      ra,0
        j       .L43
.L44:
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
.L43:
        li      a5,319
        ble     ra,a5,.L44
        j       .L45

/*
00400537
01050513
00052783
00194933
08078e63
00000493
0880006f
00000093
0740006f
012007b3
0107d713
012007b3
00e7d793
00f74733
012007b3
00d7d793
00f74733
012007b3
00b7d793
00f747b3
0017f713
012007b3
00179793
00f767b3
00f00933
0ff97713
00809693
00609793
00f687b3
00f487b3
00177713
0ff77713
000006b7
00068693
00f687b3
00e78023
00108093
0ef00793
f817d6e3
00148493
13f00793
f697dce3
f59ff06f
00000093
0580006f
000007b7
00078793
001787b3
0007c703
000137b7
fc078793
001787b3
00e78023
000137b7
00078793
ac078793
00f087b3
00000737
00070713
00f707b3
0007c703
000137b7
e8078793
001787b3
00e78023
00108093
13f00793
fa17d4e3
00000093
2900006f
00000493
1dc0006f
00048663
fff48793
0080006f
13f00793
00013737
e8070713
00f707b3
0007c703
000137b7
e8078793
009787b3
0007c783
00f707b3
0ff7f713
13f00793
00f48663
00148793
0080006f
00000793
000136b7
e8068693
00f687b3
0007c783
00f707b3
0ff7f713
00809693
00609793
00f686b3
00048663
fff48793
0080006f
13f00793
00d787b3
000006b7
00068693
00f687b3
0007c783
00f707b3
0ff7f713
00809693
00609793
00f686b3
13f00793
00f48663
00148793
0080006f
00000793
00d787b3
000006b7
00068693
00f687b3
0007c783
00f707b3
0ff7f713
00108793
00879693
00108793
00679793
00f686b3
00048663
fff48793
0080006f
13f00793
00d787b3
000006b7
00068693
00f687b3
0007c783
00f707b3
0ff7f713
00108793
00879693
00108793
00679793
00f687b3
00f487b3
000006b7
00068693
00f687b3
0007c783
00f707b3
0ff7f713
00108793
00879693
00108793
00679793
00f686b3
13f00793
00f48663
00148793
0080006f
00000793
00d787b3
000006b7
00068693
00f687b3
0007c783
00f707b3
0ff7f913
00809713
00609793
00f707b3
00f487b3
00000737
00070713
00f707b3
0007c783
00f967b3
0ff7f793
ffd78793
0017b793
0ff7f793
00f00733
000137b7
c0078793
009787b3
00e78023
00148493
13f00793
e297d2e3
00000493
0940006f
00809713
00609793
00f707b3
00f487b3
00000737
00070713
00f707b3
0007c703
000137b7
e8078793
009787b3
00e78023
02105e63
fff08793
00879713
fff08793
00679793
00f707b3
00f487b3
00013737
d4070713
00970733
00074703
000006b7
00068693
00f687b3
00e78023
000137b7
c0078793
009787b3
0007c703
000137b7
d4078793
009787b3
00e78023
00148493
13f00793
f697d6e3
00108093
0ee00793
d617d8e3
00000093
19c0006f
00008663
fff08793
0080006f
13f00793
00013737
e8070713
00f707b3
0007c703
000137b7
e8078793
001787b3
0007c783
00f707b3
0ff7f713
13f00793
00f08663
00108793
0080006f
00000793
000136b7
e8068693
00f687b3
0007c783
00f707b3
0ff7f713
00008c63
000137b7
00078793
abf78793
00f087b3
0100006f
000137b7
00078793
bff78793
000006b7
00068693
00f687b3
0007c783
00f707b3
0ff7f713
13f00793
00f08c63
000137b7
00078793
ac178793
00f087b3
0100006f
000137b7
00078793
ac078793
000006b7
00068693
00f687b3
0007c783
00f707b3
0ff7f713
00008663
fff08793
0080006f
13f00793
000136b7
fc068693
00f687b3
0007c783
00f707b3
0ff7f713
000137b7
fc078793
001787b3
0007c783
00f707b3
0ff7f713
13f00793
00f08663
00108793
0080006f
00000793
000136b7
fc068693
00f687b3
0007c783
00f707b3
0ff7f913
000137b7
00078793
ac078793
00f087b3
00000737
00070713
00f707b3
0007c783
00f967b3
0ff7f793
ffd78793
0017b793
0ff7f793
00f00733
000137b7
d4078793
001787b3
00e78023
00108093
13f00793
e617d2e3
00000093
0680006f
000137b7
00078793
98078793
00f087b3
00013737
c0070713
00170733
00074703
000006b7
00068693
00f687b3
00e78023
000137b7
00078793
ac078793
00f087b3
00013737
d4070713
00170733
00074703
000006b7
00068693
00f687b3
00e78023
00108093
13f00793
f817dce3
a39ff06f
*/