
`timescale 1ns/1ps
module control_unit( 
input [5:0]op,funct,
input [4:0]rt,
input Zero,Sign,
output [1:0]RegDst, 
output [2:0]RegWrite,
output [1:0]NPCOp, MemWrite, MemtoReg,
output ALUsrc1, ALUsrc2, BranchZ, EXTOp,
output [3:0]ALUOp
);

  wire rtype=~|op;

  wire i_add=rtype&funct[5]&~funct[4]&~funct[3]&~funct[2]&~funct[1]&~funct[0];//100000

  wire i_addu=rtype&funct[5]&~funct[4]&~funct[3]&~funct[2]&~funct[1]&funct[0];//100001

  wire i_sub=rtype&funct[5]&~funct[4]&~funct[3]&~funct[2]&funct[1]&~funct[0];//100010

  wire i_subu=rtype&funct[5]&~funct[4]&~funct[3]&~funct[2]&funct[1]&funct[0];//100011

  wire i_and=rtype&funct[5]&~funct[4]&~funct[3]&funct[2]&~funct[1]&~funct[0];//100100

  wire i_or=rtype&funct[5]&~funct[4]&~funct[3]&funct[2]&~funct[1]&funct[0];//100101

  wire i_nor=rtype&funct[5]&~funct[4]&~funct[3]&funct[2]&funct[1]&funct[0];//100111

  wire i_xor=rtype&funct[5]&~funct[4]&~funct[3]&funct[2]&funct[1]&~funct[0];//100110

  wire i_sll=rtype&~funct[5]&~funct[4]&~funct[3]&~funct[2]&~funct[1]&~funct[0];//000000

  wire i_sllv=rtype&~funct[5]&~funct[4]&~funct[3]&funct[2]&~funct[1]&~funct[0];//000100

  wire i_srl=rtype&~funct[5]&~funct[4]&~funct[3]&~funct[2]&funct[1]&~funct[0];//000010

  wire i_srlv=rtype&~funct[5]&~funct[4]&~funct[3]&funct[2]&funct[1]&~funct[0];//000110

  wire i_sra=rtype&~funct[5]&~funct[4]&~funct[3]&~funct[2]&funct[1]&funct[0];//000011

  wire i_srav=rtype&~funct[5]&~funct[4]&~funct[3]&funct[2]&funct[1]&funct[0];//000111

  wire i_jr=rtype&~funct[5]&~funct[4]&funct[3]&~funct[2]&~funct[1]&~funct[0];//001000

  wire i_jalr=rtype&~funct[5]&~funct[4]&funct[3]&~funct[2]&~funct[1]&funct[0];//001001

  wire i_slt=rtype&funct[5]&~funct[4]&funct[3]&~funct[2]&funct[1]&~funct[0];//101010

  wire i_sltu=rtype&funct[5]&~funct[4]&funct[3]&~funct[2]&funct[1]&funct[0];//101011
//18

  
  wire i_addi=~op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0];//001000

  wire i_addiu=~op[5]&~op[4]&op[3]&~op[2]&~op[1]&op[0];//001001

  wire i_andi=~op[5]&~op[4]&op[3]&op[2]&~op[1]&~op[0];//001100

  wire i_xori=~op[5]&~op[4]&op[3]&op[2]&op[1]&~op[0];//001110

  wire i_beq=~op[5]&~op[4]&~op[3]&op[2]&~op[1]&~op[0];//000100

  wire i_bne=~op[5]&~op[4]&~op[3]&op[2]&~op[1]&op[0];//000101

  wire i_blez=~op[5]&~op[4]&~op[3]&op[2]&op[1]&~op[0];//000110

  wire i_bgtz=~op[5]&~op[4]&~op[3]&op[2]&op[1]&op[0];//000111

  wire i_bltz=~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&op[0]&~rt[0];//000001  00000
 
  wire i_bgez=~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&op[0]&rt[0];//000001  00001

  wire i_j=~op[5]&~op[4]&~op[3]&~op[2]&op[1]&~op[0];//000010

  wire i_jal=~op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];//000011

  wire i_slti=~op[5]&~op[4]&op[3]&~op[2]&op[1]&~op[0];//001010

  wire i_sltiu=~op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0];//001011

  wire i_ori=~op[5]&~op[4]&op[3]&op[2]&~op[1]&op[0];//001101

  wire i_lui=~op[5]&~op[4]&op[3]&op[2]&op[1]&op[0];//001111

  wire i_lb=op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0];//100000

  wire i_lh=op[5]&~op[4]&~op[3]&~op[2]&~op[1]&op[0];//100001

  wire i_lw=op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];//100011

  wire i_lbu=op[5]&~op[4]&~op[3]&op[2]&~op[1]&~op[0];//100100

  wire i_lhu=op[5]&~op[4]&~op[3]&op[2]&~op[1]&op[0];//100101

  wire i_sb=op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0];//101000

  wire i_sh=op[5]&~op[4]&op[3]&~op[2]&~op[1]&op[0];//101001

  wire i_sw=op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0];//101011
//24



  assign RegDst[1]=i_jalr|i_jal;

  assign RegDst[0]=i_add|i_addu|i_sub|i_subu|i_and|i_or
                   |i_xor|i_nor|i_slt|i_sltu|i_sll|i_sllv
                   |i_srl|i_srlv|i_sra|i_srav;

  assign RegWrite[2]=i_lhu|i_lbu;

  assign RegWrite[1]=i_lb|i_lh;

  assign RegWrite[0]=i_add|i_addu|i_sub|i_subu|i_and|i_or
                     |i_xor|i_nor|i_slt|i_sltu|i_sll|i_sllv
                     |i_srl|i_srlv|i_sra|i_srav|i_jalr
                     |i_addi|i_addiu|i_slti|i_sltiu|i_andi
                     |i_ori|i_xori|i_lui|i_jal|i_lb|i_lw|i_lbu;

  assign ALUsrc1=i_sll|i_srl|i_sra;

  assign ALUsrc2=i_addi|i_addiu|i_slti|i_sltiu|i_andi|i_ori|i_xori
                 |i_lui|i_lb|i_lh|i_lw|i_lbu|i_lhu|i_sb|i_sh|i_sw;
  
  assign ALUOp[3]=i_nor|i_sll|i_sllv|i_srl|i_srlv|i_sra|i_srav|i_lui;

  assign ALUOp[2]=i_or|i_xor|i_slt|i_sltu|i_slti|i_sltiu|i_ori
                  |i_xori|i_lui;
  
  assign ALUOp[1]=i_sub|i_subu|i_and|i_xor|i_sltu|i_sltiu|i_srl|i_srlv
                  |i_sra|i_srav|i_andi|i_xori|i_beq|i_bne
                  |i_blez|i_bgtz|i_bltz|i_bgez;
  
  assign ALUOp[0]=i_add|i_addu|i_and|i_xor|i_slt|i_slti|i_sll|i_sllv
                  |i_sra|i_srav|i_addi|i_addiu|i_andi|i_xori
                  |i_lb|i_lh|i_lw|i_lbu|i_lhu|i_sb|i_sh|i_sw;

  assign NPCOp[1]=i_jr|i_jalr|i_j|i_jal;

  assign NPCOp[0]=i_jr|i_jalr|(i_beq&Zero)|(i_bne&(~Zero))|(i_blez&(Sign|Zero))|(i_bgtz&(~Sign&~Zero))|(i_bltz&Sign)|(i_bgez&(~Sign));

  assign MemWrite[1]=i_sb|i_sh;
  
  assign MemWrite[0]=i_sw|i_sb;

  assign MemtoReg[1]=i_jalr|i_jal;

  assign MemtoReg[0]=i_lb|i_lh|i_lw|i_lbu|i_lhu;

  assign BranchZ=i_blez|i_bgtz|i_bltz|i_bgez;

  assign EXTOp=i_addi|i_slti|i_lb|i_lh|i_lw|i_lbu|i_lhu|i_sb|i_sh|i_sw;

endmodule