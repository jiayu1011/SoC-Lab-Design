`include "ctrl_encode_def.v"
module DM(
    input clk,
    input MemR,
    input MemWr,
    input [1:0] MemWrBits,
    input [2:0] MemRBits,
    input [31:0]addr,
    input [31:0]data,
    output reg [31:0]ReadData
);
    reg [7:0] Data_Memory [0:511];
    integer i;
	initial
		begin
		for(i = 0;i < 512;i = i + 1)
			Data_Memory[i] <= 0;
		end
    
    always@(negedge clk)//前半周期写入
    begin
        if(MemWr == 1)
            begin
            case(MemWrBits)
                2'b00: //sw
                    begin
                    Data_Memory[addr] <= data[7:0];
                    Data_Memory[addr+1] <= data[15:8];
                    Data_Memory[addr+2] <= data[23:16];
                    Data_Memory[addr+3] <= data[31:24];
                    end
                2'b01: //sh
                    begin
                    Data_Memory[addr] <= data[7:0];
                    Data_Memory[addr+1] <= data[15:8];
                    end
                2'b10: //sb
                    begin
                    Data_Memory[addr] <= data[7:0];
                    end           
            endcase
            end
    end
    always@(*)
    begin
    case(MemRBits)
        `MemR_lw:
            begin
            ReadData <= (MemR == 1)? {Data_Memory[addr+3],Data_Memory[addr+2],Data_Memory[addr+1],Data_Memory[addr]} : 0;
            end
        `MemR_lhu: //lhu
            begin
            ReadData <= (MemR == 1)? {16'b0,Data_Memory[addr+1],Data_Memory[addr]} :0; 
            end
        `MemR_lh: //lh
            begin
            ReadData <= (MemR == 1)? {{16{Data_Memory[addr+1][7]}},Data_Memory[addr+1],Data_Memory[addr]} :0; 
            end
        `MemR_lbu: //lbu
            begin
            ReadData <= (MemR == 1)? {24'b0,Data_Memory[addr]} : 0;    
            end
        `MemR_lb: //lb
            begin
            ReadData <= (MemR == 1)? {{24{Data_Memory[addr][7]}},Data_Memory[addr]} : 0;    
            end
    endcase
    end
endmodule