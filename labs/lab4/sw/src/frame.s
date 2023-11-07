	add t0, zero, zero
	li t1, 76800
loop:
	lbu t2, 0(t0)
	addi t2, t2, 1
	sb t2, 0(t0)
	addi t0, t0, 1
	beq t0, t1, frame
	j loop
frame: 
	add t0, zero, zero
	j loop