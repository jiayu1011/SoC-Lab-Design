        j start
        add $zero, $zero, $zero
        add $zero, $zero, $zero
        add $zero, $zero, $zero
        add $zero, $zero, $zero
        add $zero, $zero, $zero
        add $zero, $zero, $zero
        add $zero, $zero, $zero
        #可以随便使用的寄存器a3，t8，t9，t4�?5�?6�?7
        #s1根据L01和L11来使�?
        #以下为冒泡排序代�?
        #t8作为counter i，t9作为counter j
        move $t8,$zero
for1slt:slti $t0,$t8,13
        beq $t0,$zero,exit1
        addi $t9,$t8,-1
for2slt:slti $t0,$t9,0
        bne $t0,$zero,exit2
        addi $t5,$s1,0x20 #作为数组的起始地�?
        sll $t4,$t9,2 #t4 = j*4
        add $t6,$t5,$t4
        lw $t7,0($t6) # t7 = s1[0x20 + ...]
        lw $v1,4($t6)
        slt $t0,$v1,$t7
        beq $t0,$zero,exit2
        sw $t7,4($t6)   #swap
        sw $v1,0($t6)
exit2:  addi $t8,$t8,1
        j for1slt
exit1:  move $t0,$zero #复原后面�?要使用的寄存�?
        move $v1,$zero
start:  lui $v1, 0xf000 #r3=0xF0000000
        lui $a0, 0xe000 #r4=0xE0000000
        lui $t0, 0x8000 #r8=0x80000000
        addi $s4, $zero, 0x003f #r20=0x0000003F
        lui $a2, 0xf800 #r6=0xf8000000
        nor $at, $zero, $zero #r1=0xFFFFFFFF
        slt $v0, $zero, $at #r2=0x00000001 unsigned slt
        addi $t2, $at, -1 #r10=0xFFFFFFFE
        sw $a2, 4($v1) #计数器端�?:F0000004，�?�计数常数r6=0xf8000000
        lw $a1, 0($v1) #读GPIO端口F0000000状�??:{counter0_out,counter1_out,counter2_out,led_out[12:0], SW}
        add $a1, $a1, $a1 #左移
        add $a1, $a1, $a1 #左移2位将SW与LED对齐，同时D1D0�?00，�?�择计数器�?�道0
        sw $a1, 0($v1) #r5输出到GPIO端口0xF0000000，设置计数器通道counter_set=00端口�? LED=SW {GPIOf0[13:0],LED,counter_set}
        addi $t1, $t1, 1 #r9=r9+1
        sw $t1, 0($a0) #r9送r4=0xE0000000七段码端�?
        lw $t5, 20($zero) #取存储器20单元预存数据至r13(5号字),程序计数延时常数
Loop:   lw $a1, 0($v1) #读GPIO端口F0000000状�??:{counter0_out,counter1_out,counter2_out,led_out[12:0], SW}
        add $a1, $a1, $a1 #左移
        add $a1, $a1, $a1 #左移2位将SW与LED对齐，同时D1D0�?00，�?�择计数器�?�道0
        sw $a1, 0($v1) #r5输出到GPIO端口0xF0000000，计数器通道counter_set=00端口不变�? LED=SW�? {GPIOf0[13:0],LED,counter_set}
        lw $a1, 0($v1) #再读GPIO端口0xF0000000状�??
        and $t3,$a1,$t0 #取最高位=out0，屏蔽其余位送r11
        addi $t5, $t5,1 #程序计数延时
        bne $t5, $zero, Disp
        jal Next
Disp:   lw $a1, 0($v1) #读GPIO端口F0000000状�??:{counter0_out,counter1_out,counter2_out,led_out[12:0], SW}
        addi $s2, $zero, 0x0008 #r18=0x00000008
        add $s6, $s2, $s2 #r22=0x00000010
        add $s2, $s2, $s6 #r18=0x00000018(00011000b)
        and $t3, $a1, $s2 #取SW[4:3]
        beq $t3, $zero, L00 #SW[4:3]=00,7段显�?"�?"循环移位�? L00�? SW0=0
        beq $t3, $s2, L11 #SW[4:3]=11,7段显示显示七段图形： L11�? SW0=0
        addi $s2, $zero, 0x0008 #r18=8
        beq $t3, $s2, L01 #SW[4:3]=01,七段显示预置数字�? L01�? SW0=1
        sw $t1, 0($a0) #SW[4:3]=10，显示r9�? SW0=1
        j Loop
L00:    bne $t2, $at, L3 #r10�? =r1,转移L3
        nor $t2, $zero, $zero #r10=0xffffffff
        add $t2, $t2, $t2 #r10=0xfffffffe
L3:     sw $t2, 0($a0) #SW[4:3]=00,7段显示点移位后显�?
        j Loop
L11:    lw $t1, 0x60($s1) #SW[4:3]=11，从内存取预存七段图�?
        sw $t1, 0($a0) #SW[4:3]=11，显示七段图�?
        j Loop
L01:    lw $t1, 0x20($s1) #SW[4:3]=01，从内存取预存数�?
        sw $t1, 0($a0) #SW[4:3]=01,七段显示预置数字
        j Loop
Next:   lw $t5, 20($zero) #取存储器20单元预存数据至r13,程序计数延时常数
        add $t2, $t2, $t2 #r10=fffffffc�? 7段图形点左移
        ori $t2, $t2,1 #r10末位�?1，对应右上角不显�?
        addi $s1, $s1,4 #r17=r17+00000004�? LED图形访存地址+4
        and $s1, $s1, $s4 #r17=000000XX，屏蔽地�?高位，只�?6�?
        add $t1, $t1, $v0 #r9=r9+1
        bne $t1, $at, L4 #r9=ffffffff,重置r9=5
        addi $t1, $t1, 5
L4:     lw $a1, 0($v1) #读GPIO端口F0000000状�??:{counter0_out,counter1_out,counter2_out,led_out[12:0], SW}
        add $t3,$a1,$a1 #左移
        add $t3,$t3,$t3 #左移2位将SW与LED对齐，同时D1D0�?00，�?�择计数器�?�道0
        sw $t3, 0($v1) #r5输出到GPIO端口0xF0000000，计数器通道counter_set=00端口不变�? LED=SW�? {GPIOf0[13:0],LED,counter_set}
        sw $a2, 4($v1) #计数器端�?:F0000004，�?�计数常数r6=0xf8000000
        jr $ra