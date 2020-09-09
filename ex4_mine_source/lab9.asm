		lui 	$a0, 0xe000 #存储地址确定
		add		$s0, $0, $0
		addi	$s1, $0, 0x0000000f
		addi	$s2, $0, 48
		addi	$s3, $0, 52
		addi	$t5, $0, -4
		add		$t0, $0, $0	# i = 0
loop1:	beq		$t0, $s2, output
		addi	$t1, $t0, 4	# j = i + 4
		addi	$t0, $t0, 4
loop2:	beq		$t1, $s3, loop1
		lw		$t3, -4($t0)	# $t3 = a[i]
		lw		$t4, 0($t1)	# $t4 = a[j]
		slt		$t2, $t3, $t4	# if (a[i] < a[j]) swap
		addi	$t1, $t1, 4
		bne		$t2, $0, loop2
		sw		$t3, -4($t1)
		sw		$t4, -4($t0)
		j		loop2
output:	addi	$t5, $t5, 4	# i = 0
		and		$t5, $t5, $s1
		lw		$t6, 0($t5)
		sw		$t6, 0($a0)
		j		output
	
