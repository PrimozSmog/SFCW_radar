`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: UM FERI
// Engineer: Primož Smogavec
// 
// Create Date: 10/24/2022 01:24:03 PM
// Design Name: SFCW_radar
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top 
#(
  parameter SPI_MODE = 0,           // CPOL = 1, CPHA = 1
  parameter CLKS_PER_HALF_BIT = 3,  // 12.5 MHz 
  parameter MAIN_CLK_DELAY = 2,     // 25 MHz // for simulation only
  parameter MAX_BYTES_PER_CS = 3,   // 2 bytes per chip select
  parameter CS_INACTIVE_CLKS = 10,  // Adds delay between bytes  // to poglej
  parameter CLKS_PER_BIT = 868)
 (
    input  CLK100MHZ,
    input  reset_but,
    
    input  adc_in0,
    input  adc_in1,
    input  adc_in2,
    input  adc_in3,
    input  adc_in4,
    input  adc_in5,
    input  adc_in6,
    input  adc_in7,
    input  adc_in8,
    input  adc_in9,
    input  adc_in10,
    input  adc_in11,
    input  adc_in12,
    input  adc_in13,
    
    input  btn1,
    input  btn2,
    input  btn3,
    
    output reg SPI_CLK,
    
    output SPI_CS,
    output SPI_CS_TX,
    
    output SPI_CS_LO1,
    
    output reg SPI_CE,
    output SPI_MOSI,
    
    output reg led0_r,
    output reg led1_r,
    output reg led2_r,
    output reg led3_r,
    output reg led0,
    output reg led1,
    output reg led2,
    output reg led3,
    
    output test0,
    output test1,
    output test2,
    
    output uart_rxd_out,
    
    input  adc_of,
    output  adc_shdn,
    output  adc_oe,
    
    output reg RF_SWITCH
    ); 
    
    localparam  S0 = 3'b000;
    localparam  S1 = 3'b001;
    localparam  S2 = 3'b010;
    localparam  S3 = 3'b011;
    localparam  S4 = 3'b100;
    localparam  S5 = 3'b101;
    localparam  S6 = 3'b110;
    localparam  S7 = 3'b111;
    
    localparam UART_DV_PULSE_WIDTH = 4;
    
    logic reset_reg;
    logic [7:0] r_Master_TX_Byte = 8'hAA;
    logic r_Master_TX_DV = 1'b0;
    logic w_Master_TX_Ready ;
    logic w_Master_RX_DV;
    logic [7:0] w_Master_RX_Byte;
    logic [$clog2(MAX_BYTES_PER_CS+1)-1:0] w_Master_RX_Count, r_Master_TX_Count = 2'b11;
    
    reg sendDataFlag;
    reg CS_switch;  //switches between TX and LO1 CS pins
    reg CS_TX_on;
    reg CS_LO1_on;  
    reg CLK_40MHZ;
    reg [63:0] waitCount;
    reg [23:0] data;
    reg [23:0] data_lo1; 

    reg [23:0] VCOCalibration_Data = 24'h00201C;
    reg [2:0] state;
    reg [64:0] counter;
    reg reset_flag;
    reg [2:0] DV_counter;
    reg DV_flag;
    reg [13:0] byte_counter;  
    reg [13:0] byte_counter_lo1;
    reg [13:0] TXByteCount;
    reg [13:0] LO1ByteCount;
    reg CE_enable;
    reg signed [13:0] adc_value;
    reg [64:0] UARTCounter;
    reg [15:0] UARTDataSentCounter;
    reg adc_buffer_full_flag;
    reg [7:0] UARTByteSentCount;
    reg [7:0] UARTStopBytesSentCounter;
    reg wait_flag = 1'b1;
    reg uart_send_header = 1'b1;
    reg [7:0] UARTHeaderBytesSentCouner;
    reg [63:0] stepDurationCounter;
    
    logic [7:0] UARTSendByte = 8'hFA;
    logic UARTDataValid;

    reg [13:0] TXFreqNumber;
    reg [13:0] TXFreqRegisterNumber = 1;
    reg [3:0] TXNumberOfRegisters;
    reg [23:0] TX_LMXRegister;
    
    reg [13:0] LO1FreqNumber;
    reg [13:0] LO1FreqRegisterNumber = 1;
    reg [3:0]  LO1NumberOfRegisters;
    reg [23:0] LO1_LMXRegister; 
    
    reg [7:0] IQComponent = 0;
    reg signed [47:0] I_TX_vector [199:0];
    reg signed [47:0] Q_TX_vector [199:0];
    reg signed [47:0] I_RX_vector [199:0];
    reg signed [47:0] Q_RX_vector [199:0];
    
    assign led0_r = adc_of;
    assign adc_shdn = 0;
    assign adc_oe = 0;
    
    assign SPI_CS_TX =  (SPI_CS==0 && CS_TX_on == 1) ? 0 : 1;
    assign SPI_CS_LO1 = (SPI_CS==0 && CS_LO1_on == 1) ? 0 : 1;
    
    assign mix_en = 0;
    assign SPI_CE = CE_enable;
    assign reset_reg = ~reset_but;
    
    reg signed [13:0] LO2_sine;
    reg signed [13:0] LO2_cos;
    reg signed [31:0] I_if;
    reg signed [31:0] Q_if;
    reg signed [31:0] I_out;
    reg signed [31:0] Q_out;
    reg signed [47:0] I_TX_accum;
    reg signed [47:0] I_RX_accum;
    reg signed [47:0] Q_TX_accum;
    reg signed [47:0] Q_RX_accum;
    reg signed [47:0] test_data;
    
clk_wiz_0(
    .reset(~reset_reg),
    .clk_in1(CLK100MHZ),
    .clk_out1(CLK_40MHZ)
);
  
uart_tx(
   .i_Clock(CLK100MHZ),
   .i_Tx_DV(UARTDataValid),
   .i_Tx_Byte(UARTSendByte), 
   .o_Tx_Active(),
   .o_Tx_Serial(uart_rxd_out),
   .o_Tx_Done()
   );
   
// Instantiatetx tx memory module
memory(
    .i_clk(CLK100MHZ),
    .i_reg_nr(byte_counter),
    .o_lmx_reg(data)
);
 
// Instantiatetx lo1 memory module
memory_lo1(
    .i_clk(CLK100MHZ),
    .i_reg_nr(byte_counter_lo1),
    .o_lmx_reg(data_lo1)
);
 
TXFreqRegisters(
    .clk(CLK100MHZ),
    .freqNumber(TXFreqNumber),
    .freqRegisterNumber(TXFreqRegisterNumber),
    .numberOfRegisters(TXNumberOfRegisters),
    .LMXRegOut(TX_LMXRegister)
);
 
LO1FreqRegisters(
    .clk(CLK100MHZ),
    .freqNumber(LO1FreqNumber),
    .freqRegisterNumber(LO1FreqRegisterNumber),
    .numberOfRegisters(LO1NumberOfRegisters),
    .LMXRegOut(LO1_LMXRegister)
);
 
 // Instantiate adc module
adc(
    .clk(CLK100MHZ),
    .adc0(adc_in0),
    .adc1(adc_in1),
    .adc2(adc_in2),
    .adc3(adc_in3),
    .adc4(adc_in4),
    .adc5(adc_in5),
    .adc6(adc_in6),
    .adc7(adc_in7),
    .adc8(adc_in8),
    .adc9(adc_in9),
    .adc10(adc_in10),
    .adc11(adc_in11),
    .adc12(adc_in12),
    .adc13(adc_in13),
    .adc_val(adc_value)
    );

IQ_downconverter(
    .clk(CLK_40MHZ),
    .rst(reset_reg),
    .adc(adc_value),
    .rf_switch(RF_SWITCH), //RF_SWITCH
    .LO2_s(LO2_sine),
    .LO2_c(LO2_cos),
    .I_if(I_if),
    .Q_if(Q_if),
    .I_out(I_out),
    .Q_out(Q_out),
    .I_TX_out(I_TX_accum),
    .I_RX_out(I_RX_accum),
    .Q_TX_out(Q_TX_accum),
    .Q_RX_out(Q_RX_accum),
    .test()
    );

  // Instantiate SPI UUT
  SPI_Master_With_Single_CS
  #(.SPI_MODE(SPI_MODE),
    .CLKS_PER_HALF_BIT(CLKS_PER_HALF_BIT),
    .MAX_BYTES_PER_CS(MAX_BYTES_PER_CS),
    .CS_INACTIVE_CLKS(CS_INACTIVE_CLKS)
    ) UUT
  (
   // Control/Data Signals,
   .i_Rst_L(reset_reg),     // FPGA Reset
   .i_Clk(CLK100MHZ),         // FPGA Clock
   
   // TX (MOSI) Signals
   .i_TX_Count(r_Master_TX_Count),   // Number of bytes per CS
   .i_TX_Byte(r_Master_TX_Byte),     // Byte to transmit on MOSI
   .i_TX_DV(r_Master_TX_DV),         // Data Valid Pulse with i_TX_Byte
   .o_TX_Ready(w_Master_TX_Ready),   // Transmit Ready for Byte
   
   // RX (MISO) Signals
   .o_RX_Count(w_Master_RX_Count), // Index of RX'd byte
   .o_RX_DV(w_Master_RX_DV),       // Data Valid pulse (1 clock cycle)
   .o_RX_Byte(w_Master_RX_Byte),   // Byte received on MISO

   // SPI Interface
   .o_SPI_Clk(SPI_CLK),
   .i_SPI_MISO(SPI_MOSI),
   .o_SPI_MOSI(SPI_MOSI),
   .o_SPI_CS_n(SPI_CS)
   );

// MAIN SPI CONTROL PROGRAM
always @(posedge CLK100MHZ) begin
    if (~reset_reg) begin
        counter <= 0;
        DV_counter <= 0; 
        byte_counter <= 0; 
        byte_counter_lo1 <= 0;
        CE_enable <= 1'b0;
        state <= S0;
    end
        
    else begin   
        counter <= counter + 1;
        CE_enable <= 1'b1;
    end

    case (state)
        S0:  begin // this state sends initial register setup
            CS_TX_on <= 1'b1;
            CS_LO1_on <= 1'b0;
    
            if (DV_counter == 0) r_Master_TX_Byte <= data[23:16];
            if (DV_counter == 1) r_Master_TX_Byte <= data[15:8];
            if (DV_counter == 2) r_Master_TX_Byte <= data[7:0];
        
            if (counter == 3) begin
                r_Master_TX_DV   <= 1'b1;
            end
                
            if (counter == 5) begin
                r_Master_TX_DV   <= 1'b0;
                DV_counter = DV_counter + 1; 
                DV_flag <= 1;
            end
                
            if (DV_counter < 3'b011 && DV_counter > 3'b000 && w_Master_TX_Ready && DV_flag) begin
                DV_flag <= 0;
                counter <= 0;
            end
                
            if (DV_counter == 3'b011 && w_Master_TX_Ready && DV_flag) begin
                DV_counter = 3'b000;
                byte_counter = byte_counter + 1;
                DV_flag <= 0;
                counter <= 0;
            end
                
            if (byte_counter > 130) begin
                counter <= 0;
                state <= S1;
            end 
        end   
         
        S1: begin // This state sends initial LMX LO1 snyth register setup
            CS_TX_on <= 1'b0;
            CS_LO1_on <= 1'b1;
    
            if (DV_counter == 0) r_Master_TX_Byte <= data_lo1[23:16];
            if (DV_counter == 1) r_Master_TX_Byte <= data_lo1[15:8];
            if (DV_counter == 2) r_Master_TX_Byte <= data_lo1[7:0];
        
            if (counter == 3) begin
                r_Master_TX_DV   <= 1'b1;
            end
                
            if (counter == 5) begin
                r_Master_TX_DV   <= 1'b0;
                DV_counter = DV_counter + 1; 
                DV_flag <= 1;
            end
                
            if (DV_counter < 3'b011 && DV_counter > 3'b000 && w_Master_TX_Ready && DV_flag) begin
                DV_flag <= 0;
                counter <= 0;
            end
                
            if (DV_counter == 3'b011 && w_Master_TX_Ready && DV_flag) begin
                DV_counter = 3'b000;
                byte_counter_lo1 = byte_counter_lo1 + 1;
                DV_flag <= 0;
                counter <= 0;
            end
            
            if (byte_counter_lo1 > 130) begin
                counter <= 0;
                state <= S2;  
            end
        end
         
        S2: begin  // This state sets desired TX frequency
            CS_TX_on <= 1'b1;
            CS_LO1_on <= 1'b0;
            stepDurationCounter <= stepDurationCounter + 1;
           
            if (DV_counter == 0) r_Master_TX_Byte <= TX_LMXRegister[23:16];
            if (DV_counter == 1) r_Master_TX_Byte <= TX_LMXRegister[15:8];
            if (DV_counter == 2) r_Master_TX_Byte <= TX_LMXRegister[7:0];
        
            if (counter == 3) begin
                r_Master_TX_DV   <= 1'b1;
            end
                
            if (counter == 5) begin
                r_Master_TX_DV   <= 1'b0;
                DV_counter = DV_counter + 1; 
                DV_flag <= 1;
            end
                
            if (DV_counter < 3'b011 && DV_counter > 3'b000 && w_Master_TX_Ready && DV_flag) begin
                DV_flag <= 0;
                counter <= 0;
            end
                
            if (DV_counter == 3'b011 && w_Master_TX_Ready && DV_flag) begin
            
                if (TXNumberOfRegisters == TXFreqRegisterNumber) state = S3;
                else TXFreqRegisterNumber = TXFreqRegisterNumber + 1;
                
                DV_flag <= 0;
                counter <= 0;
                DV_counter = 3'b000;
                
            end
        end
        
        S3: begin // This state sets desired LO1 frequency
            CS_TX_on <= 1'b0;
            CS_LO1_on <= 1'b1;
            stepDurationCounter <= stepDurationCounter + 1;
           
            if (DV_counter == 0) r_Master_TX_Byte <= LO1_LMXRegister[23:16];
            if (DV_counter == 1) r_Master_TX_Byte <= LO1_LMXRegister[15:8];
            if (DV_counter == 2) r_Master_TX_Byte <= LO1_LMXRegister[7:0];
        
            if (counter == 3) begin
                r_Master_TX_DV   <= 1'b1;
            end
                
            if (counter == 5) begin
                r_Master_TX_DV   <= 1'b0;
                DV_counter = DV_counter + 1; 
                DV_flag <= 1;
            end
                
            if (DV_counter < 3'b011 && DV_counter > 3'b000 && w_Master_TX_Ready && DV_flag) begin
                DV_flag <= 0;
                counter <= 0;
            end
                
            if (DV_counter == 3'b011 && w_Master_TX_Ready && DV_flag) begin
                if (LO1NumberOfRegisters == LO1FreqRegisterNumber)begin
                    state = S4;
                end
                else begin
                    LO1FreqRegisterNumber = LO1FreqRegisterNumber + 1;
                    
                end
                DV_flag <= 0;
                counter <= 0;
                DV_counter = 3'b000;
                
            end
        end
        
        S4: begin   // This state initiates VCO calibration on both LMX TX and LMX LO1
            CS_TX_on <= 1'b1;
            CS_LO1_on <= 1'b1;
            stepDurationCounter <= stepDurationCounter + 1;
           
            if (DV_counter == 0) r_Master_TX_Byte <= VCOCalibration_Data[23:16];
            if (DV_counter == 1) r_Master_TX_Byte <= VCOCalibration_Data[15:8];
            if (DV_counter == 2) r_Master_TX_Byte <= VCOCalibration_Data[7:0];
        
            if (counter == 3) begin
                r_Master_TX_DV   <= 1'b1;
            end
                
            if (counter == 5) begin
                r_Master_TX_DV   <= 1'b0;
                DV_counter = DV_counter + 1; 
                DV_flag <= 1;
            end
                
            if (DV_counter < 3'b011 && DV_counter > 3'b000 && w_Master_TX_Ready && DV_flag) begin
                DV_flag <= 0;
                counter <= 0;
            end
                
            if (DV_counter == 3'b011 && w_Master_TX_Ready && DV_flag) begin
                state = S5;
                DV_flag <= 0;
                counter <= 0;
                DV_counter = 3'b000;
                
            end
        end
        
        S5:  begin          
            
            if (stepDurationCounter == 79999) begin
                I_TX_vector[TXFreqNumber] <= I_TX_accum;
                Q_TX_vector[TXFreqNumber] <= Q_TX_accum;
                I_RX_vector[TXFreqNumber] <= I_RX_accum;
                Q_RX_vector[TXFreqNumber] <= Q_RX_accum;
            end

            
            if (stepDurationCounter == 80000)begin //80000
                
                if (TXFreqNumber == 199) TXFreqNumber <= 0;
                else TXFreqNumber = TXFreqNumber + 1;

                if (LO1FreqNumber == 199) LO1FreqNumber <= 0;
                else LO1FreqNumber = LO1FreqNumber + 1;
               
               state <= S2;
               
                TXFreqRegisterNumber <= 1;
                LO1FreqRegisterNumber <= 1;
            
                DV_counter = 3'b000;
                DV_flag <= 0;
                stepDurationCounter <= 0;
                counter <= 0;
            end
            else stepDurationCounter = stepDurationCounter + 1; 
        end
    endcase
       
end  

//FPGA-PC UART communication
always @(posedge CLK100MHZ)begin 
    
    if (wait_flag == 1)begin // ADC sampler
        waitCount = waitCount + 1; 
        if (waitCount == 5000000) begin // 10mhz kHz //99
            waitCount <= 0;                 
            sendDataFlag<= 1;
            UARTDataSentCounter <= 0;
            wait_flag <= 0;
            uart_send_header <= 1;
            UARTHeaderBytesSentCouner <= 0;
        end
    end

    if (sendDataFlag== 1 ) begin // FPGA - PC UART comunication 
        UARTCounter <= UARTCounter + 1;
        
        if (UARTCounter < UART_DV_PULSE_WIDTH) UARTDataValid <= 1;   // Setting Data Valid Pulse Width, DV pulse starts transmistion
        else UARTDataValid <= 0;
        
        if(UARTCounter >= 500) begin    // Send byte of data with frequency of 10000 Hz        
            if (uart_send_header == 1 && UARTHeaderBytesSentCouner < 3) begin
                UARTSendByte[7:0] <= 8'hCC;
                UARTHeaderBytesSentCouner <= UARTHeaderBytesSentCouner + 1;
                UARTByteSentCount <=0;
            end
                    
            else if(UARTByteSentCount == 0 ) begin
                    UARTSendByte[7:0] <= 8'h55;
                    UARTByteSentCount <= 1;
            end    
            
           else if(UARTByteSentCount == 1 ) begin
                    UARTSendByte[7:0] <= 8'h55;
                    UARTByteSentCount <= 2;
           end
           
        else if(UARTByteSentCount == 2 ) begin
            UARTSendByte[7:0] <= 8'h11;
            UARTByteSentCount <= 3;
           end
           
            else if (UARTByteSentCount == 3) begin
                if(IQComponent == 0) UARTSendByte[7:0] <= I_TX_vector[UARTDataSentCounter][47:40];
                else if(IQComponent == 1) UARTSendByte[7:0] <= Q_TX_vector[UARTDataSentCounter][47:40];
                else if(IQComponent == 2) UARTSendByte[7:0] <= I_RX_vector[UARTDataSentCounter][47:40];
                else if(IQComponent == 3) UARTSendByte[7:0] <= Q_RX_vector[UARTDataSentCounter][47:40];
                
                UARTByteSentCount <= 4;
            end
            
            else if (UARTByteSentCount == 4) begin
                if(IQComponent == 0) UARTSendByte[7:0] <= I_TX_vector[UARTDataSentCounter][39:32];
                else if(IQComponent == 1) UARTSendByte[7:0] <= Q_TX_vector[UARTDataSentCounter][39:32]; 
                else if(IQComponent == 2) UARTSendByte[7:0] <= I_RX_vector[UARTDataSentCounter][39:32]; 
                else if(IQComponent == 3) UARTSendByte[7:0] <= Q_RX_vector[UARTDataSentCounter][39:32];  
                UARTByteSentCount <= 5;
            end
            
            else if (UARTByteSentCount == 5) begin
                if(IQComponent == 0) UARTSendByte[7:0] <= I_TX_vector[UARTDataSentCounter][31:24];
                else if(IQComponent == 1) UARTSendByte[7:0] <= Q_TX_vector[UARTDataSentCounter][31:24]; 
                else if(IQComponent == 2) UARTSendByte[7:0] <= I_RX_vector[UARTDataSentCounter][31:24]; 
                else if(IQComponent == 3) UARTSendByte[7:0] <= Q_RX_vector[UARTDataSentCounter][31:24];  
                UARTByteSentCount <= 8;
            end
            
                
            else if (UARTByteSentCount == 8) begin
                if(IQComponent == 0) UARTSendByte[7:0] <= I_TX_vector[UARTDataSentCounter][23:16];
                else if(IQComponent == 1) UARTSendByte[7:0] <= Q_TX_vector[UARTDataSentCounter][23:16]; 
                else if(IQComponent == 2) UARTSendByte[7:0] <= I_RX_vector[UARTDataSentCounter][23:16]; 
                else if(IQComponent == 3) UARTSendByte[7:0] <= Q_RX_vector[UARTDataSentCounter][23:16]; 
                
                if (IQComponent < 3) begin
                    IQComponent <= IQComponent + 1;
                    UARTByteSentCount <= 3;
                end
                
                if (IQComponent == 3 && UARTDataSentCounter < 199) begin
                    IQComponent <= 0;
                    UARTDataSentCounter <= UARTDataSentCounter + 1;
                    UARTByteSentCount <= 0;
                end
                
                if (UARTDataSentCounter == 199 && IQComponent == 3 ) UARTByteSentCount <= 9;        
            end 
            
            else if(UARTByteSentCount == 9 && UARTStopBytesSentCounter < 3) begin
                UARTSendByte[7:0] <= 8'h99;
                UARTByteSentCount <= 9;
                UARTStopBytesSentCounter <= UARTStopBytesSentCounter + 1;
            end 
            
            UARTCounter <= 0;
            
            if (UARTStopBytesSentCounter == 3) begin
                UARTByteSentCount <= 0;
                UARTStopBytesSentCounter <= 0;
                IQComponent <= 0;
                UARTDataSentCounter <= 0;
                UARTHeaderBytesSentCouner <= 0;
                uart_send_header <= 0;
                sendDataFlag<= 0;
                wait_flag <= 1;
            end
        end
    end    
end  

endmodule