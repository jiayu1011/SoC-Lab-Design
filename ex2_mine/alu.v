`include "ctrl_encode_def.v"

module alu(A, B, ALUOp, C, Zero, Sign);
           
   input  signed [31:0] A, B;
   input         [3:0]  ALUOp;
   output signed [31:0] C;
   output Zero,Sign;
   
   reg [31:0] C;
   integer    i;
       
   always @( * ) begin
      case ( ALUOp )
          `ALU_NOP:  C = A;                          // NOP
          `ALU_ADD:  C = A + B;                      // ADD/ADDI/ADDU
          `ALU_SUB:  C = A - B;                      // SUB/SUBU
          `ALU_AND:  C = A & B;                      // AND/ANDI
          `ALU_OR:   C = A | B;                      // OR/ORI
          `ALU_SLT:  C = (A < B);                    // SLT/SLTI
          `ALU_SLTU: C = ({1'b0, A} < {1'b0, B});
          `ALU_XOR:  C = A^B;
          `ALU_NOR:  C = ~(A|B);
          `ALU_SLL:  C = B<<A[5:0];  
          `ALU_SRL:  C = B>>A[5:0]; 
          `ALU_SRA:  C = $signed(B)>>>A[5:0]; 
          `ALU_LUI:  C = {B[15:0],16'b0};   
          default:   C = A;                          // Undefined
      endcase
   end // end always
   
   assign Zero = (C == 32'b0);
   assign Sign = C[31];

endmodule
    
