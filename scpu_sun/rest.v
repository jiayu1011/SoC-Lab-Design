
/*
cpu_dataflow  U1 (
    .clk                     ( Clk_CPU              ),
    .reset                   ( rst                  ),
  //.MIO_ready               ( MIO_ready            ), 
    .inst_in                 ( inst                 ),//[31:0]
    .Data_in                 ( Data_in              ),//[31:0]
    .INT                     ( counter0_out         ), 

    .mem_w                   ( mem_w       ),
    .PC_out                  ( PC          ),//[31:0]
    .Addr_out                ( Addr_out    ),
    .Data_out                ( Data_out    )//[31:0]
  //.CPU_MIO                 ( CPU_MIO     )   
);
*/
module cpu_dataflow(
input clk, reset,
input [31:0]inst_in,Data_in,
output [31:0]PC_out, Data_out, Addr_out,
output [1:0]mem_w
);

wire [1:0]RegDst, NPCOp, MemtoReg;
wire [2:0]RegWrite;
wire ALUsrc1, ALUsrc2, EXTOp;
wire [3:0]ALUOp;
wire Zero,Sign,BranchZ;
wire [5:0]WriteReg;
wire [31:0]ExtImm, RegWriteData;
wire [31:0]Read1, Jraddr;
wire shamt;
wire [31:0]ALUa;
wire [31:0]nextpc;
wire [31:0]ALUbb;
wire [31:0]ALUb;
control_unit cu( inst_in[31:26], inst_in[5:0], inst_in[20:16], Zero, Sign,
 RegDst, RegWrite, NPCOp,mem_w, MemtoReg, ALUsrc1, ALUsrc2, BranchZ, EXTOp, ALUOp);

EXT extension( inst_in[15:0], EXTOp, ExtImm);

RF RegFile( clk, reset, RegWrite, inst_in[25:21], inst_in[20:16], WriteReg, RegWriteData, Read1, Data_out, inst_in[25:21], Jraddr);

mux4_5 RegD( inst_in[20:16], inst_in[15:11], 5'd31, 5'd31, RegDst, WriteReg);
mux2_32 ALU_a( Read1, {27'b0,inst_in[10:6]}, ALUsrc1, ALUa);
mux2_32 ALU_bb( Data_out, ExtImm, ALUsrc2, ALUbb);
mux2_32 ALU_b( ALUbb, 32'b0, BranchZ, ALUb);
mux4_32 Mem2Reg( Addr_out, MemOut, PC_out+4, 32'b0, MemtoReg, RegWriteData);

alu ALU( ALUa, ALUb, ALUOp, Addr_out, Zero, Sign);
NPC NextPC( PC_out, NPCOp, inst_in[25:0], nextpc, Jraddr);
PC PC_unit( clk, reset, nextpc, PC_out);


endmodule