<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Disp_num(31:0)" />
        <signal name="LE_out(7:0)" />
        <signal name="point_out(7:0)" />
        <signal name="V5" />
        <signal name="Div(25)" />
        <signal name="rst" />
        <signal name="clk_100mhz">
            <attr value="t9" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="SW_OK(0)" />
        <signal name="seg_clk" />
        <signal name="seg_sout" />
        <signal name="SEG_PEN" />
        <signal name="seg_clrn" />
        <signal name="SW_OK(7:5)" />
        <signal name="Div(31:0),Div(31:0)" />
        <signal name="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,blink(3:0),N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,blink(7:0),blink(7:0)" />
        <signal name="N0" />
        <signal name="CNT(31:0)" />
        <signal name="XLXN_240(31:0)" />
        <signal name="Bi(31:0)" />
        <signal name="XLXN_280(31:0)" />
        <signal name="readn" />
        <signal name="blink(7:0)" />
        <signal name="RDY" />
        <signal name="SW(15:0)">
            <attr value="K13,K14,J13,J14,H13,H14,G12,F12" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="BTN_x(4:0)" />
        <signal name="BTN_y(3:0)">
            <attr value="E13,F14,G14,D14" name="LOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
        </signal>
        <signal name="RSTN" />
        <signal name="SW_OK(7:5),SW_OK(15),SW_OK(0)" />
        <signal name="BTN_OK(3:0)" />
        <signal name="BTN_OK(2:0)" />
        <signal name="XLXN_444(4:0)" />
        <signal name="CR" />
        <signal name="Ai(31:0)" />
        <signal name="SW_OK(15:0)" />
        <signal name="SW_OK(2)" />
        <signal name="Div(31:0)" />
        <signal name="Clk_CPU" />
        <signal name="Div(20)" />
        <signal name="Pulse(3:0)" />
        <signal name="XLXN_449(31:0)" />
        <signal name="N0,N0,N0,N0,N0,SW(3),Div(27:24)" />
        <signal name="XLXN_455" />
        <signal name="SW_OK(4)" />
        <signal name="XLXN_469(31:0)" />
        <signal name="led_clk" />
        <signal name="led_sout" />
        <signal name="LED_PEN" />
        <signal name="led_clrn" />
        <signal name="SW(13:0),SW_OK(15:0),N0,N0" />
        <port polarity="Input" name="clk_100mhz" />
        <port polarity="Output" name="seg_clk" />
        <port polarity="Output" name="seg_sout" />
        <port polarity="Output" name="SEG_PEN" />
        <port polarity="Output" name="seg_clrn" />
        <port polarity="Output" name="readn" />
        <port polarity="Output" name="RDY" />
        <port polarity="Input" name="SW(15:0)" />
        <port polarity="Output" name="BTN_x(4:0)" />
        <port polarity="Input" name="BTN_y(3:0)" />
        <port polarity="Input" name="RSTN" />
        <port polarity="Output" name="CR" />
        <port polarity="Output" name="led_clk" />
        <port polarity="Output" name="led_sout" />
        <port polarity="Output" name="LED_PEN" />
        <port polarity="Output" name="led_clrn" />
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="Multi_8CH32">
            <timestamp>2015-11-8T11:47:47</timestamp>
            <line x2="0" y1="-528" y2="-528" style="linewidth:W" x1="32" />
            <line x2="0" y1="-464" y2="-464" style="linewidth:W" x1="32" />
            <line x2="0" y1="-672" y2="-672" x1="32" />
            <line x2="0" y1="-624" y2="-624" x1="32" />
            <line x2="0" y1="-576" y2="-576" x1="32" />
            <line x2="0" y1="-416" y2="-416" style="linewidth:W" x1="32" />
            <line x2="0" y1="-368" y2="-368" style="linewidth:W" x1="32" />
            <line x2="0" y1="-320" y2="-320" style="linewidth:W" x1="32" />
            <line x2="0" y1="-272" y2="-272" style="linewidth:W" x1="32" />
            <line x2="0" y1="-224" y2="-224" style="linewidth:W" x1="32" />
            <line x2="0" y1="-176" y2="-176" style="linewidth:W" x1="32" />
            <line x2="0" y1="-128" y2="-128" style="linewidth:W" x1="32" />
            <line x2="0" y1="-80" y2="-80" style="linewidth:W" x1="32" />
            <line x2="0" y1="-32" y2="-32" style="linewidth:W" x1="32" />
            <line x2="352" y1="-576" y2="-576" style="linewidth:W" x1="384" />
            <line x2="352" y1="-528" y2="-528" style="linewidth:W" x1="384" />
            <line x2="352" y1="-624" y2="-624" style="linewidth:W" x1="384" />
            <rect style="fillcolor:rgb(179,164,255);fillstyle:Solid" width="320" x="32" y="-696" height="696" />
        </blockdef>
        <blockdef name="clk_div">
            <timestamp>2015-12-27T10:17:42</timestamp>
            <rect style="linewidth:W;linecolor:rgb(0,0,255);fillcolor:rgb(142,240,255);fillstyle:Solid" width="256" x="32" y="-140" height="140" />
            <line x2="0" y1="-80" y2="-80" x1="32" />
            <line x2="0" y1="-112" y2="-112" x1="32" />
            <line x2="0" y1="-32" y2="-32" x1="32" />
            <line x2="320" y1="-112" y2="-112" style="linewidth:W" x1="288" />
            <line x2="320" y1="-32" y2="-32" x1="288" />
        </blockdef>
        <blockdef name="SPIO">
            <timestamp>2015-12-27T17:4:20</timestamp>
            <line x2="32" y1="-224" y2="-224" x1="64" />
            <line x2="32" y1="-32" y2="-32" style="linewidth:W" x1="64" />
            <line x2="464" y1="-224" y2="-224" style="linewidth:W" x1="448" />
            <line x2="32" y1="-176" y2="-176" x1="64" />
            <line x2="32" y1="-128" y2="-128" x1="64" />
            <line x2="32" y1="-80" y2="-80" x1="64" />
            <line x2="464" y1="-192" y2="-192" style="linewidth:W" x1="448" />
            <line x2="464" y1="-160" y2="-160" style="linewidth:W" x1="448" />
            <line x2="448" y1="-128" y2="-128" x1="464" />
            <line x2="464" y1="-96" y2="-96" x1="448" />
            <line x2="448" y1="-32" y2="-32" x1="464" />
            <line x2="464" y1="-64" y2="-64" x1="448" />
            <rect style="fillcolor:rgb(149,160,255);fillstyle:Solid" width="384" x="64" y="-260" height="256" />
        </blockdef>
        <blockdef name="SSeg7_Dev">
            <timestamp>2015-12-28T12:22:47</timestamp>
            <line x2="0" y1="-48" y2="-48" style="linewidth:W" x1="32" />
            <line x2="368" y1="-160" y2="-160" x1="384" />
            <line x2="368" y1="-224" y2="-224" x1="384" />
            <line x2="368" y1="-96" y2="-96" x1="384" />
            <line x2="0" y1="-80" y2="-80" style="linewidth:W" x1="32" />
            <line x2="0" y1="-112" y2="-112" style="linewidth:W" x1="32" />
            <rect style="linecolor:rgb(0,0,0);fillcolor:rgb(174,185,255);fillstyle:Solid" width="336" x="32" y="-372" height="360" />
            <line x2="0" y1="-224" y2="-224" x1="32" />
            <line x2="0" y1="-160" y2="-160" x1="32" />
            <line x2="368" y1="-288" y2="-288" x1="384" />
            <line x2="0" y1="-336" y2="-336" x1="32" />
            <line x2="0" y1="-304" y2="-304" x1="32" />
            <line x2="0" y1="-272" y2="-272" x1="32" />
        </blockdef>
        <blockdef name="SAnti_jitter">
            <timestamp>2015-12-27T10:36:31</timestamp>
            <rect style="linewidth:W;linecolor:rgb(0,0,255);fillcolor:rgb(170,255,255);fillstyle:Solid" width="300" x="64" y="-248" height="256" />
            <line x2="32" y1="-64" y2="-64" style="linewidth:W" x1="64" />
            <line x2="32" y1="-32" y2="-32" x1="64" />
            <line x2="32" y1="-160" y2="-160" style="linewidth:W" x1="64" />
            <line x2="32" y1="-112" y2="-112" style="linewidth:W" x1="64" />
            <line x2="32" y1="-224" y2="-224" x1="64" />
            <line x2="32" y1="-192" y2="-192" x1="64" />
            <line x2="400" y1="-192" y2="-192" style="linewidth:W" x1="368" />
            <line x2="364" y1="-160" y2="-160" x1="400" />
            <line x2="364" y1="-224" y2="-224" x1="400" />
            <line x2="364" y1="-16" y2="-16" x1="400" />
            <line x2="400" y1="-48" y2="-48" style="linewidth:W" x1="368" />
            <line x2="400" y1="-128" y2="-128" style="linewidth:W" x1="368" />
            <line x2="400" y1="-96" y2="-96" style="linewidth:W" x1="368" />
        </blockdef>
        <blockdef name="SEnter_2_32">
            <timestamp>2015-12-27T10:39:45</timestamp>
            <line x2="288" y1="-240" y2="-240" x1="320" />
            <line x2="320" y1="-192" y2="-192" style="linewidth:W" x1="288" />
            <line x2="320" y1="-128" y2="-128" style="linewidth:W" x1="288" />
            <line x2="320" y1="-64" y2="-64" style="linewidth:W" x1="288" />
            <rect style="linewidth:W;linecolor:rgb(0,0,255);fillcolor:rgb(170,255,255);fillstyle:Solid" width="256" x="32" y="-272" height="272" />
            <line x2="0" y1="-208" y2="-208" style="linewidth:W" x1="32" />
            <line x2="0" y1="-176" y2="-176" x1="32" />
            <line x2="0" y1="-240" y2="-240" x1="32" />
            <line x2="0" y1="-64" y2="-64" style="linewidth:W" x1="32" />
            <line x2="0" y1="-112" y2="-112" style="linewidth:W" x1="32" />
        </blockdef>
        <blockdef name="ROM_D">
            <timestamp>2016-1-1T5:13:26</timestamp>
            <rect style="fillcolor:rgb(255,170,255);fillstyle:Solid" width="512" x="32" y="4" height="324" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="544" y1="80" y2="80" style="linewidth:W" x1="576" />
        </blockdef>
        <blockdef name="RAM_B">
            <timestamp>2016-1-1T5:47:56</timestamp>
            <rect style="fillcolor:rgb(255,170,255);fillstyle:Solid" width="512" x="32" y="32" height="316" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="32" y1="144" y2="144" style="linewidth:W" x1="0" />
            <line x2="32" y1="224" y2="224" style="linewidth:W" x1="0" />
            <line x2="544" y1="144" y2="144" style="linewidth:W" x1="576" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="vcc" name="XLXI_1">
            <blockpin signalname="V5" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_2">
            <blockpin signalname="N0" name="G" />
        </block>
        <block symbolname="Multi_8CH32" name="U5">
            <blockpin signalname="SW_OK(7:5)" name="Test(2:0)" />
            <blockpin signalname="Div(31:0),Div(31:0)" name="point_in(63:0)" />
            <blockpin signalname="V5" name="EN" />
            <blockpin signalname="clk_100mhz" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,blink(3:0),N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,blink(7:0),blink(7:0)" name="LES(63:0)" />
            <blockpin signalname="Ai(31:0)" name="Data0(31:0)" />
            <blockpin signalname="Bi(31:0)" name="data1(31:0)" />
            <blockpin signalname="Div(31:0)" name="data2(31:0)" />
            <blockpin signalname="CNT(31:0)" name="data3(31:0)" />
            <blockpin signalname="XLXN_240(31:0)" name="data4(31:0)" />
            <blockpin signalname="XLXN_280(31:0)" name="data5(31:0)" />
            <blockpin signalname="XLXN_449(31:0)" name="data6(31:0)" />
            <blockpin signalname="XLXN_469(31:0)" name="data7(31:0)" />
            <blockpin signalname="point_out(7:0)" name="point_out(7:0)" />
            <blockpin signalname="LE_out(7:0)" name="LE_out(7:0)" />
            <blockpin signalname="Disp_num(31:0)" name="Disp_num(31:0)" />
        </block>
        <block symbolname="clk_div" name="U8">
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="clk_100mhz" name="clk" />
            <blockpin signalname="SW_OK(2)" name="SW2" />
            <blockpin signalname="Div(31:0)" name="clkdiv(31:0)" />
            <blockpin signalname="Clk_CPU" name="Clk_CPU" />
        </block>
        <block symbolname="SAnti_jitter" name="U9">
            <blockpin signalname="SW(15:0)" name="SW(15:0)" />
            <blockpin signalname="readn" name="readn" />
            <blockpin signalname="BTN_y(3:0)" name="Key_y(3:0)" />
            <blockpin signalname="BTN_x(4:0)" name="Key_x(4:0)" />
            <blockpin signalname="RSTN" name="RSTN" />
            <blockpin signalname="clk_100mhz" name="clk" />
            <blockpin signalname="XLXN_444(4:0)" name="Key_out(4:0)" />
            <blockpin signalname="RDY" name="Key_ready" />
            <blockpin signalname="CR" name="CR" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="SW_OK(15:0)" name="SW_OK(15:0)" />
            <blockpin signalname="Pulse(3:0)" name="pulse_out(3:0)" />
            <blockpin signalname="BTN_OK(3:0)" name="BTN_OK(3:0)" />
        </block>
        <block symbolname="SEnter_2_32" name="M4">
            <blockpin signalname="readn" name="readn" />
            <blockpin signalname="Ai(31:0)" name="Ai(31:0)" />
            <blockpin signalname="Bi(31:0)" name="Bi(31:0)" />
            <blockpin signalname="blink(7:0)" name="blink(7:0)" />
            <blockpin signalname="XLXN_444(4:0)" name="Din(4:0)" />
            <blockpin signalname="RDY" name="D_ready" />
            <blockpin signalname="clk_100mhz" name="clk" />
            <blockpin signalname="SW_OK(7:5),SW_OK(15),SW_OK(0)" name="Ctrl(4:0)" />
            <blockpin signalname="BTN_OK(2:0)" name="BTN(2:0)" />
        </block>
        <block symbolname="SSeg7_Dev" name="U6">
            <blockpin signalname="LE_out(7:0)" name="LES(7:0)" />
            <blockpin signalname="SEG_PEN" name="SEG_PEN" />
            <blockpin signalname="seg_sout" name="seg_sout" />
            <blockpin signalname="seg_clrn" name="seg_clrn" />
            <blockpin signalname="point_out(7:0)" name="point(7:0)" />
            <blockpin signalname="Disp_num(31:0)" name="Hexs(31:0)" />
            <blockpin signalname="SW_OK(0)" name="SW0" />
            <blockpin signalname="Div(25)" name="flash" />
            <blockpin signalname="seg_clk" name="seg_clk" />
            <blockpin signalname="clk_100mhz" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="Div(20)" name="Start" />
        </block>
        <block symbolname="ROM_D" name="U2">
            <blockpin signalname="N0,N0,N0,N0,N0,SW(3),Div(27:24)" name="a(9:0)" />
            <blockpin signalname="XLXN_449(31:0)" name="spo(31:0)" />
        </block>
        <block symbolname="RAM_B" name="U3">
            <blockpin signalname="N0,N0,N0,N0,N0,SW(3),Div(27:24)" name="addra(9:0)" />
            <blockpin signalname="XLXN_455" name="clka" />
            <blockpin signalname="SW_OK(4)" name="wea(0:0)" />
            <blockpin signalname="XLXN_449(31:0)" name="dina(31:0)" />
            <blockpin signalname="XLXN_469(31:0)" name="douta(31:0)" />
        </block>
        <block symbolname="inv" name="XLXI_53">
            <blockpin signalname="clk_100mhz" name="I" />
            <blockpin signalname="XLXN_455" name="O" />
        </block>
        <block symbolname="SPIO" name="U7">
            <blockpin signalname="clk_100mhz" name="clk" />
            <blockpin signalname="SW(13:0),SW_OK(15:0),N0,N0" name="P_Data(31:0)" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="V5" name="EN" />
            <blockpin signalname="Div(20)" name="Start" />
            <blockpin signalname="led_clk" name="led_clk" />
            <blockpin name="GPIOf0(13:0)" />
            <blockpin name="LED_out(15:0)" />
            <blockpin name="counter_set(1:0)" />
            <blockpin signalname="led_clrn" name="led_clrn" />
            <blockpin signalname="LED_PEN" name="LED_PEN" />
            <blockpin signalname="led_sout" name="led_sout" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="Disp_num(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2784" y="592" type="branch" />
            <wire x2="2240" y1="304" y2="592" x1="2240" />
            <wire x2="2784" y1="592" y2="592" x1="2240" />
            <wire x2="3200" y1="592" y2="592" x1="2784" />
            <wire x2="3200" y1="592" y2="736" x1="3200" />
            <wire x2="2336" y1="304" y2="304" x1="2240" />
            <wire x2="3200" y1="736" y2="736" x1="3168" />
        </branch>
        <branch name="LE_out(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2768" y="496" type="branch" />
            <wire x2="2304" y1="368" y2="496" x1="2304" />
            <wire x2="2768" y1="496" y2="496" x1="2304" />
            <wire x2="3264" y1="496" y2="496" x1="2768" />
            <wire x2="3264" y1="496" y2="832" x1="3264" />
            <wire x2="2336" y1="368" y2="368" x1="2304" />
            <wire x2="3264" y1="832" y2="832" x1="3168" />
        </branch>
        <branch name="point_out(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2784" y="544" type="branch" />
            <wire x2="2272" y1="336" y2="544" x1="2272" />
            <wire x2="2784" y1="544" y2="544" x1="2272" />
            <wire x2="3232" y1="544" y2="544" x1="2784" />
            <wire x2="3232" y1="544" y2="784" x1="3232" />
            <wire x2="2336" y1="336" y2="336" x1="2272" />
            <wire x2="3232" y1="784" y2="784" x1="3168" />
        </branch>
        <branch name="V5">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2720" y="784" type="branch" />
            <wire x2="2784" y1="784" y2="784" x1="2720" />
        </branch>
        <branch name="SW_OK(7:5)">
            <wire x2="2784" y1="832" y2="832" x1="2288" />
        </branch>
        <instance x="3408" y="624" name="XLXI_1" orien="R0" />
        <branch name="V5">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:58;fontname:Arial;textcolor:rgb(255,0,0)" attrname="Name" x="3440" y="640" type="branch" />
            <wire x2="3472" y1="640" y2="640" x1="3440" />
            <wire x2="3472" y1="624" y2="640" x1="3472" />
        </branch>
        <instance x="3408" y="896" name="XLXI_2" orien="R0" />
        <bustap x2="2288" y1="832" y2="832" x1="2192" />
        <instance x="2784" y="1360" name="U5" orien="R0">
            <attrtext style="fontsize:58;fontname:Arial;textcolor:rgb(255,0,0)" attrname="InstName" x="240" y="-352" type="instance" />
        </instance>
        <branch name="N0">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:38;fontname:Arial;textcolor:rgb(255,0,0)" attrname="Name" x="3424" y="752" type="branch" />
            <wire x2="3472" y1="752" y2="752" x1="3424" />
            <wire x2="3472" y1="752" y2="768" x1="3472" />
        </branch>
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="304" cy="134" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="304" cy="132" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="364" cy="134" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="364" cy="132" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="428" cy="134" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="428" cy="132" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="492" cy="134" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="492" cy="132" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="304" cy="186" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="304" cy="184" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="304" cy="234" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="304" cy="232" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="364" cy="186" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="364" cy="184" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="428" cy="186" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="428" cy="184" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="364" cy="234" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="428" cy="234" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="428" cy="232" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="364" cy="232" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="492" cy="186" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="492" cy="184" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="492" cy="234" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="492" cy="232" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="304" cy="334" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="304" cy="332" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="364" cy="334" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="428" cy="334" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="428" cy="332" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="364" cy="332" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="304" cy="282" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="304" cy="280" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="364" cy="282" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="364" cy="280" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="428" cy="282" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="428" cy="280" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="492" cy="282" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="492" cy="280" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="564" cy="182" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="564" cy="180" />
        <branch name="readn">
            <wire x2="816" y1="304" y2="304" x1="800" />
            <wire x2="800" y1="304" y2="400" x1="800" />
            <wire x2="2016" y1="400" y2="400" x1="800" />
            <wire x2="2016" y1="112" y2="112" x1="1904" />
            <wire x2="2048" y1="112" y2="112" x1="2016" />
            <wire x2="2016" y1="112" y2="400" x1="2016" />
        </branch>
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="20" cx="492" cy="334" />
        <circle style="linecolor:rgb(0,255,0);fillcolor:rgb(0,0,0);fillstyle:Solid" r="12" cx="492" cy="332" />
        <rect style="linecolor:rgb(255,0,0);fillcolor:rgb(0,0,255);fillstyle:Solid" width="44" x="296" y="388" height="84" />
        <rect style="linecolor:rgb(255,0,0);fillcolor:rgb(0,0,0);fillstyle:Solid" width="36" x="300" y="436" height="28" />
        <text style="fontsize:20;fontname:Arial" x="296" y="496">SW14</text>
        <text style="fontsize:58;fontname:Arial" x="372" y="424">...</text>
        <text style="fontsize:20;fontname:Arial" x="432" y="496">SW1</text>
        <text style="fontsize:20;fontname:Arial" x="504" y="492">SW0</text>
        <rect style="linecolor:rgb(255,0,0);fillcolor:rgb(0,0,255);fillstyle:Solid" width="44" x="444" y="388" height="84" />
        <rect style="linecolor:rgb(255,0,0);fillcolor:rgb(0,0,0);fillstyle:Solid" width="36" x="448" y="396" height="28" />
        <rect style="linecolor:rgb(255,0,0);fillcolor:rgb(0,0,255);fillstyle:Solid" width="44" x="512" y="384" height="84" />
        <rect style="linecolor:rgb(255,0,0);fillcolor:rgb(0,0,0);fillstyle:Solid" width="36" x="516" y="432" height="28" />
        <branch name="blink(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1952" y="288" type="branch" />
            <wire x2="1952" y1="288" y2="288" x1="1904" />
            <wire x2="1968" y1="288" y2="288" x1="1952" />
        </branch>
        <branch name="SW(15:0)">
            <wire x2="576" y1="512" y2="512" x1="192" />
            <wire x2="816" y1="272" y2="272" x1="576" />
            <wire x2="576" y1="272" y2="512" x1="576" />
        </branch>
        <branch name="BTN_x(4:0)">
            <wire x2="528" y1="368" y2="368" x1="192" />
            <wire x2="816" y1="224" y2="224" x1="528" />
            <wire x2="528" y1="224" y2="368" x1="528" />
        </branch>
        <branch name="BTN_y(3:0)">
            <wire x2="592" y1="160" y2="160" x1="208" />
            <wire x2="592" y1="160" y2="176" x1="592" />
            <wire x2="816" y1="176" y2="176" x1="592" />
        </branch>
        <branch name="RSTN">
            <wire x2="816" y1="112" y2="112" x1="144" />
        </branch>
        <iomarker fontsize="28" x="208" y="160" name="BTN_y(3:0)" orien="R180" />
        <iomarker fontsize="28" x="192" y="368" name="BTN_x(4:0)" orien="R180" />
        <iomarker fontsize="28" x="192" y="512" name="SW(15:0)" orien="R180" />
        <iomarker fontsize="28" x="1968" y="64" name="RDY" orien="R0" />
        <iomarker fontsize="28" x="144" y="112" name="RSTN" orien="R180" />
        <iomarker fontsize="28" x="2048" y="112" name="readn" orien="R0" />
        <branch name="SW_OK(7:5),SW_OK(15),SW_OK(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1488" y="288" type="branch" />
            <wire x2="1488" y1="288" y2="288" x1="1424" />
            <wire x2="1584" y1="288" y2="288" x1="1488" />
        </branch>
        <branch name="BTN_OK(3:0)">
            <wire x2="1328" y1="240" y2="240" x1="1184" />
        </branch>
        <branch name="BTN_OK(2:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:20;fontname:Arial" attrname="Name" x="1536" y="240" type="branch" />
            <wire x2="1536" y1="240" y2="240" x1="1424" />
            <wire x2="1584" y1="240" y2="240" x1="1536" />
        </branch>
        <branch name="RDY">
            <wire x2="1552" y1="176" y2="176" x1="1184" />
            <wire x2="1584" y1="176" y2="176" x1="1552" />
            <wire x2="1968" y1="64" y2="64" x1="1552" />
            <wire x2="1552" y1="64" y2="176" x1="1552" />
        </branch>
        <branch name="XLXN_444(4:0)">
            <wire x2="1584" y1="144" y2="144" x1="1184" />
        </branch>
        <branch name="CR">
            <wire x2="1280" y1="112" y2="112" x1="1184" />
        </branch>
        <iomarker fontsize="28" x="1280" y="112" name="CR" orien="R0" />
        <bustap x2="1424" y1="288" y2="288" x1="1328" />
        <rect style="linecolor:rgb(255,0,0);fillcolor:rgb(0,0,255);fillstyle:Solid" width="44" x="228" y="388" height="84" />
        <rect style="linecolor:rgb(255,0,0);fillcolor:rgb(0,0,0);fillstyle:Solid" width="36" x="232" y="396" height="28" />
        <text style="fontsize:20;fontname:Arial" x="220" y="496">SW15</text>
        <iomarker fontsize="28" x="208" y="688" name="clk_100mhz" orien="R180" />
        <branch name="XLXN_280(31:0)">
            <wire x2="2784" y1="1232" y2="1232" x1="2352" />
        </branch>
        <branch name="CNT(31:0)">
            <wire x2="2784" y1="1136" y2="1136" x1="2352" />
        </branch>
        <branch name="XLXN_240(31:0)">
            <wire x2="2784" y1="1184" y2="1184" x1="2352" />
        </branch>
        <branch name="Bi(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial;textcolor:rgb(255,0,0)" attrname="Name" x="2640" y="1040" type="branch" />
            <wire x2="2080" y1="224" y2="224" x1="1904" />
            <wire x2="2080" y1="224" y2="1040" x1="2080" />
            <wire x2="2640" y1="1040" y2="1040" x1="2080" />
            <wire x2="2784" y1="1040" y2="1040" x1="2640" />
        </branch>
        <branch name="Div(31:0),Div(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial;textcolor:rgb(255,0,0)" attrname="Name" x="2624" y="896" type="branch" />
            <wire x2="2624" y1="896" y2="896" x1="2384" />
            <wire x2="2784" y1="896" y2="896" x1="2624" />
        </branch>
        <branch name="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,blink(3:0),N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,blink(7:0),blink(7:0)">
            <wire x2="2784" y1="944" y2="944" x1="2288" />
        </branch>
        <branch name="Ai(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial;textcolor:rgb(255,0,0)" attrname="Name" x="2640" y="992" type="branch" />
            <wire x2="2128" y1="160" y2="160" x1="1904" />
            <wire x2="2128" y1="160" y2="992" x1="2128" />
            <wire x2="2640" y1="992" y2="992" x1="2128" />
            <wire x2="2784" y1="992" y2="992" x1="2640" />
        </branch>
        <branch name="rst">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1200" y="320" type="branch" />
            <wire x2="1200" y1="368" y2="368" x1="848" />
            <wire x2="848" y1="368" y2="512" x1="848" />
            <wire x2="864" y1="512" y2="512" x1="848" />
            <wire x2="848" y1="512" y2="736" x1="848" />
            <wire x2="2784" y1="736" y2="736" x1="848" />
            <wire x2="1200" y1="320" y2="320" x1="1184" />
            <wire x2="1200" y1="320" y2="368" x1="1200" />
        </branch>
        <branch name="clk_100mhz">
            <wire x2="288" y1="768" y2="768" x1="32" />
            <wire x2="32" y1="768" y2="1824" x1="32" />
            <wire x2="112" y1="1824" y2="1824" x1="32" />
            <wire x2="288" y1="688" y2="688" x1="208" />
            <wire x2="768" y1="688" y2="688" x1="288" />
            <wire x2="2784" y1="688" y2="688" x1="768" />
            <wire x2="288" y1="688" y2="768" x1="288" />
            <wire x2="768" y1="64" y2="144" x1="768" />
            <wire x2="816" y1="144" y2="144" x1="768" />
            <wire x2="768" y1="144" y2="480" x1="768" />
            <wire x2="768" y1="480" y2="688" x1="768" />
            <wire x2="864" y1="480" y2="480" x1="768" />
            <wire x2="1504" y1="64" y2="64" x1="768" />
            <wire x2="1504" y1="64" y2="112" x1="1504" />
            <wire x2="1584" y1="112" y2="112" x1="1504" />
            <wire x2="1504" y1="32" y2="64" x1="1504" />
            <wire x2="2288" y1="32" y2="32" x1="1504" />
            <wire x2="2288" y1="32" y2="80" x1="2288" />
            <wire x2="2336" y1="80" y2="80" x1="2288" />
        </branch>
        <branch name="SW_OK(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:20;fontname:Arial" attrname="Name" x="1216" y="288" type="branch" />
            <wire x2="1216" y1="288" y2="288" x1="1184" />
            <wire x2="1312" y1="288" y2="288" x1="1216" />
            <wire x2="1328" y1="288" y2="288" x1="1312" />
            <wire x2="1312" y1="288" y2="832" x1="1312" />
            <wire x2="2192" y1="832" y2="832" x1="1312" />
        </branch>
        <branch name="SW_OK(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:20;fontname:Arial" attrname="Name" x="832" y="560" type="branch" />
            <wire x2="832" y1="560" y2="560" x1="800" />
            <wire x2="864" y1="560" y2="560" x1="832" />
        </branch>
        <instance x="864" y="592" name="U8" orien="R0">
            <attrtext style="fontsize:58;fontname:Arial;textcolor:rgb(255,0,0)" attrname="InstName" x="80" y="-80" type="instance" />
        </instance>
        <branch name="Div(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:26;fontname:Arial;textcolor:rgb(255,0,0)" attrname="Name" x="1200" y="480" type="branch" />
            <wire x2="1200" y1="480" y2="480" x1="1184" />
        </branch>
        <branch name="Clk_CPU">
            <attrtext style="alignment:SOFT-LEFT;fontsize:24;fontname:Arial;textcolor:rgb(255,0,0)" attrname="Name" x="1200" y="560" type="branch" />
            <wire x2="1200" y1="560" y2="560" x1="1184" />
        </branch>
        <instance x="784" y="336" name="U9" orien="R0">
            <attrtext style="fontsize:58;fontname:Arial;textcolor:rgb(255,0,0)" attrname="InstName" x="160" y="-200" type="instance" />
        </instance>
        <instance x="1584" y="352" name="M4" orien="R0">
            <attrtext style="fontsize:58;fontname:Arial;textcolor:rgb(255,0,0)" attrname="InstName" x="128" y="-224" type="instance" />
        </instance>
        <bustap x2="1424" y1="240" y2="240" x1="1328" />
        <branch name="Div(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial;textcolor:rgb(255,0,0)" attrname="Name" x="2640" y="1088" type="branch" />
            <wire x2="2640" y1="1088" y2="1088" x1="2352" />
            <wire x2="2784" y1="1088" y2="1088" x1="2640" />
        </branch>
        <branch name="Pulse(3:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1296" y="208" type="branch" />
            <wire x2="1296" y1="208" y2="208" x1="1184" />
        </branch>
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="32" x="3420" y="128" height="88" />
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="32" x="3324" y="128" height="88" />
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="32" x="3420" y="216" height="96" />
        <text style="fontsize:40;fontname:Arial" x="3428" y="172">b</text>
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="64" x="3356" y="284" height="28" />
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="32" x="3324" y="216" height="96" />
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="64" x="3356" y="128" height="28" />
        <text style="fontsize:40;fontname:Arial;textcolor:rgb(0,0,0)" x="3328" y="260">e</text>
        <text style="fontsize:40;fontname:Arial;textcolor:rgb(0,0,0)" x="3380" y="300">d</text>
        <text style="fontsize:40;fontname:Arial" x="3332" y="180">f</text>
        <text style="fontsize:40;fontname:Arial" x="3428" y="260">c</text>
        <text style="fontsize:40;fontname:Arial" x="3384" y="140">a</text>
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="16" cx="3476" cy="296" />
        <text style="fontsize:28;fontname:Arial" x="3460" y="296">dp</text>
        <rect style="linewidth:W;linecolor:rgb(0,0,255);linestyle:Dot" width="724" x="2772" y="112" height="236" />
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="64" x="3356" y="200" height="32" />
        <text style="fontsize:40;fontname:Arial" x="3380" y="212">g</text>
        <text style="fontsize:28;fontname:Arial" x="3360" y="328">AN0</text>
        <text style="alignment:CENTER;fontsize:40;fontname:Times New Roman;textcolor:rgb(255,0,0)" x="3128" y="84">Seven-Digit: Seven-Segment LED Display</text>
        <branch name="seg_clk">
            <wire x2="2784" y1="128" y2="128" x1="2720" />
        </branch>
        <branch name="seg_sout">
            <wire x2="2784" y1="192" y2="192" x1="2720" />
        </branch>
        <branch name="SEG_PEN">
            <wire x2="2784" y1="256" y2="256" x1="2720" />
        </branch>
        <branch name="seg_clrn">
            <wire x2="2784" y1="320" y2="320" x1="2720" />
        </branch>
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="16" cx="3180" cy="232" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="16" cx="3236" cy="232" />
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="16" cx="3288" cy="232" />
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="32" x="3084" y="128" height="88" />
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="32" x="2988" y="128" height="88" />
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="32" x="3084" y="216" height="96" />
        <text style="fontsize:40;fontname:Arial" x="3092" y="172">b</text>
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="64" x="3020" y="284" height="28" />
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="32" x="2988" y="216" height="96" />
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="64" x="3020" y="128" height="28" />
        <text style="fontsize:40;fontname:Arial;textcolor:rgb(0,0,0)" x="2992" y="260">e</text>
        <text style="fontsize:40;fontname:Arial" x="2996" y="180">f</text>
        <text style="fontsize:40;fontname:Arial" x="3092" y="260">c</text>
        <text style="fontsize:40;fontname:Arial" x="3036" y="140">a</text>
        <text style="fontsize:40;fontname:Arial;textcolor:rgb(0,0,0)" x="3040" y="300">d</text>
        <rect style="fillcolor:rgb(255,0,0);fillstyle:Solid" width="64" x="3020" y="200" height="32" />
        <text style="fontsize:40;fontname:Arial" x="3044" y="212">g</text>
        <circle style="fillcolor:rgb(255,0,0);fillstyle:Solid" r="16" cx="3136" cy="296" />
        <text style="fontsize:28;fontname:Arial" x="3120" y="296">dp</text>
        <line x2="2980" y1="348" y2="112" x1="2980" />
        <text style="fontsize:28;fontname:Arial" x="3024" y="332">AN7</text>
        <instance x="2336" y="416" name="U6" orien="R0">
            <attrtext style="fontsize:58;fontname:Arial;textcolor:rgb(255,0,0)" attrname="InstName" x="144" y="-284" type="instance" />
        </instance>
        <iomarker fontsize="28" x="2784" y="128" name="seg_clk" orien="R0" />
        <iomarker fontsize="28" x="2784" y="192" name="seg_sout" orien="R0" />
        <iomarker fontsize="28" x="2784" y="320" name="seg_clrn" orien="R0" />
        <iomarker fontsize="28" x="2784" y="256" name="SEG_PEN" orien="R0" />
        <branch name="Div(25)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="2272" y="256" type="branch" />
            <wire x2="2336" y1="256" y2="256" x1="2272" />
        </branch>
        <branch name="SW_OK(0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="2288" y="192" type="branch" />
            <wire x2="2336" y1="192" y2="192" x1="2288" />
        </branch>
        <branch name="Div(20)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2304" y="144" type="branch" />
            <wire x2="2336" y1="144" y2="144" x1="2304" />
        </branch>
        <branch name="rst">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2288" y="112" type="branch" />
            <wire x2="2336" y1="112" y2="112" x1="2288" />
        </branch>
        <text style="fontsize:28;fontname:Arial;textcolor:rgb(255,0,0)" x="2556" y="1256">ROM_D BUS</text>
        <branch name="XLXN_449(31:0)">
            <wire x2="288" y1="1552" y2="1776" x1="288" />
            <wire x2="384" y1="1776" y2="1776" x1="288" />
            <wire x2="992" y1="1552" y2="1552" x1="288" />
            <wire x2="992" y1="1280" y2="1280" x1="944" />
            <wire x2="992" y1="1280" y2="1552" x1="992" />
            <wire x2="2784" y1="1280" y2="1280" x1="992" />
        </branch>
        <branch name="N0,N0,N0,N0,N0,SW(3),Div(27:24)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:38;fontname:Arial" attrname="Name" x="336" y="1152" type="branch" />
            <wire x2="336" y1="1152" y2="1152" x1="176" />
            <wire x2="336" y1="1152" y2="1280" x1="336" />
            <wire x2="368" y1="1280" y2="1280" x1="336" />
            <wire x2="336" y1="1280" y2="1632" x1="336" />
            <wire x2="384" y1="1632" y2="1632" x1="336" />
        </branch>
        <branch name="SW_OK(4)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="224" y="1696" type="branch" />
            <wire x2="384" y1="1696" y2="1696" x1="224" />
        </branch>
        <instance x="368" y="1200" name="U2" orien="R0">
            <attrtext style="fontsize:58;fontname:Arial;textcolor:rgb(255,0,0)" attrname="InstName" x="240" y="88" type="instance" />
        </instance>
        <instance x="384" y="1552" name="U3" orien="R0">
            <attrtext style="fontsize:58;fontname:Arial;textcolor:rgb(255,0,0)" attrname="InstName" x="240" y="108" type="instance" />
        </instance>
        <branch name="XLXN_455">
            <wire x2="384" y1="1824" y2="1824" x1="336" />
        </branch>
        <branch name="XLXN_469(31:0)">
            <wire x2="2064" y1="1696" y2="1696" x1="960" />
            <wire x2="2784" y1="1328" y2="1328" x1="2064" />
            <wire x2="2064" y1="1328" y2="1696" x1="2064" />
        </branch>
        <instance x="112" y="1856" name="XLXI_53" orien="R0" />
        <branch name="led_clk">
            <wire x2="3248" y1="1760" y2="1760" x1="3136" />
        </branch>
        <branch name="led_sout">
            <wire x2="3248" y1="1792" y2="1792" x1="3136" />
        </branch>
        <branch name="LED_PEN">
            <wire x2="3216" y1="1824" y2="1824" x1="3136" />
        </branch>
        <branch name="led_clrn">
            <wire x2="3248" y1="1856" y2="1856" x1="3136" />
        </branch>
        <branch name="V5">
            <wire x2="2704" y1="1760" y2="1760" x1="2608" />
        </branch>
        <branch name="clk_100mhz">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2608" y="1664" type="branch" />
            <wire x2="2704" y1="1664" y2="1664" x1="2608" />
        </branch>
        <branch name="rst">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2608" y="1712" type="branch" />
            <wire x2="2704" y1="1712" y2="1712" x1="2608" />
        </branch>
        <branch name="Div(20)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2624" y="1808" type="branch" />
            <wire x2="2624" y1="1808" y2="1808" x1="2592" />
            <wire x2="2704" y1="1808" y2="1808" x1="2624" />
        </branch>
        <branch name="SW(13:0),SW_OK(15:0),N0,N0">
            <wire x2="2704" y1="1856" y2="1856" x1="2592" />
        </branch>
        <text style="fontsize:58;fontname:Arial;textcolor:rgb(255,0,0)" x="3284" y="1696">LED </text>
        <instance x="2672" y="1888" name="U7" orien="R0">
            <attrtext style="fontsize:58;fontname:Arial;textcolor:rgb(255,0,0)" attrname="InstName" x="144" y="-196" type="instance" />
        </instance>
        <iomarker fontsize="28" x="3248" y="1792" name="led_sout" orien="R0" />
        <iomarker fontsize="28" x="3248" y="1856" name="led_clrn" orien="R0" />
        <iomarker fontsize="28" x="3248" y="1760" name="led_clk" orien="R0" />
        <iomarker fontsize="28" x="3216" y="1824" name="LED_PEN" orien="R0" />
        <text style="fontsize:28;fontname:Arial;textcolor:rgb(255,0,0)" x="2556" y="1304">RAM_B BUS</text>
        <text style="fontsize:40;fontname:Arial;textcolor:rgb(255,0,0)" x="80" y="2024">LES = N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,blink(3:0),N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,blink(7:0),blink(7:0)</text>
        <text style="fontsize:28;fontname:Arial;textcolor:rgb(255,0,0)" x="2604" y="916">LES</text>
    </sheet>
</drawing>