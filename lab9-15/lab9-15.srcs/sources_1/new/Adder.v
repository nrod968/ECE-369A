`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 09:06:48 PM
// Design Name: 
// Module Name: Adder
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


<<<<<<< HEAD
module Adder();
=======
module Adder(InputA, InputB, Output);
    input [31:0] InputA, InputB;
    output reg [31:0] Output;

    always @ * begin
        Output <=  InputA + InputB;
    end

>>>>>>> 37c0a9ca3a2a2d70ba04d631c9e2715a73d03eb8
endmodule
