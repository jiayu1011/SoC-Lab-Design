module Top(
    input clk_100mhz,

    //U9 in&out
    input RSTN,
    input [3:0]BTN_y,
    output [4:0]BTN_x,
    input [15:0]SW,
    output CR, RDY, 

    //M4 in&out
    output readn,

    //U6 in&out
    output seg_clk, seg_sout, SEG_PEN, seg_clrn,

    //U7 in&out
    output led_clk, led_sout, LED_PEN, led_clrn
);

  	//U1
	wire rst, MIO_Ready;
	wire [31:0]inst, Data_in;
	wire mem_w, CPU_MIO;
	wire [31:0] PC, Addr_out, Data_out;

	// U4
	wire [31:0]ram_data_in;
	wire data_ram_we;
	wire [9:0]ram_addr;
	wire [31:0]ram_data_out;
	wire [31:0] CPU2IO;
	wire EN;
	wire GPIOF0;
	wire [15:0]LED_out;
	wire [31:0]Counter_out;
	wire counter2_out;
	wire counter1_out;
	wire counter0_out;
	wire counter_we;
	//U5

	wire [31:0]Disp_num;
	wire [7:0]point_out;
	wire [7:0]LE_out;
	//U6

	//U7
	wire [1:0]counter_set;

	//U8
	wire [31:0]Div;
	wire Clk_CPU;

	//U9

	wire [15:0]SW_OK;
	wire [4:0]Key_out;
	wire [3:0]pulse_out;
	wire [3:0]BTN_OK;
	//U10

	//M4
	wire [31:0]Ai;
	wire [31:0]Bi;
	wire [7:0]blink;

  SCPU  U1 (
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
  
  ROM_B  U2 (
    .a                   ( PC[11:2]   ),//[9:0]

    .spo                 ( inst       )  //[31:0]
);
  
  RAM_B  U3 (
    .clka                    ( clk_100mhz      ),
    .wea                     ( data_ram_we     ),
    .addra                   ( ram_addr        ),//[9:0]
    .dina                    ( ram_data_in     ),//[31:0]

    .douta                   ( ram_data_out    )//[31:0]
);
  
  MIO_BUS  U4 (
    .clk                     ( clk_100mhz               ),
    .rst                     ( rst                      ),
    .BTN                     ( BTN_OK                   ),//[3:0]
    .SW                      ( SW_OK                    ),//[15:0]
    .mem_w                   ( mem_w                    ),
    .Cpu_data2bus            ( Data_out                 ),//[31:0]
    .addr_bus                ( Addr_out                 ),//[31:0]
    .ram_data_out            ( ram_data_out             ),//[31:0]
    .led_out                 ( LED_out                  ),//[15:0]
    .counter_out             ( Counter_out              ),//[31:0]
    .counter0_out            ( counter0_out             ),
    .counter1_out            ( counter1_out             ),
    .counter2_out            ( counter2_out             ),

    .Cpu_data4bus            ( Data_in                  ),
    .ram_data_in             ( ram_data_in              ),
    .ram_addr                ( ram_addr                 ),//[9:0]
    .data_ram_we             ( data_ram_we              ),
    .GPIOf0000000_we         ( GPIOF0                   ),
    .GPIOe0000000_we         ( EN                       ),
    .counter_we              ( counter_we               ),
    .Peripheral_in           ( CPU2IO                   )//[31:0]
);

  Multi_8CH32  U5 (
    .clk                     ( ~Clk_CPU                 ),
    .rst                     ( rst                      ),
    .EN                      ( EN                       ),
    .Test                    ( SW_OK[7:5]               ),//[2:0]
    .point_in                ( {Div[31:0], Div[31:0]}   ),//[63:0]
    .LES                     ( 64'b0                    ),
    .Data0                   ( CPU2IO                   ),
    .data1                   ( {2'b0, PC[31:2]}         ),
    .data2                   ( inst                     ),
    .data3                   ( Counter_out              ),
    .data4                   ( Addr_out                 ),
    .data5                   ( Data_out                 ),
    .data6                   ( Data_in                  ),
    .data7                   ( PC                       ),

    .point_out               ( point_out         ),
    .LE_out                  ( LE_out           ),
    .Disp_num                ( Disp_num         )
);

  SSeg7_Dev  U6 (
    .clk                     ( clk_100mhz         ),
    .rst                     ( rst                ),
    .Start                   ( Div[20]            ),
    .SW0                     ( SW_OK[0]           ),
    .flash                   ( Div[25]            ),
    .Hexs                    ( Disp_num           ),
    .point                   ( point_out          ),
    .LES                     ( LE_out             ),

    .seg_clk                 ( seg_clk    ),
    .seg_sout                ( seg_sout   ),
    .SEG_PEN                 ( SEG_PEN    ),
    .seg_clrn                ( seg_clrn   )
);

  SPIO  U7 (
    .clk                     ( ~Clk_CPU               ),
    .rst                     ( rst                    ),
    .Start                   ( Div[20]                ),
    .EN                      ( GPIOF0                 ),
    .P_Data                  ( CPU2IO                 ),

    .counter_set             ( counter_set            ),
    .LED_out                 ( LED_out                ),
    .led_clk                 ( led_clk                ),
    .led_sout                ( led_sout               ),
    .led_clrn                ( led_clrn               ),
    .LED_PEN                 ( LED_PEN                )
  //.GPIOf0                  ( GPIOf0                 )
);
  
  clk_div  U8 (
    .clk                     ( clk_100mhz        ),
    .rst                     ( rst               ),
    .SW2                     ( SW_OK[2]          ),

    .clkdiv                  ( Div               ),
    .Clk_CPU                 ( Clk_CPU           )
);

  SAnti_jitter  U9 (
    .clk                     ( clk_100mhz           ),
    .RSTN                    ( RSTN                 ),
    .readn                   ( readn                ),
    .Key_y                   ( BTN_y                ),
    .SW                      ( SW                   ),
 
    .Key_x                   ( BTN_x                ),
    .Key_out                 ( Key_out              ),
    .Key_ready               ( RDY                  ),
    .pulse_out               ( pulse_out            ),
    .BTN_OK                  ( BTN_OK               ),
    .SW_OK                   ( SW_OK                ),
    .CR                      ( CR                   ),
    .rst                     ( rst                  )
);

  Counter_x  U10 (
    .clk                     ( ~Clk_CPU       ),
    .rst                     ( rst            ),
    .clk0                    ( Div[6]         ),
    .clk1                    ( Div[9]         ),
    .clk2                    ( Div[11]        ),
    .counter_we              ( counter_we     ),
    .counter_val             ( CPU2IO         ),
    .counter_ch              ( counter_set    ),

    .counter0_OUT            ( counter0_out   ),
    .counter1_OUT            ( counter1_out   ),
    .counter2_OUT            ( counter2_out   ),
    .counter_out             ( Counter_out    )
);

  SEnter_2_32  M4 (
    .clk                     ( clk_100mhz    ),
    .BTN                     ( BTN_OK[2:0]   ),
    .Ctrl                    ( {SW_OK[7:5], SW_OK[15], SW_OK[0]}),
    .D_ready                 ( RDY           ),
    .Din                     ( Key_out  ),

    .readn                   ( readn         ),
    .Ai                      ( Ai            ),
    .Bi                      ( Bi            ),
    .blink                   ( blink         )
);

endmodule