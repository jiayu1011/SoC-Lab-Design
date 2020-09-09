`include "alu.v"
`include "ctrl_encode_def.v"
`include "EXT.v"
`include "mux.v"
`include "PC.v"
`include "RF.v"
`include "IM.v"
`include "DM.v"
`include "Control.v"
`include "Adder_PCPlus4.v"
`include "Branch_Jump_Detect.v"
`include "BranchAdd.v"
`include "EXMEMReg.v"
`include "ForwardUnit.v"
`include "Hazard_Detect.v"
`include "IDEXReg.v"
`include "IFIDReg.v"
`include "JumpAddress.v"
`include "MEMWBReg.v"

module PCPU(
    input clk,
    input reset,
    input MIO_ready,
    input [31:0]inst_in,
	input [31:0]Data_in,	
	input INT,
									
	output mem_w,
	output[31:0]PC_out,
	output[31:0]Addr_out,
	output[31:0]Data_out, 
	output CPU_MIO
);
    
//-------------------------IF Stage-----------------------------
    //MUX_NPC
    wire [31:0] PCPlus4;
    wire [31:0] JumpPC;
    wire [31:0] IDEXPCPlus4; //棰勬祴閿欒锛岄渶瑕乥ranch涓嬩竴鏉℃寚浠
    wire [1:0] PCSrc1;//閫氳繃Hazard Detect鍒ゅ畾PC婧
    wire [31:0] NPC_First;
    mux4 MUX_NPC1(
        .d0(PCPlus4),
        .d1(JumpPC),
        .d2(IDEXPCPlus4),
        .s(PCSrc1),
        .y(NPC_First)
        );
    
    //MUX_NPC2
    wire [31:0] BranchPC;
    wire [31:0] NPC;
    wire PCSrc2;//閫氳繃Control鍒ゆ柇婧
    mux2 MUX_NPC2(
        .d0(NPC_First),
        .d1(BranchPC),
        .s(PCSrc2),
        .y(NPC)
        );

    //PC module
    wire [31:0] PC_o;
    wire PCWrite;
    PC my_PC(
        .clk(clk),
        .rst(reset),
        .NPC(NPC),
        .PC(PC_o),
        .PC_Write_Final(PCWrite)
        );

    //IM module
    wire [31:0] Instruction;
  //  IM my_IM(
  //      .PC(PC_o),
    //    .Instruction(Instruction)
 //       );

   //PCAdder4
   Adder_PCPlus4 PCAdder4(
       .PC_o(PC_o),
       .PCPlus4(PCPlus4)
       );
    //assign PCPlus4 = PC_o+32'd4;

   //IFIDReg
   wire IFIDStall;
   wire IFIDFlush;
   wire [31:0] IFIDInstruction;
   wire [31:0] IFIDPCPlus4;
   IFIDReg IFIDReg(
       .clk(clk),
       .rst(reset),
       .IFIDStall(IFIDStall),
       .IFIDFlush(IFIDFlush),
       .PCPlus4_i(PCPlus4),
       .Instruction_i(Instruction),
       .PCPlus4_o(IFIDPCPlus4),
       .IFIDInstruction(IFIDInstruction)
       );


//-------------------------ID Stage-----------------------------
    //RF
    wire [4:0] MEMWBRegRd; //浠嶮EM/WB涓繑鍥
    wire [31:0]WriteDataFinal; //浠嶮EM/WB涓繑鍥烇紝ALUResult鎴栬€匧oad
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire MEMWBRegWrite;//浠嶮EM/WB涓繑鍥
     RF my_RF(
         .clk(clk),
         .rst(reset),
         .RFWr(MEMWBRegWrite),
         .A1(IFIDInstruction[25:21]),
         .A2(IFIDInstruction[20:16]),
         .A3(MEMWBRegRd),
         .WD(WriteDataFinal),
         .RD1(ReadData1),
         .RD2(ReadData2)
         );

    //MUX_RegDst;
    wire [1:0] RegDst;//Control
    wire [4:0] RegDstIn;
    mux4_5 MUX_RegDst(
        .d0(IFIDInstruction[20:16]),
        .d1(IFIDInstruction[15:11]),
        .d2(5'b11111),
        .s(RegDst),
        .y(RegDstIn)
        );

    //SignExt
    wire [31:0] SignEXTOffset;
    EXT16 EXTOffset(
        .Imm16(IFIDInstruction[15:0]),
        .EXTOp(1'b1),
        .Imm32(SignEXTOffset)
        );

    //BranchAdd
    BranchAdd BranchAdd(.PCPlus4(IFIDPCPlus4),.SignEXTOffset(SignEXTOffset),.BranchPC(BranchPC));
    //assign BranchPC = PCPlus4+(SignEXTOffset<<2);

    //Control
    wire MemRead;
    wire [1:0] MemtoReg;
    wire [4:0] ALUOp;
    wire MemWrite;
    wire [1:0] Sig_ALUSrcA;
    wire [1:0] Sig_ALUSrcB;
    wire [1:0] MemWrBits;
    wire [2:0] MemRBits;
    wire [1:0] NPCType;//浼犵粰EX涓殑Branch鍒ゆ柇鍗曞厓鏉ヨ繘琛屽垽瀹氥€
    wire JumpSrc;//鐢ㄤ簬JumpAddress涓€夋嫨鐩稿簲鐨凧umpPC
    wire RegWrite;
    Control Control(
        .clk(clk),
        .rst(reset),
        .Op(IFIDInstruction[31:26]),
        .Funct(IFIDInstruction[5:0]),
        .Rs(IFIDInstruction[25:21]),
        .Rt(IFIDInstruction[20:16]),
        .PCSrc(PCSrc2),
        .NPCType(NPCType),
        .JumpSrc(JumpSrc),
        .RegDst(RegDst),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc_A(Sig_ALUSrcA),
        .ALUSrc_B(Sig_ALUSrcB),
        .RegWrite(RegWrite),
        .MemWrBits(MemWrBits),
        .MemRBits(MemRBits)
        );


    //Hazard Detect
    wire [1:0] NextType;//浠嶣ranchJump妫€娴媢nit涓娴
    wire [31:0] IDEXInstruction;
    wire IDEXMemRead ;
    Hazard_Detect Hazard_Detect(
        .Nexttype(NextType),
        .IDEXMEMRead(IDEXMemRead),
        .IDEXRt(IDEXInstruction[20:16]),
        .IFIDRs(IFIDInstruction[25:21]),
        .IFIDRt(IFIDInstruction[20:16]),
        .IFIDStall(IFIDStall),
        .IFIDFlush(IFIDFlush),
        .PCSrc(PCSrc1),
        .PCWrite(PCWrite),
        .IDEXFlush(IDEXFlush)
        );

    //IDEXReg
    wire IDEXStall;
    assign IDEXStall = 1'b0;
    wire [31:0] IDEXRD1;
    wire [31:0] IDEXRD2;
    wire [1:0] IDEXALUSrc_A ;
    wire [1:0] IDEXALUSrc_B;
    wire [31:0] IDEXSignEXT;  
    wire [1:0] IDEXNPCType ;
    wire IDEXMemWrite ;
    wire [1:0] IDEXMemWrBits; 
    wire [1:0] IDEXMemtoReg ;
    wire [2:0] IDEXMemRBits; 
    wire IDEXJumpSrc ;
    wire [4:0] IDEXALUOp ;
    wire [4:0] IDEXRegRd ;
    wire IDEXRegWrite; //浼犲埌WB鍚庡啀浼犲洖鏉
    IDEXReg IDEXReg(
        .clk(clk),
        .rst(reset),
        .IDEXStall(IDEXStall),
        .IDEXFlush(IDEXFlush),
        .RD1_i(ReadData1),
        .IDEXRD1(IDEXRD1),
        .RD2_i(ReadData2),
        .IDEXRD2(IDEXRD2),
        .PCPlus4_i(IFIDPCPlus4),
        .IDEXPCPlus4(IDEXPCPlus4),
        .SignEXT_i(SignEXTOffset),
        .IDEXSignEXT(IDEXSignEXT),
        .Instruction(IFIDInstruction),
        .IDEXInstruction(IDEXInstruction),
        .WriteBackDst(RegDstIn),
        .IDEXRegRd(IDEXRegRd),
        .RegWrite(RegWrite),
        .IDEXRegWrite(IDEXRegWrite),
        .ALUOp(ALUOp),
        .IDEXALUOp(IDEXALUOp),
        .MemRead(MemRead),
        .IDEXMemRead(IDEXMemRead),
        .MemWrite(MemWrite),
        .IDEXMemWrite(IDEXMemWrite),
        .NPCType(NPCType),
        .IDEXNPCType(IDEXNPCType),
        .MemRBits(MemRBits),
        .IDEXMemRBits(IDEXMemRBits),
        .MemWrBits(MemWrBits),
        .IDEXMemWrBits(IDEXMemWrBits),
        .MemtoReg(MemtoReg),
        .IDEXMemtoReg(IDEXMemtoReg),
        .ALUSrc_A(Sig_ALUSrcA),
        .IDEXALUSrc_A(IDEXALUSrc_A),
        .ALUSrc_B(Sig_ALUSrcB),
        .IDEXALUSrc_B(IDEXALUSrc_B),
        .JumpSrc(JumpSrc),
        .IDEXJumpSrc(IDEXJumpSrc)
        );


//------------------------EX Stage--------------------------
    //MUX_ForwardA
    wire [1:0] ForwardA;
    wire  [31:0] ALUSrcA_First;
    wire [31:0] EXMEMALUResult;
    mux4 MUX_ForwardA(
        .d0(IDEXRD1),
        .d1(WriteDataFinal),
        .d2(EXMEMALUResult),
        .s(ForwardA),
        .y(ALUSrcA_First)
        );

    //MUX_ALUSrcA
    wire [31:0] ALUSrcAData;
    mux4 MUX_ALUSrcA(
        .d0(ALUSrcA_First),
        .d1({27'b0,IDEXInstruction[10:6]}),
        .s(IDEXALUSrc_A),
        .y(ALUSrcAData)
        );

    //JumpAddress unit
    //ALUSrcA_First涓篎orward鍚庣殑缁撴灉锛屽彲浠ヨВ鍐砵alr锛宩r涓娇鐢╮s鐨勬暟鎹啋闄╅棶棰
   JumpAddress JumpAddress(
       .IDEXPCPlus4(IDEXPCPlus4),
       .IDEXInstruction(IDEXInstruction),
       .GPR_RS(ALUSrcA_First),
       .IDEXJumpSrc(IDEXJumpSrc),
       .JumpPC(JumpPC)
       );

    //MUX_ForwardB
    wire [1:0] ForwardB;
    wire [31:0] ALUSrcB_First;
    mux4 MUX_ForwardB(
        .d0(IDEXRD2),
        .d1(WriteDataFinal),
        .d2(EXMEMALUResult),
        .s(ForwardB),
        .y(ALUSrcB_First)
        );

    //MUX_ALUSrcB
    wire [31:0] ALUSrcBData;
    mux4 MUX_ALUSrcB(
        .d0(ALUSrcB_First),
        .d1(IDEXSignEXT),
        .s(IDEXALUSrc_B),
        .y(ALUSrcBData)
        );

    //ALU
    wire Zero;
    wire [31:0] ALUResult;
    alu ALU(
        .A(ALUSrcAData),
        .B(ALUSrcBData),
        .ALUOp(IDEXALUOp),
        .C(ALUResult),
        .Zero(Zero)
        );

    //Branch_Jump_Detect
    //NextType鍦℉azardDetect涓渶鍚庣敓鎴愭墍闇€瑕佺殑PCSrc1淇″彿鐢ㄤ綔閫夋嫨
    Branch_Jump_Detect Branch_Jump_Detect(
        .NPCType(IDEXNPCType),
        .Zero(Zero),
        .NextType(NextType)
        );

    //ForwardUnit
    wire EXMEMRegWrite;
    wire [4:0] EXMEMRegRd;
    wire ForwardC;
    wire MEMWBMemRead;
    wire EXMEMMemWrite;
    ForwardUnit ForwardUnit(
        .EXMEMRegWrite(EXMEMRegWrite),
        .EXMEMRegRd(EXMEMRegRd),
        .IDEXRegRs(IDEXInstruction[25:21]),
        .IDEXRegRt(IDEXInstruction[20:16]),
        .MEMWBRegWrite(MEMWBRegWrite),
        .MEMWBRegRd(MEMWBRegRd),
        .ForwardA(ForwardA),
        .ForwardB(ForwardB),
        .ForwardC(ForwardC),
        .MEMWBMemRead(MEMWBMemRead),
        .EXMEMMemWrite(EXMEMMemWrite)
        );

    //EXMEMReg
    wire EXMEMStall;
    assign EXMEMStall = 1'b0;
    wire EXMEMFlush;
    assign EXMEMFlush = 1'b0;
    wire [31:0] EXMEMInstruction;
    wire [31:0] EXMEMPCPlus4;
    wire [31:0] EXMEMMemWriteData;
    wire [1:0] EXMEMMemWrBits;
    wire EXMEMMemRead;
    wire [2:0] EXMEMMemRBits;
    wire [1:0] EXMEMMemtoReg;
    EXMEMReg EXMEMReg(
     .clk(clk),
     .rst(reset),
     .EXMEMStall(EXMEMStall),
     .EXMEMFlush(EXMEMFlush),
     .IDEXInstruction(IDEXInstruction),
     .EXMEMInstruction(EXMEMInstruction),
     .IDEXPCPlus4(IDEXPCPlus4),
     .EXMEMPCPlus4(EXMEMPCPlus4),
     .IDEXMemWriteData(ALUSrcB_First), //store value
     .EXMEMMemWriteData(EXMEMMemWriteData),
     .ALUResult(ALUResult),
     .EXMEMALUResult(EXMEMALUResult),
     .IDEXRegRd(IDEXRegRd),
     .EXMEMRegRd(EXMEMRegRd),
     .IDEXRegWrite(IDEXRegWrite),
     .EXMEMRegWrite(EXMEMRegWrite),
     .IDEXMemWrite(IDEXMemWrite),
     .EXMEMMemWrite(EXMEMMemWrite),
     .IDEXMemWrBits(IDEXMemWrBits),
     .EXMEMMemWrBits(EXMEMMemWrBits),
     .IDEXMemRead(IDEXMemRead),
     .EXMEMMemRead(EXMEMMemRead),
     .IDEXMemRBits(IDEXMemRBits),
     .EXMEMMemRBits(EXMEMMemRBits),
     .IDEXMemtoReg(IDEXMemtoReg),
     .EXMEMMemtoReg(EXMEMMemtoReg)
    );

    //-------------------MEM Stage-------------------------------

    //ForwardC
    wire [31:0] EXMEMMemWriteDataFinal;
    mux2 MUX_ForwardC(
        .d0(EXMEMMemWriteData),
        .d1(WriteDataFinal),
        .s(ForwardC),
        .y(EXMEMMemWriteDataFinal)
        );

    //DataMemory
    wire [31:0] EXMEMMemReadData;
 /*   DM DM(
        .clk(clk),
        .MemR(EXMEMMemRead),
        .MemWr(EXMEMMemWrite),
        .MemWrBits(EXMEMMemWrBits),
        .MemRBits(EXMEMMemRBits),
        .addr(EXMEMALUResult),
        .data(EXMEMMemWriteDataFinal),
        .ReadData(EXMEMMemReadData)
        );*/

    //MEMWBReg
    wire MEMWBStall;
    assign MEMWBStall = 1'b0;
    wire MEMWBFlush;
    assign MEMWBFlush = 1'b0;
    wire [31:0] MEMWBInstruction;
    wire [31:0] MEMWBPCPlus4;
    wire [31:0] MEMWBALUResult;
    wire [31:0] MEMWBMemoryData;
    wire [1:0] MEMWBMemtoReg;
    MEMWBReg MEMWBReg(
        .clk(clk),
        .rst(reset),
        .MEMWBStall(MEMWBStall),
        .MEMWBFlush(MEMWBFlush),
        .EXMEMInstruction(EXMEMInstruction),
        .MEMWBInstruction(MEMWBInstruction),
        .EXMEMPCPlus4(EXMEMPCPlus4),
        .MEMWBPCPlus4(MEMWBPCPlus4),
        .EXMEMALUResult(EXMEMALUResult),
        .MEMWBALUResult(MEMWBALUResult),
        .MemoryData(EXMEMMemReadData),
        .MEMWBMemoryData(MEMWBMemoryData),
        .EXMEMRegRd(EXMEMRegRd),
        .MEMWBRegRd(MEMWBRegRd),
        .EXMEMRegWrite(EXMEMRegWrite),
        .MEMWBRegWrite(MEMWBRegWrite),
        .EXMEMMemtoReg(EXMEMMemtoReg),
        .MEMWBMemtoReg(MEMWBMemtoReg),
        .EXMEMMemRead(EXMEMMemRead),
        .MEMWBMemRead(MEMWBMemRead)
        );

    //--------------------------WB Stage---------------------------------

    //MemtoReg MUX
    mux4 MUX_MemtoReg(
        .d0(MEMWBALUResult),
        .d1(MEMWBMemoryData),
        .d2(MEMWBPCPlus4),
        .s(MEMWBMemtoReg),
        .y(WriteDataFinal)
        );

    assign EXMEMMemReadData = Data_in;
    assign Instruction = inst_in;
    assign PC_out = PC_o;
    assign mem_w = EXMEMMemWrite;
    assign Addr_out = EXMEMALUResult;
    assign Data_out = EXMEMMemWriteDataFinal;


endmodule

    