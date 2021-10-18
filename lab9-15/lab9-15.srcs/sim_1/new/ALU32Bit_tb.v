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
    reg [31:0] hi_read, lo_read;

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0
    wire [31:0] hi_write, lo_write;

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B),
        .hi_input(hi_read),
        .lo_input(lo_read), 
        .ALUResult(ALUResult), 
        .Zero(Zero),
        .hi_output(hi_write),
        .lo_output(lo_write)
    );

	initial begin
    
    #10;
    ALUControl <= 5'b00000;  //and (result should be 32'b1000)
    A <= 32'b1010; //10
    B <= 32'b1001; //9
    #10;
    
    ALUControl <= 5'b00001;  //or (result should be 32'b11111111)
    A <= 32'b11101001;
    B <= 32'b01010111;
    #10

    ALUControl <= 5'b00010;  //add (32 + 14 = 46)
    A <= 32; //32
    B <= 14;  //14
    #10

    ALUControl <= 5'b00011;  //shift left logical (by 4, result should be 32'b1000010000)
    A <= 4; //4
    B <= 32'b100001; 
    #10

    ALUControl <= 5'b00100;  //shift right logical (by 4, result should be 32'b10)
    A <= 4; //4
    B <= 32'b100001; 
    #10

    ALUControl <= 5'b00101;  //multiply (result should be 64)
    A <= 8;
    B <= 8;
    #10
    
    ALUControl <= 5'b00101;  //multiply (result should be 64)
    A <= 2000000000;
    B <= 2000000000;
    #10
    
    ALUControl <= 5'b00101;  //multiply (result should be -64)
    A <= 8;
    B <= -8;
    #10
    
    ALUControl <= 5'b00101;  //multiply (result should be 64)
    A <= 2000000000;
    B <= -2000000000;
    #10

    ALUControl <= 5'b00110;  //sub (32 - 14 = 18)
    A <= 32; //32
    B <= 14;  //14
    #10

    ALUControl <= 5'b00110;  //sub (32 - 32 = 0, Zero = 1)
    A <= 32; //32
    B <= 32;  //32
    #10

    ALUControl <= 5'b00111;  //set less than (32 < 14, result should be 32'b0)
    A <= 32; //32
    B <= 14;  //14
    #10

    ALUControl <= 5'b00111;  //set less than (14 < 32, result should be 32'b1)
    A <= 14;   //14
    B <= 32;  //32
    #10
    
    ALUControl <= 5'b00111;  //set less than (14 < 32, result should be 32'b0)
    A <= 14;   //14
    B <= 14;  //32
    #10
    ALUControl <= 5'b00111;  //set less than (14 < 32, result should be 32'b0)
    A <= 14;   //14
    B <= -14;  //32
    #10

    ALUControl <= 5'b01000;  //madd
    A <= 32'b1000; //8
    B <= 32'b1000; //8
    #10

    ALUControl <= 5'b01001;  //msub
    A <= 32'b1000; //8
    B <= 32'b1000; //8
    #10

    ALUControl <= 5'b01010;  //lui
    A <= 32'b0; //unused
    B <= 32'b1111111111111111;
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

