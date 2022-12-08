.data
	array1: .word 5, 6, 7, 8, 1, 2, 3, 9, 10, 4
	size1: .word 10
	array2: .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
	size2: .word 16
	array3: .space 8
	size3: .word 8
	line: .asciiz "\n"
	ch32: .asciiz " "
	nhap_mang: .asciiz "Nhap so thu tu cua mang can lay:\n"
	lay_phan_tu: .asciiz "Nhap chi so cua phan tu can lay:"
.text
main:
	li $t0,1
	lw  $t1,size1
	la $t2,array1
	loop1:
	bgt $t0,$t1,main2
	lw $t3,0($t2)
	addi $t2,$t2,4
	
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,ch32
	syscall
	addi $t0,$t0,1
	j loop1

main2:
	li $v0,4
	la $a0,line
	syscall
	
	li $t0,1
	lw  $t1,size2
	la $t2,array2
	
	loop2:
	bgt $t0,$t1,main3
	lb $t3,0($t2)
	addi $t2,$t2,1
	
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,ch32
	syscall
	addi $t0,$t0,1
	j loop2

main3:
	li $v0,4
	la $a0,line
	syscall
	
	la $t2,array2
	move $a3,$t2
	la $t5,array3
	move $s5,$t5
	lw $s3,size3
	lw $s2,size2
	li $t0,1
	loop3:
	bgt $t0,$s3,main4
	subi $t3,$s2,2
	sub $t3,$t3,$t0
	lb $t4,0($t2)
	add $a2,$a3,$t3
	lb $t7,0($a2)
	add $t6,$t4,$t7
	sb $t6,($s5)
	
	addi $t2,$t2,1
	addi $t0,$t0,1
	addi $s5,$s5,1
	
	
	
	
	j loop3
main4:
	li $v0,4
	la $a0,line
	syscall 
	la $t5,array3
	li $t0,1
	lw $s3,size3
	loop4:
	bgt $t0,$s3,lay_mang
	lb $t3,0($t5)
	addi $s5,$t5,1
	
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,ch32
	syscall
	addi $t0,$t0,1
	j loop4
	
	
lay_mang:
	li $v0,4
	la $a0,line
	syscall
	
	li $v0,4
	la $a0,nhap_mang
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $s1,1
	li $s2,2
	li $s3,3
	
	beq $t0,$s1,lay_mang_1
	beq $t0,$s2,lay_mang_2
	beq $t0,$s3,lay_mang_3
	
lay_mang_1:
	li $v0,4
	la $a0,lay_phan_tu
	syscall
	la $a1,array1
	
	li $v0,5
	syscall
	move $t1,$v0
	lw $s1,size1
	
	ble $t1,$0,lay_mang_1
	bgt $t1,$s1,lay_mang_1
		
	li $t2,1
	
	loop_lay_mang_1:
	bgt $t2,$t1,print
	lw $t3,0($a1)
	addi $a1,$a1,4
	addi $t2,$t2,1
	j loop_lay_mang_1
lay_mang_2:
	li $v0,4
	la $a0,lay_phan_tu
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	lw $s2,size2
	
	ble $t1,$0,lay_mang_2
	bgt $t1,$s2,lay_mang_2
	
	la $a2,array2
	li $t2,1
	loop_lay_mang_2:
	bgt $t2,$t1,print
	
	lb $t3,0($a2)
	addi $a2,$a2,1
	
	addi $t2,$t2,1
	j loop_lay_mang_2
	
lay_mang_3:
	li $v0,4
	la $a0,lay_phan_tu
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	lw $s2,size3
	
	ble $t1,$0,lay_mang_3
	bgt $t1,$s2,lay_mang_3
	
	la $a3,array3
	li $t2,1
	
	loop_lay_mang_3:
	bgt $t2,$t1,print
	
	lb $t3,0($a3)
	addi $a3,$a3,1
	
	addi $t2,$t2,1
	j loop_lay_mang_3
	
print:
	li $v0,4
	la $a0,line
	syscall
	
	li $v0,1
	move $a0,$t3
	syscall
	j lay_mang
	
	
		
exit: 
	li $v0,4
	la $a0,line
	syscall
	
	li $v0, 10
    	syscall
	
	
	

		
	
	
	
