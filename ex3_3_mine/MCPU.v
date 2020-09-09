`include "alu.v"
`include "ctrl_encode_def.v"
`include "EXT.v"
`include "mux.v"
`include "PC.v"
`include "RF.v"
`include "Control.v"
`include "Register.v"

module MCPU(
    input MIO_ready, 
    input clk, 
    input reset, 
    input INT, 
    input [31:0] Data_in, 

    output mem_w,
    output [31:0] inst_out, 
    output [31:0] PC_out, 
    output [4:0] state, 
    output [31:0] Data_out, 
    output [31:0] Addr_out, 
    output CPU_MIO
    );
    

    wire [31:0] PC_i; 
    wire [31:0] PC_o;
    wire PC_Write_Final;
    PC my_PC(
        .clk(clk),
        .rst(reset),
        .NPC(PC_i),
        .PC(PC_o),
        .PC_Write_Final(PC_Write_Final)
        );

    //wire [31:0] Instruction;
    //IM my_IM(.PC(PC_o),.Instruction(Instruction));


    wire IRWrite;
    wire [31:0] Instruction_out;
    Register InstrReg(
        .clk(clk),
        .WriteSignal(IRWrite),
        .in(Data_in),
        .out(Instruction_out)
        );


    wire [4:0]writeRegister;
    wire [4:0] reg_ra = 5'b11111;//r31
    wire [1:0] RegDst;
    mux4_5 muxRegDst(
        .d0(Instruction_out[20:16]),
        .d1(Instruction_out[15:11]),
        .d2(reg_ra),
        .s(RegDst),
        .y(writeRegister)
        );


    wire RegWrite;
    wire [31:0]ReadData1;
    wire [31:0]ReadData2;
    wire [31:0]WriteDataFinal;
    RF my_RF(
        .clk(clk),
        .rst(reset),
        .RFWr(RegWrite),
        .A1(Instruction_out[25:21]),
        .A2(Instruction_out[20:16]),
        .A3(writeRegister),
        .WD(WriteDataFinal),
        .RD1(ReadData1),
        .RD2(ReadData2)
        );
    

    wire [31:0] RegA_o;
    Register  RegA(
        .clk(clk),
        .WriteSignal(1'b1),
        .in(ReadData1),
        .out(RegA_o)
        );
    

    wire [31:0] RegB_o;
    Register  RegB(
        .clk(clk),
        .WriteSignal(1'b1),
        .in(ReadData2),
        .out(RegB_o)
        );
    assign Data_out = RegB_o;

    wire [1:0] Sig_ALUSrcA;
    wire [31:0] ALUSrcA;
    mux4 MUX_ALUSrcA(
        .d0(RegA_o),
        .d1(PC_o),
        .d2({27'b0,Instruction_out[10:6]}),
        .s(Sig_ALUSrcA),.y(ALUSrcA)
        );

    //EXT16 Instr[15:0] -> 31:0 SignEXT 
    wire [31:0] Instr_32;
    EXT16 my_EXT(
        .Imm16(Instruction_out[15:0]),
        .EXTOp(1'b1),
        .Imm32(Instr_32)
        );


    wire [1:0] Sig_ALUSrcB;
    wire [31:0] ALUSrcB;
    mux4 MUX_ALUSrcB(
        .d0(RegB_o),
        .d1(32'd4),
        .d2(Instr_32),
        .d3(Instr_32 << 2),
        .s(Sig_ALUSrcB),
        .y(ALUSrcB)
        );


    wire [4:0] ALUOp;
    wire [31:0] ALUResult;
    wire zero;
    alu ALU(
        .A(ALUSrcA),
        .B(ALUSrcB),
        .ALUOp(ALUOp),
        .C(ALUResult),
        .Zero(zero)
        );


    wire [31:0] ALUOut_o;
    Register ALUOut(
        .clk(clk),
        .WriteSignal(1'b1),
        .in(ALUResult),
        .out(ALUOut_o)
        );


    wire IorD;
    mux2 MUX_Address(
        .d0(PC_o),
        .d1(ALUOut_o),
        .s(IorD),
        .y(Addr_out)
        );

    

    // wire MemR;
    // wire MemWr;
    // wire [1:0] MemWrBits;
    // wire [2:0] MemRBits;
    // wire [31:0]ReadData;
    // DM DataMemory(.clk(clk),.MemR(MemR),.MemWr(MemWr),.MemWrBits(MemWrBits),.MemRBits(MemRBits),.addr(ALUOut_o),.data(RegB_o),.ReadData(ReadData)); //��b�Ĵ�����ֱ�Ӷ�

    wire [31:0] MemData_o;
    wire MemDataRegWrite;
    Register MemDataReg(
        .clk(clk),
        .WriteSignal(1'b1),
        .in(Data_in),
        .out(MemData_o)
        );


    wire [1:0] MemtoReg;
    mux4 MUX_WriteBack(
        .d0(MemData_o),
        .d1(ALUOut_o),
        .d2(PC_o),
        .s(MemtoReg),
        .y(WriteDataFinal)
        );

    //MUX PCSrc
    wire [1:0] PCSrc;
    mux4 MUX_PCSrc(
        .d1(ALUOut_o),
        .d0(ALUResult),
        .d2({PC_o[31:28],Instruction_out[25:0],2'b00}),
        .d3(RegA_o),
        .s(PCSrc),
        .y(PC_i)
        );

    //Control
    wire PCWrite;
    wire PCWriteCond;
    wire AddressDst;
    Control my_Control(
        .clk(clk),
        .rst(reset),
        .OP(Instruction_out[31:26]),
        .Funct(Instruction_out[5:0]),
        .Rt(Instruction_out[20:16]),
        .PCWrite(PCWrite),
        .PCWriteCond(PCWriteCond),
        .PCSrc(PCSrc),
        .IRWrite(IRWrite),
        .RegDst(RegDst),
        .MemRead(MemR),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWr),
        .ALUSrc_A(Sig_ALUSrcA),
        .ALUSrc_B(Sig_ALUSrcB),
        .RegWrite(RegWrite),
        .MemWrBits(MemWrBits),
        .MemRBits(MemRBits),
        .state(state),
        .MemDataRegWrite(MemDataRegWrite),
        .AddressDst(AddressDst),
        .IorD(IorD)
        );

    assign PC_Write_Final = PCWrite | (PCWriteCond & zero);

    assign mem_w = MemWr;
    assign PC_out = PC_o;
    assign inst_out = Instruction_out;



endmodule

    