j start
addi $zero, $zero, 0x1

start:
add $a0, $zero, $zero
lui $a0, 0xe000
add $v0, $zero, $zero  #v0=0
add $a1, $zero, $zero  #a1=0
add $a2, $zero, $zero  #a2=0
add $a3, $zero, $zero  #a3=0

addi $t0, $zero, 0x1000
lui $a3, 0x1010        #a3=0x1010
addi $v1, $zero, 0x14  #v1=20

display:
lw $v0, 0($a2)
sw $v0, 0($a0)   #display

addi $a2, $a2, 0x4  #a2+=4
addi $a1, $a1, 0x1  #a1+=1
bne $v1, $a1, display  #if(a1!=20) branch

addi $v1, $zero, 0x1
jal loop
addi $v1, $v1, 0x1

loop:
sll $v1, $v1, 0x1
sw $v1, 0($a2)
lw $v0, 0($a2)
sw $v0, 0($a0)
bne $v1, $t0, loop

addi $v1, $v1, 0x1
andi $v1, $ra, 0xFFFF

j start





