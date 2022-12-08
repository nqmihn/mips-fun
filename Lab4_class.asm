.data
	string1: .asciiz "Nhap do dai cua mang:\n"
	string2: .asciiz "So lon nhat la:\n"
	string3: .asciiz "\nSo nho nhat la:\n"
	string4: .asciiz "\nTong cua mang la:\n"
	string5: .asciiz "\nMang sau khi sap xep la:\n"
	string6: .asciiz "\n"
	string7: .asciiz "Nhap phan tu thu "
	
.text
main: 
	li $v0,4
	la $a0,string1
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	ble $t0,$zero,main
	li $t1,0
	li $s1,0
loop:
	bge $t1,$t0,next
	
	li $v0,4
	la $a0,string7
	syscall
	
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,4
	la $a0,string6
	syscall
	
	li $v0,5
	syscall
	move $a0,$v0
	
	blt $a0,$zero,loop

	
	mul $t3,$t1,4 
	sub $t4,$sp,$t3
	
	
	add $s1,$s1,$a0
	sw $a0,($t4)
	addi $t1,$t1,1
	
	j loop

next:
	lw $t5,($sp)
	lw $t6,($sp)
	li $t1,0

loop_2:
	bge $t1,$t0,print_max_and_min_sum
	mul $t3,$t1,4
	sub $t4,$sp,$t3
	lw $t7,($t4)
	addi $t1,$t1,1
	blt $t5,$t7,is_Max
	blt $t7,$t6,is_Min
	j loop_2

	
is_Max:
	move $t5,$t7
	blt $t7,$t6,is_Min
	j loop_2

is_Min:
	move $t6,$t7
	j loop_2 
print_max_and_min_sum:
	li $v0,4
	la $a0,string2
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall
	
	li $v0,4
	la $a0,string3
	syscall
	
	li $v0,1
	move $a0,$t6
	syscall
	
	li $v0,4
	la $a0,string4
	syscall
	
	li $v0,1
	move $a0,$s1
	syscall
	
	li $t1,0
	li $k0,1
	sub $t2,$t0,$k0