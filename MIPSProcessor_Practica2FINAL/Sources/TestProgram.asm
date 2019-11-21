	
	.text
	# Initializations
	addi $t0,$zero,2 	#t0 = 2
	addi $t1,$zero,3	#t1 = 3
	addi $t2,$zero,7	#t2 = 7
	addi $t3,$zero,1	#t3 = 1
	addi $s7, $s7, 0	#s7 = 0
	 
	 

	#sub, ori, andi y lui
	sub $t7, $t2, $t1	#t7= 4
	ori $t7, $t3, 2		#t7= 3
	andi $t7, $t2, 1	#t7= 1
	lui $t7, 1		#t7= 65,536
	sll $t7, $t3, 4 	#t7= 16
	srl $t7, $t7, 4		#t7= 1
	addi $t0, $zero, 8
	addi $s0, $zero, 12
	sw $t0, ($s0)	
	lw $t7, ($t0)
	# Moving values
	add $s0,$t0,$zero
	add $s1,$t1,$zero
	add $s0,$t2,$zero
	add $s4,$t3,$zero
	
	# Basic operations
	add $t3,$t0,$t1
	or  $t4,$t1,$t2
	and $t4,$t1,$t2
	addi $t5,$t4,1
	
	# 2's complement of register $t0
	nor $at,$t0,$t0
	addi $t0,$at,1
	
	# Move register $t0 to $t6
	add $t6,$zero,$t0
	
	# Swap registers $t1 and $t2
	addi $t0,$zero,5
	addi  $t8,$zero, 10
	
