// File : Element_Extraction.v
// Author : Mohamed Ayman
// Date : 4/5/2024
// Version : 1
// Abstract : This file contains a project of Element Extraction of the multipliction which is a block that takes in a row and column
//            of 2 different matrices and produces an element of the matrix

module Element_Extraction #(
    parameter INTEGER_SIZE = 7,
    parameter FRACT_SIZE = 11,
    parameter DATA_WIDTH = INTEGER_SIZE +FRACT_SIZE
) (
    input wire clk,
    input wire rst,

    /******************ROW********************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a11_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a12_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a13_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a14_r,

    input wire signed [ DATA_WIDTH - 1 : 0 ] a11_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a12_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a13_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a14_i,

    /******************COL********************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b11_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b21_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b31_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b41_r,

    input wire signed [ DATA_WIDTH - 1 : 0 ] b11_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b21_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b31_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b41_i,


    output wire signed [ (DATA_WIDTH) - 1 : 0 ] Out_Element_r,
    output wire signed [ (DATA_WIDTH) - 1 : 0 ] Out_Element_i

);



wire [ (DATA_WIDTH) - 1 : 0 ] c11_r , c11_i,
                                c12_r , c12_i,
                                c13_r , c13_i,
                                c14_r , c14_i;

wire [ (DATA_WIDTH) - 1 : 0 ] c11_r_reg , c11_i_reg,
                                c12_r_reg , c12_i_reg,
                                c13_r_reg , c13_i_reg,
                                c14_r_reg , c14_i_reg;

wire [ (DATA_WIDTH) - 1 : 0 ] sum1_r , sum1_i,
                                sum2_r , sum2_i,
                                sum_r  , sum_i;

wire [ (DATA_WIDTH) - 1 : 0 ] sum1_r_reg , sum1_i_reg,
                                sum2_r_reg , sum2_i_reg;


Complex_Multiplier #( .INTEGER_SIZE(INTEGER_SIZE), .FRACT_SIZE(FRACT_SIZE) ) u0_comp_Mul ( .clk(clk) , .rst(rst) , .in1_r(a11_r) , .in1_i(a11_i) , .in2_r(b11_r) , .in2_i(b11_i) , .out_r(c11_r) , .out_i(c11_i) );
Complex_Multiplier #( .INTEGER_SIZE(INTEGER_SIZE), .FRACT_SIZE(FRACT_SIZE) ) u1_comp_Mul ( .clk(clk) , .rst(rst) , .in1_r(a12_r) , .in1_i(a12_i) , .in2_r(b21_r) , .in2_i(b21_i) , .out_r(c12_r) , .out_i(c12_i) );
Complex_Multiplier #( .INTEGER_SIZE(INTEGER_SIZE), .FRACT_SIZE(FRACT_SIZE) ) u2_comp_Mul ( .clk(clk) , .rst(rst) , .in1_r(a13_r) , .in1_i(a13_i) , .in2_r(b31_r) , .in2_i(b31_i) , .out_r(c13_r) , .out_i(c13_i) );
Complex_Multiplier #( .INTEGER_SIZE(INTEGER_SIZE), .FRACT_SIZE(FRACT_SIZE) ) u3_comp_Mul ( .clk(clk) , .rst(rst) , .in1_r(a14_r) , .in1_i(a14_i) , .in2_r(b41_r) , .in2_i(b41_i) , .out_r(c14_r) , .out_i(c14_i) );

assign sum1_r = c11_r + c12_r;
assign sum1_i = c11_i + c12_i;
register#( .DATA_WIDTH(DATA_WIDTH) ) reg0_r( .clk(clk) , .rst(rst) , .in(sum1_r) , .out(sum1_r_reg) );
register#( .DATA_WIDTH(DATA_WIDTH) ) reg0_i( .clk(clk) , .rst(rst) , .in(sum1_i) , .out(sum1_i_reg) );

assign sum2_r = c13_r + c14_r;
assign sum2_i = c13_i + c14_i;
register#( .DATA_WIDTH(DATA_WIDTH) ) reg1_r( .clk(clk) , .rst(rst) , .in(sum2_r) , .out(sum2_r_reg) );
register#( .DATA_WIDTH(DATA_WIDTH) ) reg1_i( .clk(clk) , .rst(rst) , .in(sum2_i) , .out(sum2_i_reg) );

assign sum_r = sum1_r_reg + sum2_r_reg;
assign sum_i = sum1_i_reg + sum2_i_reg;
register#( .DATA_WIDTH(DATA_WIDTH) ) reg_out_r( .clk(clk) , .rst(rst) , .in(sum_r) , .out(Out_Element_r) );
register#( .DATA_WIDTH(DATA_WIDTH) ) reg_out_i( .clk(clk) , .rst(rst) , .in(sum_i) , .out(Out_Element_i) );

    
endmodule