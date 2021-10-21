`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 03:37:42 AM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address
    
   //Create 2D array for memory with 128 32-bit elements here
        (*mark_debug = "true"*) reg [31:0] memory [0:127];
        
        
        initial begin                   //need to iniitalize this for the code!!!
                                        //currently initialized to test case assembly code
            memory[0] <= 32'b00100000000010001111111111111101;	//		addi	$t0, $0, -3
            memory[1] <= 32'b00000000000000000000000000000000;	//		nop
            memory[2] <= 32'b00000000000000000000000000000000;	//		nop
            memory[3] <= 32'b00000000000000000000000000000000;	//		nop
            memory[4] <= 32'b00000000000000000000000000000000;	//		nop
            memory[5] <= 32'b00000001000010000100100000100000;	//		add	$t1, $t0, $t0
            memory[6] <= 32'b00000000000000000000000000000000;	//		nop
            memory[7] <= 32'b00000000000000000000000000000000;	//		nop
            memory[8] <= 32'b00000000000000000000000000000000;	//		nop
            memory[9] <= 32'b00000000000000000000000000000000;	//		nop
            memory[10] <= 32'b00100001000010101111111111111100;	//		addi	$t2, $t0, -4
            memory[11] <= 32'b00000000000000000000000000000000;	//		nop
            memory[12] <= 32'b00000000000000000000000000000000;	//		nop
            memory[13] <= 32'b00000000000000000000000000000000;	//		nop
            memory[14] <= 32'b00000000000000000000000000000000;	//		nop
            memory[15] <= 32'b00100101010010101111111111111111;	//		addiu	$t2, $t2, 65535
            memory[16] <= 32'b00000000000000000000000000000000;	//		nop
            memory[17] <= 32'b00000000000000000000000000000000;	//		nop
            memory[18] <= 32'b00000000000000000000000000000000;	//		nop
            memory[19] <= 32'b00000000000000000000000000000000;	//		nop
            memory[20] <= 32'b00100000000010111111111111111111;	//		addi	$t3, $0, -1
            memory[21] <= 32'b00000000000000000000000000000000;	//		nop
            memory[22] <= 32'b00000000000000000000000000000000;	//		nop
            memory[23] <= 32'b00000000000000000000000000000000;	//		nop
            memory[24] <= 32'b00000000000000000000000000000000;	//		nop
            memory[25] <= 32'b00000001010010110101000000100001;	//		addu	$t2, $t2, $t3
            memory[26] <= 32'b00000000000000000000000000000000;	//		nop
            memory[27] <= 32'b00000000000000000000000000000000;	//		nop
            memory[28] <= 32'b00000000000000000000000000000000;	//		nop
            memory[29] <= 32'b00000000000000000000000000000000;	//		nop
            memory[30] <= 32'b00000001010010010101000000100010;	//		sub	$t2, $t2, $t1
            memory[31] <= 32'b00000000000000000000000000000000;	//		nop
            memory[32] <= 32'b00000000000000000000000000000000;	//		nop
            memory[33] <= 32'b00000000000000000000000000000000;	//		nop
            memory[34] <= 32'b00000000000000000000000000000000;	//		nop
            memory[35] <= 32'b00100000000011000000111110101101;	//		addi	$t4, $0, 4013
            memory[36] <= 32'b00000000000000000000000000000000;	//		nop
            memory[37] <= 32'b00000000000000000000000000000000;	//		nop
            memory[38] <= 32'b00000000000000000000000000000000;	//		nop
            memory[39] <= 32'b00000000000000000000000000000000;	//		nop
            memory[40] <= 32'b01110001100011000101000000000010;	//		mul	$t2, $t4, $t4
            memory[41] <= 32'b00000000000000000000000000000000;	//		nop
            memory[42] <= 32'b00000000000000000000000000000000;	//		nop
            memory[43] <= 32'b00000000000000000000000000000000;	//		nop
            memory[44] <= 32'b00000000000000000000000000000000;	//		nop
            memory[45] <= 32'b00000001010010100000000000011000;	//		mult	$t2, $t2
            memory[46] <= 32'b00000000000000000000000000000000;	//		nop
            memory[47] <= 32'b00000000000000000000000000000000;	//		nop
            memory[48] <= 32'b00000000000000000000000000000000;	//		nop
            memory[49] <= 32'b00000000000000000000000000000000;	//		nop
            memory[50] <= 32'b00000001100010100000000000011001;	//		multu	$t4, $t2
            memory[51] <= 32'b00000000000000000000000000000000;	//		nop
            memory[52] <= 32'b00000000000000000000000000000000;	//		nop
            memory[53] <= 32'b00000000000000000000000000000000;	//		nop
            memory[54] <= 32'b00000000000000000000000000000000;	//		nop
            memory[55] <= 32'b01110001100010100000000000000000;	//		madd	$t4, $t2
            memory[56] <= 32'b00000000000000000000000000000000;	//		nop
            memory[57] <= 32'b00000000000000000000000000000000;	//		nop
            memory[58] <= 32'b00000000000000000000000000000000;	//		nop
            memory[59] <= 32'b00000000000000000000000000000000;	//		nop
            memory[60] <= 32'b01110001100010100000000000000100;	//		msub	$t4, $t2
            memory[61] <= 32'b00000000000000000000000000000000;	//		nop
            memory[62] <= 32'b00000000000000000000000000000000;	//		nop
            memory[63] <= 32'b00000000000000000000000000000000;	//		nop
            memory[64] <= 32'b00000000000000000000000000000000;	//		nop
            memory[65] <= 32'b10101100000011000000000000000100;	//		sw	$t4, 4($0)
            memory[66] <= 32'b00000000000000000000000000000000;	//		nop
            memory[67] <= 32'b00000000000000000000000000000000;	//		nop
            memory[68] <= 32'b00000000000000000000000000000000;	//		nop
            memory[69] <= 32'b00000000000000000000000000000000;	//		nop
            memory[70] <= 32'b10001100000011010000000000000100;	//		lw	$t5, 4($0)
            memory[71] <= 32'b00000000000000000000000000000000;	//		nop
            memory[72] <= 32'b00000000000000000000000000000000;	//		nop
            memory[73] <= 32'b00000000000000000000000000000000;	//		nop
            memory[74] <= 32'b00000000000000000000000000000000;	//		nop
            memory[75] <= 32'b10100000000010100000000000000100;	//		sb	$t2, 4($0)
            memory[76] <= 32'b00000000000000000000000000000000;	//		nop
            memory[77] <= 32'b00000000000000000000000000000000;	//		nop
            memory[78] <= 32'b00000000000000000000000000000000;	//		nop
            memory[79] <= 32'b00000000000000000000000000000000;	//		nop
            memory[80] <= 32'b10100100000010100000000000000110;	//		sh	$t2, 6($0)
            memory[81] <= 32'b00000000000000000000000000000000;	//		nop
            memory[82] <= 32'b00000000000000000000000000000000;	//		nop
            memory[83] <= 32'b00000000000000000000000000000000;	//		nop
            memory[84] <= 32'b00000000000000000000000000000000;	//		nop
            memory[85] <= 32'b10000110000011010000000000000110;	//		lh	$t5, 6($s0)
            memory[86] <= 32'b00000000000000000000000000000000;	//		nop
            memory[87] <= 32'b00000000000000000000000000000000;	//		nop
            memory[88] <= 32'b00000000000000000000000000000000;	//		nop
            memory[89] <= 32'b00000000000000000000000000000000;	//		nop
            memory[90] <= 32'b10000010000011010000000000000101;	//		lb	$t5, 5($s0)
            memory[91] <= 32'b00000000000000000000000000000000;	//		nop
            memory[92] <= 32'b00000000000000000000000000000000;	//		nop
            memory[93] <= 32'b00000000000000000000000000000000;	//		nop
            memory[94] <= 32'b00000000000000000000000000000000;	//		nop
            memory[95] <= 32'b00111100000011011010101111001101;	//		lui	$t5, 43981
            memory[96] <= 32'b00000000000000000000000000000000;	//		nop
            memory[97] <= 32'b00000000000000000000000000000000;	//		nop
            memory[98] <= 32'b00000000000000000000000000000000;	//		nop
            memory[99] <= 32'b00000000000000000000000000000000;	//		nop
            memory[100] <= 32'b00111100000010001010101010101010;	//		lui	$t0, 43690
            memory[101] <= 32'b00000000000000000000000000000000;	//		nop
            memory[102] <= 32'b00000000000000000000000000000000;	//		nop
            memory[103] <= 32'b00000000000000000000000000000000;	//		nop
            memory[104] <= 32'b00000000000000000000000000000000;	//		nop
            memory[105] <= 32'b00100000000010001010101010101010;	//		addi	$t0, $0, 43690
            memory[106] <= 32'b00000000000000000000000000000000;	//		nop
            memory[107] <= 32'b00000000000000000000000000000000;	//		nop
            memory[108] <= 32'b00000000000000000000000000000000;	//		nop
            memory[109] <= 32'b00000000000000000000000000000000;	//		nop
            memory[110] <= 32'b00111100000010011001100110011001;	//		lui	$t1, 39321
            memory[111] <= 32'b00000000000000000000000000000000;	//		nop
            memory[112] <= 32'b00000000000000000000000000000000;	//		nop
            memory[113] <= 32'b00000000000000000000000000000000;	//		nop
            memory[114] <= 32'b00000000000000000000000000000000;	//		nop
            memory[115] <= 32'b00100000000010011001100110011001;	//		addi	$t1, $0, 39321
            memory[116] <= 32'b00000000000000000000000000000000;	//		nop
            memory[117] <= 32'b00000000000000000000000000000000;	//		nop
            memory[118] <= 32'b00000000000000000000000000000000;	//		nop
            memory[119] <= 32'b00000000000000000000000000000000;	//		nop
            memory[120] <= 32'b00000001000010010101000000100100;	//		and	$t2, $t0, $t1
            memory[121] <= 32'b00000000000000000000000000000000;	//		nop
            memory[122] <= 32'b00000000000000000000000000000000;	//		nop
            memory[123] <= 32'b00000000000000000000000000000000;	//		nop
            memory[124] <= 32'b00000000000000000000000000000000;	//		nop
            memory[125] <= 32'b00110001000010100111011101110111;	//		andi	$t2, $t0, 30583
            memory[126] <= 32'b00000000000000000000000000000000;	//		nop
            memory[127] <= 32'b00000000000000000000000000000000;	//		nop
            memory[128] <= 32'b00000000000000000000000000000000;	//		nop
            memory[129] <= 32'b00000000000000000000000000000000;	//		nop
            memory[130] <= 32'b00000001000010010101000000100101;	//		or	$t2, $t0, $t1
            memory[131] <= 32'b00000000000000000000000000000000;	//		nop
            memory[132] <= 32'b00000000000000000000000000000000;	//		nop
            memory[133] <= 32'b00000000000000000000000000000000;	//		nop
            memory[134] <= 32'b00000000000000000000000000000000;	//		nop
            memory[135] <= 32'b00000001000010010101000000100111;	//		nor	$t2, $t0, $t1
            memory[136] <= 32'b00000000000000000000000000000000;	//		nop
            memory[137] <= 32'b00000000000000000000000000000000;	//		nop
            memory[138] <= 32'b00000000000000000000000000000000;	//		nop
            memory[139] <= 32'b00000000000000000000000000000000;	//		nop
            memory[140] <= 32'b00000001000010010101000000100110;	//		xor	$t2, $t0, $t1
            memory[141] <= 32'b00000000000000000000000000000000;	//		nop
            memory[142] <= 32'b00000000000000000000000000000000;	//		nop
            memory[143] <= 32'b00000000000000000000000000000000;	//		nop
            memory[144] <= 32'b00000000000000000000000000000000;	//		nop
            memory[145] <= 32'b00110101000010100111011101110111;	//		ori	$t2, $t0, 30583
            memory[146] <= 32'b00000000000000000000000000000000;	//		nop
            memory[147] <= 32'b00000000000000000000000000000000;	//		nop
            memory[148] <= 32'b00000000000000000000000000000000;	//		nop
            memory[149] <= 32'b00000000000000000000000000000000;	//		nop
            memory[150] <= 32'b00111001000010100111011101110111;	//		xori	$t2, $t0, 30583
            memory[151] <= 32'b00000000000000000000000000000000;	//		nop
            memory[152] <= 32'b00000000000000000000000000000000;	//		nop
            memory[153] <= 32'b00000000000000000000000000000000;	//		nop
            memory[154] <= 32'b00000000000000000000000000000000;	//		nop
            memory[155] <= 32'b01111100000010100101011000100000;	//		seh	$t2, $t2
            memory[156] <= 32'b00000000000000000000000000000000;	//		nop
            memory[157] <= 32'b00000000000000000000000000000000;	//		nop
            memory[158] <= 32'b00000000000000000000000000000000;	//		nop
            memory[159] <= 32'b00000000000000000000000000000000;	//		nop
            memory[160] <= 32'b00000000000010100101000010000000;	//		sll	$t2, $t2, 2
            memory[161] <= 32'b00000000000000000000000000000000;	//		nop
            memory[162] <= 32'b00000000000000000000000000000000;	//		nop
            memory[163] <= 32'b00000000000000000000000000000000;	//		nop
            memory[164] <= 32'b00000000000000000000000000000000;	//		nop
            memory[165] <= 32'b00000000000010100101000100000010;	//		srl	$t2, $t2, 4
            memory[166] <= 32'b00000000000000000000000000000000;	//		nop
            memory[167] <= 32'b00000000000000000000000000000000;	//		nop
            memory[168] <= 32'b00000000000000000000000000000000;	//		nop
            memory[169] <= 32'b00000000000000000000000000000000;	//		nop
            memory[170] <= 32'b00100001010010101111111111110000;	//		addi	$t2, $t2, -16
            memory[171] <= 32'b00000000000000000000000000000000;	//		nop
            memory[172] <= 32'b00000000000000000000000000000000;	//		nop
            memory[173] <= 32'b00000000000000000000000000000000;	//		nop
            memory[174] <= 32'b00000000000000000000000000000000;	//		nop
            memory[175] <= 32'b00000001010010100101000000000100;	//		sllv	$t2, $t2, $t2
            memory[176] <= 32'b00000000000000000000000000000000;	//		nop
            memory[177] <= 32'b00000000000000000000000000000000;	//		nop
            memory[178] <= 32'b00000000000000000000000000000000;	//		nop
            memory[179] <= 32'b00000000000000000000000000000000;	//		nop
            memory[180] <= 32'b00100001001010011111111111110000;	//		addi	$t1, $t1, -16
            memory[181] <= 32'b00000000000000000000000000000000;	//		nop
            memory[182] <= 32'b00000000000000000000000000000000;	//		nop
            memory[183] <= 32'b00000000000000000000000000000000;	//		nop
            memory[184] <= 32'b00000000000000000000000000000000;	//		nop
            memory[185] <= 32'b00000001001010100101000000000110;	//		srlv	$t2, $t2, $t1
            memory[186] <= 32'b00000000000000000000000000000000;	//		nop
            memory[187] <= 32'b00000000000000000000000000000000;	//		nop
            memory[188] <= 32'b00000000000000000000000000000000;	//		nop
            memory[189] <= 32'b00000000000000000000000000000000;	//		nop
            memory[190] <= 32'b00000001001010100101100000101010;	//		slt	$t3, $t1, $t2
            memory[191] <= 32'b00000000000000000000000000000000;	//		nop
            memory[192] <= 32'b00000000000000000000000000000000;	//		nop
            memory[193] <= 32'b00000000000000000000000000000000;	//		nop
            memory[194] <= 32'b00000000000000000000000000000000;	//		nop
            memory[195] <= 32'b00101001001010111111111111111111;	//		slti	$t3, $t1, 65535
            memory[196] <= 32'b00000000000000000000000000000000;	//		nop
            memory[197] <= 32'b00000000000000000000000000000000;	//		nop
            memory[198] <= 32'b00000000000000000000000000000000;	//		nop
            memory[199] <= 32'b00000001001010100101100000001011;	//		movn	$t3, $t1, $t2
            memory[200] <= 32'b00000000000000000000000000000000;	//		nop
            memory[201] <= 32'b00000000000000000000000000000000;	//		nop
            memory[202] <= 32'b00000000000000000000000000000000;	//		nop
            memory[203] <= 32'b00000000000000000000000000000000;	//		nop
            memory[204] <= 32'b00000001010000000101100000001011;	//		movn	$t3, $t2, $0
            memory[205] <= 32'b00000000000000000000000000000000;	//		nop
            memory[206] <= 32'b00000000000000000000000000000000;	//		nop
            memory[207] <= 32'b00000000000000000000000000000000;	//		nop
            memory[208] <= 32'b00000000000000000000000000000000;	//		nop
            memory[209] <= 32'b00000001010010110101100001000110;	//		rotrv	$t3, $t3, $t2
            memory[210] <= 32'b00000000000000000000000000000000;	//		nop
            memory[211] <= 32'b00000000000000000000000000000000;	//		nop
            memory[212] <= 32'b00000000000000000000000000000000;	//		nop
            memory[213] <= 32'b00000000000000000000000000000000;	//		nop
            memory[214] <= 32'b00000000001010110101100011000010;	//		rotr	$t3, $t3, 3
            memory[215] <= 32'b00000000000000000000000000000000;	//		nop
            memory[216] <= 32'b00000000000000000000000000000000;	//		nop
            memory[217] <= 32'b00000000000000000000000000000000;	//		nop
            memory[218] <= 32'b00000000000000000000000000000000;	//		nop
            memory[219] <= 32'b00000000000010010101100100000011;	//		sra	$t3, $t1, 4
            memory[220] <= 32'b00000000000000000000000000000000;	//		nop
            memory[221] <= 32'b00000000000000000000000000000000;	//		nop
            memory[222] <= 32'b00000000000000000000000000000000;	//		nop
            memory[223] <= 32'b00000000000000000000000000000000;	//		nop
            memory[224] <= 32'b00000001001010010101100000000111;	//		srav	$t3, $t1, $t1
            memory[225] <= 32'b00000000000000000000000000000000;	//		nop
            memory[226] <= 32'b00000000000000000000000000000000;	//		nop
            memory[227] <= 32'b00000000000000000000000000000000;	//		nop
            memory[228] <= 32'b00000000000000000000000000000000;	//		nop
            memory[229] <= 32'b01111100000010010101110000100000;	//		seb	$t3, $t1
            memory[230] <= 32'b00000000000000000000000000000000;	//		nop
            memory[231] <= 32'b00000000000000000000000000000000;	//		nop
            memory[232] <= 32'b00000000000000000000000000000000;	//		nop
            memory[233] <= 32'b00000000000000000000000000000000;	//		nop
            memory[234] <= 32'b00101101001010111111111111111111;	//		sltiu	$t3, $t1, 65535
            memory[235] <= 32'b00000000000000000000000000000000;	//		nop
            memory[236] <= 32'b00000000000000000000000000000000;	//		nop
            memory[237] <= 32'b00000000000000000000000000000000;	//		nop
            memory[238] <= 32'b00000000000000000000000000000000;	//		nop
            memory[239] <= 32'b00000001001010100101100000101011;	//		sltu	$t3, $t1, $t2
            memory[240] <= 32'b00000000000000000000000000000000;	//		nop
            memory[241] <= 32'b00000000000000000000000000000000;	//		nop
            memory[242] <= 32'b00000000000000000000000000000000;	//		nop
            memory[243] <= 32'b00000000000000000000000000000000;	//		nop
            memory[244] <= 32'b00000000000000000101100000010000;	//		mfhi	$t3
            memory[245] <= 32'b00000000000000000000000000000000;	//		nop
            memory[246] <= 32'b00000000000000000000000000000000;	//		nop
            memory[247] <= 32'b00000000000000000000000000000000;	//		nop
            memory[248] <= 32'b00000000000000000000000000000000;	//		nop
            memory[249] <= 32'b00000000000000000110000000010010;	//		mflo	$t4
            memory[250] <= 32'b00000000000000000000000000000000;	//		nop
            memory[251] <= 32'b00000000000000000000000000000000;	//		nop
            memory[252] <= 32'b00000000000000000000000000000000;	//		nop
            memory[253] <= 32'b00000000000000000000000000000000;	//		nop
            memory[254] <= 32'b00000001100000000000000000010001;	//		mthi	$t4
            memory[255] <= 32'b00000000000000000000000000000000;	//		nop
            memory[256] <= 32'b00000000000000000000000000000000;	//		nop
            memory[257] <= 32'b00000000000000000000000000000000;	//		nop
            memory[258] <= 32'b00000000000000000000000000000000;	//		nop
            memory[259] <= 32'b00000001011000000000000000010011;	//		mtlo	$t3
            memory[260] <= 32'b00000000000000000000000000000000;	//		nop
            memory[261] <= 32'b00000000000000000000000000000000;	//		nop
            memory[262] <= 32'b00000000000000000000000000000000;	//		nop
            memory[263] <= 32'b00000000000000000000000000000000;	//		nop
            memory[264] <= 32'b00100000000010110000000000000100;	//		addi	$t3, $0, 4
            memory[265] <= 32'b00000000000000000000000000000000;	//		nop
            memory[266] <= 32'b00000000000000000000000000000000;	//		nop
            memory[267] <= 32'b00000000000000000000000000000000;	//		nop
            memory[268] <= 32'b00000000000000000000000000000000;	//		nop
            memory[269] <= 32'b00100001011010111111111111111111;	//	bgezt3:	addi	$t3, $t3, -1
            memory[270] <= 32'b00000000000000000000000000000000;	//		nop
            memory[271] <= 32'b00000000000000000000000000000000;	//		nop
            memory[272] <= 32'b00000000000000000000000000000000;	//		nop
            memory[273] <= 32'b00000000000000000000000000000000;	//		nop
            memory[274] <= 32'b00000101011000011111111111111010;	//		bgez	$t3, bgezt3
            memory[275] <= 32'b00000000000000000000000000000000;	//		nop
            memory[276] <= 32'b00000000000000000000000000000000;	//		nop
            memory[277] <= 32'b00000000000000000000000000000000;	//		nop
            memory[278] <= 32'b00000000000000000000000000000000;	//		nop
            memory[279] <= 32'b00100000000011000000000000000000;	//		addi	$t4, $0, 0
            memory[280] <= 32'b00000000000000000000000000000000;	//		nop
            memory[281] <= 32'b00000000000000000000000000000000;	//		nop
            memory[282] <= 32'b00000000000000000000000000000000;	//		nop
            memory[283] <= 32'b00000000000000000000000000000000;	//		nop
            memory[284] <= 32'b00100001011010110000000000000001;	//	beqt3:	addi	$t3, $t3, 1
            memory[285] <= 32'b00000000000000000000000000000000;	//		nop
            memory[286] <= 32'b00000000000000000000000000000000;	//		nop
            memory[287] <= 32'b00000000000000000000000000000000;	//		nop
            memory[288] <= 32'b00000000000000000000000000000000;	//		nop
            memory[289] <= 32'b00010001011011001111111111111010;	//		beq	$t3, $t4, beqt3
            memory[290] <= 32'b00000000000000000000000000000000;	//		nop
            memory[291] <= 32'b00000000000000000000000000000000;	//		nop
            memory[292] <= 32'b00000000000000000000000000000000;	//		nop
            memory[293] <= 32'b00000000000000000000000000000000;	//		nop
            memory[294] <= 32'b00100000000011001111111111111111;	//		addi	$t4, $0, -1
            memory[295] <= 32'b00000000000000000000000000000000;	//		nop
            memory[296] <= 32'b00000000000000000000000000000000;	//		nop
            memory[297] <= 32'b00000000000000000000000000000000;	//		nop
            memory[298] <= 32'b00000000000000000000000000000000;	//		nop
            memory[299] <= 32'b00100001100011000000000000000001;	//	bnet4:	addi	$t4, $t4, 1
            memory[300] <= 32'b00000000000000000000000000000000;	//		nop
            memory[301] <= 32'b00000000000000000000000000000000;	//		nop
            memory[302] <= 32'b00000000000000000000000000000000;	//		nop
            memory[303] <= 32'b00000000000000000000000000000000;	//		nop
            memory[304] <= 32'b00010101011011001111111111111010;	//		bne	$t3, $t4, bnet4
            memory[305] <= 32'b00000000000000000000000000000000;	//		nop
            memory[306] <= 32'b00000000000000000000000000000000;	//		nop
            memory[307] <= 32'b00000000000000000000000000000000;	//		nop
            memory[308] <= 32'b00000000000000000000000000000000;	//		nop
            memory[309] <= 32'b00100001100011000000000000000001;	//		addi	$t4, $t4, 1
            memory[310] <= 32'b00000000000000000000000000000000;	//		nop
            memory[311] <= 32'b00000000000000000000000000000000;	//		nop
            memory[312] <= 32'b00000000000000000000000000000000;	//		nop
            memory[313] <= 32'b00000000000000000000000000000000;	//		nop
            memory[314] <= 32'b00100001100011001111111111111111;	//	bgtzt4:	addi	$t4, $t4, -1
            memory[315] <= 32'b00000000000000000000000000000000;	//		nop
            memory[316] <= 32'b00000000000000000000000000000000;	//		nop
            memory[317] <= 32'b00000000000000000000000000000000;	//		nop
            memory[318] <= 32'b00000000000000000000000000000000;	//		nop
            memory[319] <= 32'b00011101100000001111111111111010;	//		bgtz	$t4, bgtzt4
            memory[320] <= 32'b00000000000000000000000000000000;	//		nop
            memory[321] <= 32'b00000000000000000000000000000000;	//		nop
            memory[322] <= 32'b00000000000000000000000000000000;	//		nop
            memory[323] <= 32'b00000000000000000000000000000000;	//		nop
            memory[324] <= 32'b00100000000011001111111111111111;	//		addi	$t4, $0, -1
            memory[325] <= 32'b00000000000000000000000000000000;	//		nop
            memory[326] <= 32'b00000000000000000000000000000000;	//		nop
            memory[327] <= 32'b00000000000000000000000000000000;	//		nop
            memory[328] <= 32'b00000000000000000000000000000000;	//		nop
            memory[329] <= 32'b00100001100011000000000000000001;	//	blezt4:	addi	$t4, $t4, 1
            memory[330] <= 32'b00000000000000000000000000000000;	//		nop
            memory[331] <= 32'b00000000000000000000000000000000;	//		nop
            memory[332] <= 32'b00000000000000000000000000000000;	//		nop
            memory[333] <= 32'b00000000000000000000000000000000;	//		nop
            memory[334] <= 32'b00011001100000001111111111111010;	//		blez	$t4, blezt4
            memory[335] <= 32'b00000000000000000000000000000000;	//		nop
            memory[336] <= 32'b00000000000000000000000000000000;	//		nop
            memory[337] <= 32'b00000000000000000000000000000000;	//		nop
            memory[338] <= 32'b00000000000000000000000000000000;	//		nop
            memory[339] <= 32'b00100000000011001111111111111110;	//		addi	$t4, $0, -2
            memory[340] <= 32'b00000000000000000000000000000000;	//		nop
            memory[341] <= 32'b00000000000000000000000000000000;	//		nop
            memory[342] <= 32'b00000000000000000000000000000000;	//		nop
            memory[343] <= 32'b00000000000000000000000000000000;	//		nop
            memory[344] <= 32'b00100001100011000000000000000001;	//		addi	$t4, $t4, 1
            memory[345] <= 32'b00000000000000000000000000000000;	//		nop
            memory[346] <= 32'b00000000000000000000000000000000;	//		nop
            memory[347] <= 32'b00000000000000000000000000000000;	//		nop
            memory[348] <= 32'b00000000000000000000000000000000;	//		nop
            memory[349] <= 32'b00000101100000001111111111111110;	//		bltz	$t4, -2
            memory[350] <= 32'b00000000000000000000000000000000;	//		nop
            memory[351] <= 32'b00000000000000000000000000000000;	//		nop
            memory[352] <= 32'b00000000000000000000000000000000;	//		nop
            memory[353] <= 32'b00000000000000000000000000000000;	//		nop
            memory[354] <= 32'b00001000000000000000000101101100;	//		j	addit4
            memory[355] <= 32'b00000000000000000000000000000000;	//		nop
            memory[356] <= 32'b00000000000000000000000000000000;	//		nop
            memory[357] <= 32'b00000000000000000000000000000000;	//		nop
            memory[358] <= 32'b00000000000000000000000000000000;	//		nop
            memory[359] <= 32'b00100001100011000000000000000001;	//		addi	$t4, $t4, 1
            memory[360] <= 32'b00000000000000000000000000000000;	//		nop
            memory[361] <= 32'b00000000000000000000000000000000;	//		nop
            memory[362] <= 32'b00000000000000000000000000000000;	//		nop
            memory[363] <= 32'b00000000000000000000000000000000;	//		nop
            memory[364] <= 32'b00100001100011000000000000000001;	//	addit4:	addi	$t4, $t4, 1
            memory[365] <= 32'b00000000000000000000000000000000;	//		nop
            memory[366] <= 32'b00000000000000000000000000000000;	//		nop
            memory[367] <= 32'b00000000000000000000000000000000;	//		nop
            memory[368] <= 32'b00000000000000000000000000000000;	//		nop
            memory[369] <= 32'b00100000000011000000000110000001;	//		addi	$t4, $0, 385
            memory[370] <= 32'b00000000000000000000000000000000;	//		nop
            memory[371] <= 32'b00000000000000000000000000000000;	//		nop
            memory[372] <= 32'b00000000000000000000000000000000;	//		nop
            memory[373] <= 32'b00000000000000000000000000000000;	//		nop
            memory[374] <= 32'b00000001100000000000000000001000;	//		jr	$t4
            memory[375] <= 32'b00000000000000000000000000000000;	//		nop
            memory[376] <= 32'b00000000000000000000000000000000;	//		nop
            memory[377] <= 32'b00000000000000000000000000000000;	//		nop
            memory[378] <= 32'b00000000000000000000000000000000;	//		nop
            memory[379] <= 32'b00100001100011000000000000000001;	//		addi	$t4, $t4, 1
            memory[380] <= 32'b00000000000000000000000000000000;	//		nop
            memory[381] <= 32'b00000000000000000000000000000000;	//		nop
            memory[382] <= 32'b00000000000000000000000000000000;	//		nop
            memory[383] <= 32'b00000000000000000000000000000000;	//		nop
            memory[384] <= 32'b00100001100011000000000000000001;	//		addi	$t4, $t4, 1
            memory[385] <= 32'b00000000000000000000000000000000;	//		nop
            memory[386] <= 32'b00000000000000000000000000000000;	//		nop
            memory[387] <= 32'b00000000000000000000000000000000;	//		nop
            memory[388] <= 32'b00000000000000000000000000000000;	//		nop
            memory[389] <= 32'b00100000000011010000000000000100;	//		addi	$t5, $0, 4
            memory[390] <= 32'b00000000000000000000000000000000;	//		nop
            memory[391] <= 32'b00000000000000000000000000000000;	//		nop
            memory[392] <= 32'b00000000000000000000000000000000;	//		nop
            memory[393] <= 32'b00000000000000000000000000000000;	//		nop
            memory[394] <= 32'b00010101101000000000000000010011;	//		bne	$t5, $0, jalra
            memory[395] <= 32'b00000000000000000000000000000000;	//		nop
            memory[396] <= 32'b00000000000000000000000000000000;	//		nop
            memory[397] <= 32'b00000000000000000000000000000000;	//		nop
            memory[398] <= 32'b00000000000000000000000000000000;	//		nop
            memory[399] <= 32'b00100001101011011111111111111100;	//		addi	$t5, $t5, -4
            memory[400] <= 32'b00000000000000000000000000000000;	//		nop
            memory[401] <= 32'b00000000000000000000000000000000;	//		nop
            memory[402] <= 32'b00000000000000000000000000000000;	//		nop
            memory[403] <= 32'b00000000000000000000000000000000;	//		nop
            memory[404] <= 32'b00100001101011011111111111111100;	//	addit5:	addi	$t5, $t5, -4
            memory[405] <= 32'b00000000000000000000000000000000;	//		nop
            memory[406] <= 32'b00000000000000000000000000000000;	//		nop
            memory[407] <= 32'b00000000000000000000000000000000;	//		nop
            memory[408] <= 32'b00000000000000000000000000000000;	//		nop
            memory[409] <= 32'b00000011111000000000000000001000;	//		jr	$ra
            memory[410] <= 32'b00000000000000000000000000000000;	//		nop
            memory[411] <= 32'b00000000000000000000000000000000;	//		nop
            memory[412] <= 32'b00000000000000000000000000000000;	//		nop
            memory[413] <= 32'b00000000000000000000000000000000;	//		nop
            memory[414] <= 32'b00001100000000000000000110010100;	//	jalra:	jal	addit5
            memory[415] <= 32'b00000000000000000000000000000000;	//		nop
            memory[416] <= 32'b00000000000000000000000000000000;	//		nop
            memory[417] <= 32'b00000000000000000000000000000000;	//		nop
            memory[418] <= 32'b00000000000000000000000000000000;	//		nop
            memory[419] <= 32'b00100001100011000000000000000001;	//		addi	$t4, $t4, 1
            memory[420] <= 32'b00000000000000000000000000000000;	//		nop
            memory[421] <= 32'b00000000000000000000000000000000;	//		nop
            memory[422] <= 32'b00000000000000000000000000000000;	//		nop
            memory[423] <= 32'b00000000000000000000000000000000;	//		nop

        end
        
        always @ * begin
            Instruction <= memory[Address[8:2]];    
        end
         
    endmodule