`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [4:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs
    reg [31:0] hi_in, lo_in;
    reg Clk;

    reg [31:0] hi_actual, lo_actual;
    reg [31:0] ALUResult_actual;

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0
    wire [31:0] hi_out, lo_out;

    ALU32Bit u0(
        .Clk(Clk),
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B),
        .hi_input(hi_in),
        .lo_input(lo_in), 
        .ALUResult(ALUResult), 
        .Zero(Zero),
        .hi_output(hi_out),
        .lo_output(lo_out)
    );
    
    initial begin
    Clk <= 1'b1;
	forever #5 Clk <= ~Clk;
    end

	initial begin
    
    #10
    A <= 32'b1010; //10
    B <= 32'b1001; //9
    ALUResult_actual <= 32'b1000;
    ALUControl <= 5'b00000;  //and (result should be 32'b1000)
    #10
    
    A <= 32'b11101001;
    B <= 32'b01010111;
    ALUResult_actual <= 32'b11111111;
    ALUControl <= 5'b00001;  //or (result should be 32'b11111111)
    #10

    A <= 32; //32
    B <= 14;  //14
    ALUResult_actual <= 46;
    ALUControl <= 5'b00010;  //add (32 + 14 = 46)
    #10
    
    A <= 32; //32
    B <= -32;  //-32
    ALUResult_actual <= 0;
    ALUControl <= 5'b00010;  //add (32 + -32 = 0)
    #10

    A <= 4; //4
    B <= 32'b100001;
    ALUResult_actual <= 32'b1000010000;
    ALUControl <= 5'b00011;  //shift left logical (by 4, result should be 32'b1000010000)
    #10

    A <= 4; //4
    B <= 32'b100001;
    ALUResult_actual <= 32'b10;
    ALUControl <= 5'b00100;  //shift right logical (by 4, result should be 32'b10)
    #10

    A <= 8;
    B <= 8;
    ALUResult_actual <= 64;
    hi_actual <= 32'b0;
    lo_actual <= 32'b01000000;
    ALUControl <= 5'b00101;  //multiply (result should be 64)
    #10
    
    A <= 2000000000;
    B <= 2000000000;
    ALUResult_actual <= 32'b10011101100100000000000000000000;
    hi_actual <= 32'b00110111100000101101101011001110;
    lo_actual <= 32'b10011101100100000000000000000000;
    ALUControl <= 5'b00101;  //multiply (result should be 2643460096)
    #10
    
    A <= 8;
    B <= -8;
    ALUResult_actual <= {{26{1'b1}}, 6'b000000};
    hi_actual <= {32{1'b1}};
    lo_actual <= {{26{1'b1}}, 6'b000000};
    ALUControl <= 5'b00101;  //multiply (result should be -64)
    #10
    
    A <= 2000000000;
    B <= -2000000000;
    ALUResult_actual <= 32'b01100010011100000000000000000000;
    hi_actual <= 32'b11001000011111010010010100110001;
    lo_actual <= 32'b01100010011100000000000000000000;
    ALUControl <= 5'b00101;  //multiply (result should be 1,651,507,200)
    #10

    A <= 32; //32
    B <= 14;  //14
    ALUResult_actual <= 18;
    ALUControl <= 5'b00110;  //sub (32 - 14 = 18)
    #10

    A <= 32; //32
    B <= 32;  //32
    ALUResult_actual <= 0;
    ALUControl <= 5'b00110;  //sub (32 - 32 = 0, Zero = 1)
    #10
    A <= 32; //32
    B <= -32;  //-32
    ALUResult_actual <= 0;
    ALUControl <= 5'b00110;  //sub (32 - -32 = 64, Zero = 0)
    #10

    A <= 32; //32
    B <= 14;  //14
    ALUResult_actual <= 32'b0;
    ALUControl <= 5'b00111;  //set less than (32 < 14, result should be 32'b0)
    #10

    A <= 14;   //14
    B <= 32;  //32
    ALUResult_actual <= 32'b1;
    ALUControl <= 5'b00111;  //set less than (14 < 32, result should be 32'b1)
    #10
    
    A <= 14;   //14
    B <= 14;  //32
    ALUResult_actual <= 32'b0;
    ALUControl <= 5'b00111;  //set less than (14 < 32, result should be 32'b0)
    #10

    A <= 14;   //14
    B <= -14;  //32
    ALUResult_actual <= 32'b0;
    ALUControl <= 5'b00111;  //set less than (14 < 32, result should be 32'b0)
    #10

    ALUControl <= 5'b01000;  //madd
    hi_in <= 0;
    lo_in <= 0;
    A <= 8; //8
    B <= 8; //8
    hi_actual <= 32'b0;
    lo_actual <= 32'b1000000;
    #10
    
    ALUControl <= 5'b01000;  //madd
    hi_in <= 0;
    lo_in <= 0;
    A <= 2000000000;
    B <= -2000000000;
    hi_actual <= 32'b11001000011111010010010100110001;
    lo_actual <= 32'b01100010011100000000000000000000;
    #10
    
    ALUControl <= 5'b01000;  //madd
    hi_in <= 32'b1;
    lo_in <= 32'b100;
    A <= 2000000000;
    B <= -2000000000;
    hi_actual <= 32'b11001000011111010010010100110010;
    lo_actual <= 32'b01100010011100000000000000000100;
    #10
    
    ALUControl <= 5'b01000;  //madd
    hi_in <= 32'b1;
    lo_in <= 32'b100;
    A <= 2000000000;
    B <= 2000000000;
    hi_actual <= 32'b00110111100000101101101011001111;
    lo_actual <= 32'b10011101100100000000000000000100;
    #10
    
    ALUControl <= 5'b01001;  //msub
    hi_in <= 0;
    lo_in <= 0;
    A <= 8; //8
    B <= 8; //8
    hi_actual <= 32'b11111111111111111111111111111111;
    lo_actual <= 32'b11111111111111111111111111000000;
    #10
    
    ALUControl <= 5'b01001;  //msub
    hi_in <= 0;
    lo_in <= 0;
    A <= 2000000000;
    B <= -2000000000;
    hi_actual <= 32'b00110111100000101101101011001110;
    lo_actual <= 32'b10011101100100000000000000000000;
    #10
    
    ALUControl <= 5'b01001;  //msub
    hi_in <= 32'b1;
    lo_in <= 32'b100;
    A <= 2000000000;
    B <= -2000000000;
    hi_actual <= 32'b00110111100000101101101011001111;
    lo_actual <= 32'b10011101100100000000000000000100;
    #10
    
    ALUControl <= 5'b01001;  //msub
    hi_in <= 32'b1;
    lo_in <= 32'b100;
    A <= 2000000000;
    B <= 2000000000;
    hi_actual <= 32'b11001000011111010010010100110010;
    lo_actual <= 32'b01100010011100000000000000000100;
    #10

    ALUControl <= 5'b01010;  //lui
    A <= 32'b1; //unused
    B <= 32'b1111110111111111;
    ALUResult_actual <= 32'b11111101111111110000000000000000;
    #10

    ALUControl <= 5'b01011; //mthi
    A <= 32'b1;
    B <= 32'b0; //unused
    #10

    ALUControl <= 5'b01100;  //NOR
    A <= 32'b0111000110;
    B <= 32'b0000110011;
    #10

    ALUControl <= 5'b01101;  //XOR
    A <= 32'b0111000110;
    B <= 32'b0000110011;
    #10  

    ALUControl <= 5'b01110;  //mtlo
    A <= 32'b1;
    B <= 32'b0; //unused
    #10

    ALUControl <= 5'b01111;  //mfhi
    #10

    ALUControl <= 5'b10000;  //mflo
    #10

    //skip testing 10001 and 10010 for now,
    //implement later with signed 
    //instructions???

    ALUControl <= 5'b10011;  //movn
    A <= 32'h3E8;
    B <= 32'b1;
    #10

    ALUControl <= 5'b10011;  //movn but B==0
    A <= 32'h3E7;
    B <= 32'b0;
    #10

    ALUControl <= 5'b10100;  //movz
    A <= 32'h3E6;
    B <= 32'b0;
    #10

    ALUControl <= 5'b10100;  //movz but B!=0
    A <= 32'h3E6;
    B <= 32'b1;
    #10

    ALUControl <= 5'b10101;  //rotrv and rotr
    A <= 32'b10;
    B <= 32'b10010111;
    #10

    ALUControl <= 5'b10110;  //sra
    A <= 32'b10;
    B <= 32'b110001001;

	end

endmodule

