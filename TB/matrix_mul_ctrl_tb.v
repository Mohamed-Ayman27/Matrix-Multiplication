// File : matrix_mul_ctrl_tb.v
// Author : Mohamed Ayman
// Date : 4/5/2024
// Version : 1
// Abstract : This file contains testbench for 4*4 matrix multiplication controller

`timescale 1 ns / 1 ps

module Matrix_Mul_ctrl_tb;
   parameter INT_WIDTH = 6;
   parameter FRACT_WIDTH = 12;
   parameter DATA_WIDTH = INT_WIDTH + FRACT_WIDTH;
   parameter T_CLK = 2.71267;

    reg clk_tb;
    reg rst_n_tb;
    reg mat_mul_enable;

    reg [ DATA_WIDTH - 1 : 0 ] first_mat_11_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_11_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_12_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_12_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_13_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_13_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_14_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_14_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_21_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_21_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_22_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_22_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_23_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_23_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_24_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_24_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_31_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_31_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_32_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_32_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_33_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_33_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_34_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_34_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_41_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_41_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_42_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_42_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_43_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_43_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_44_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] first_mat_44_i_tb;


    reg [ DATA_WIDTH - 1 : 0 ] second_mat_11_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_11_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_12_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_12_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_13_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_13_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_14_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_14_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_21_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_21_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_22_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_22_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_23_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_23_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_24_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_24_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_31_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_31_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_32_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_32_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_33_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_33_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_34_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_34_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_41_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_41_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_42_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_42_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_43_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_43_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_44_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ] second_mat_44_i_tb;



    wire mat_mul_valid_tb;

    wire [ ( DATA_WIDTH ) - 1 : 0 ] c11_r_tb , d11_r_tb;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c12_r_tb , d12_r_tb;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c13_r_tb , d13_r_tb;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c14_r_tb , d14_r_tb;

    wire [ ( DATA_WIDTH ) - 1 : 0 ] c11_i_tb , d11_i_tb;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c12_i_tb , d12_i_tb;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c13_i_tb , d13_i_tb;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c14_i_tb , d14_i_tb;


    initial
    begin
        initialize();
        reset();
        test();
        #100
        $stop;
    end

    task test;
        begin
            mat_mul_enable = 1;

            first_mat_11_r_tb = 'd1;
            first_mat_11_i_tb = 'd2;
            first_mat_12_r_tb = 'd1;
            first_mat_12_i_tb = 'd1;
            first_mat_13_r_tb = 'd4;
            first_mat_13_i_tb = 'd1;
            first_mat_14_r_tb = 'd6;
            first_mat_14_i_tb = 'd1;
            first_mat_21_r_tb = 'd2;
            first_mat_21_i_tb = 'd1;
            first_mat_22_r_tb = 'd1;
            first_mat_22_i_tb = 'd3;
            first_mat_23_r_tb = 'd1;
            first_mat_23_i_tb = 'd2;
            first_mat_24_r_tb = 'd6;
            first_mat_24_i_tb = 'd5;
            first_mat_31_r_tb = 'd2;
            first_mat_31_i_tb = 'd2;
            first_mat_32_r_tb = 'd5;
            first_mat_32_i_tb = 'd1;
            first_mat_33_r_tb = 'd9;
            first_mat_33_i_tb = 'd1;
            first_mat_34_r_tb = 'd7;
            first_mat_34_i_tb = 'd3;
            first_mat_41_r_tb = 'd3;
            first_mat_41_i_tb = 'd2;
            first_mat_42_r_tb = 'd1;
            first_mat_42_i_tb = 'd6;
            first_mat_43_r_tb = 'd1;
            first_mat_43_i_tb = 'd7;
            first_mat_44_r_tb = 'd5;
            first_mat_44_i_tb = 'd6;


            second_mat_11_r_tb = 'd2;
            second_mat_11_i_tb = 'd1;
            second_mat_12_r_tb = 'd3;
            second_mat_12_i_tb = 'd1;
            second_mat_13_r_tb = 'd4;
            second_mat_13_i_tb = 'd1;
            second_mat_14_r_tb = 'd6;
            second_mat_14_i_tb = 'd1;
            second_mat_21_r_tb = 'd1;
            second_mat_21_i_tb = 'd4;
            second_mat_22_r_tb = 'd5;
            second_mat_22_i_tb = 'd2;
            second_mat_23_r_tb = 'd5;
            second_mat_23_i_tb = 'd5;
            second_mat_24_r_tb = 'd6;
            second_mat_24_i_tb = 'd2;
            second_mat_31_r_tb = 'd5;
            second_mat_31_i_tb = 'd1;
            second_mat_32_r_tb = 'd3;
            second_mat_32_i_tb = 'd5;
            second_mat_33_r_tb = 'd2;
            second_mat_33_i_tb = 'd6;
            second_mat_34_r_tb = 'd5;
            second_mat_34_i_tb = 'd9;
            second_mat_41_r_tb = 'd1;
            second_mat_41_i_tb = 'd4;
            second_mat_42_r_tb = 'd2;
            second_mat_42_i_tb = 'd1;
            second_mat_43_r_tb = 'd7;
            second_mat_43_i_tb = 'd7;
            second_mat_44_r_tb = 'd9;
            second_mat_44_i_tb = 'd9;
        end
    endtask


    task initialize;
        begin
            clk_tb      = 1'b0;
            rst_n_tb    = 1'b1;

            mat_mul_enable = 0;

            first_mat_11_r_tb = 0;
            first_mat_11_i_tb = 0;
            first_mat_12_r_tb = 0;
            first_mat_12_i_tb = 0;
            first_mat_13_r_tb = 0;
            first_mat_13_i_tb = 0;
            first_mat_14_r_tb = 0;
            first_mat_14_i_tb = 0;
            first_mat_21_r_tb = 0;
            first_mat_21_i_tb = 0;
            first_mat_22_r_tb = 0;
            first_mat_22_i_tb = 0;
            first_mat_23_r_tb = 0;
            first_mat_23_i_tb = 0;
            first_mat_24_r_tb = 0;
            first_mat_24_i_tb = 0;
            first_mat_31_r_tb = 0;
            first_mat_31_i_tb = 0;
            first_mat_32_r_tb = 0;
            first_mat_32_i_tb = 0;
            first_mat_33_r_tb = 0;
            first_mat_33_i_tb = 0;
            first_mat_34_r_tb = 0;
            first_mat_34_i_tb = 0;
            first_mat_41_r_tb = 0;
            first_mat_41_i_tb = 0;
            first_mat_42_r_tb = 0;
            first_mat_42_i_tb = 0;
            first_mat_43_r_tb = 0;
            first_mat_43_i_tb = 0;
            first_mat_44_r_tb = 0;
            first_mat_44_i_tb = 0;


            second_mat_11_r_tb = 0;
            second_mat_11_i_tb = 0;
            second_mat_12_r_tb = 0;
            second_mat_12_i_tb = 0;
            second_mat_13_r_tb = 0;
            second_mat_13_i_tb = 0;
            second_mat_14_r_tb = 0;
            second_mat_14_i_tb = 0;
            second_mat_21_r_tb = 0;
            second_mat_21_i_tb = 0;
            second_mat_22_r_tb = 0;
            second_mat_22_i_tb = 0;
            second_mat_23_r_tb = 0;
            second_mat_23_i_tb = 0;
            second_mat_24_r_tb = 0;
            second_mat_24_i_tb = 0;
            second_mat_31_r_tb = 0;
            second_mat_31_i_tb = 0;
            second_mat_32_r_tb = 0;
            second_mat_32_i_tb = 0;
            second_mat_33_r_tb = 0;
            second_mat_33_i_tb = 0;
            second_mat_34_r_tb = 0;
            second_mat_34_i_tb = 0;
            second_mat_41_r_tb = 0;
            second_mat_41_i_tb = 0;
            second_mat_42_r_tb = 0;
            second_mat_42_i_tb = 0;
            second_mat_43_r_tb = 0;
            second_mat_43_i_tb = 0;
            second_mat_44_r_tb = 0;
            second_mat_44_i_tb = 0;

        end
    endtask

    task reset;
        begin
            rst_n_tb = 1'b1;
            @(posedge clk_tb);
            rst_n_tb = 1'b0;
            @(posedge clk_tb);
            rst_n_tb = 1'b1;
        end
    endtask

    always begin
        #(T_CLK/2.0) clk_tb = ~clk_tb;
    end
    
matrix_mul_ctrl #(
    .INTEGER_SIZE(INT_WIDTH),
    .FRACT_SIZE(FRACT_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
)DUT (
    .clk(clk_tb),
    .rst_n(rst_n_tb),
    .Start_Mul(mat_mul_enable),

    /*************************************MATRIX 1*****************************************/
    .a11_r_reg(first_mat_11_r_tb),
    .a12_r_reg(first_mat_12_r_tb),
    .a13_r_reg(first_mat_13_r_tb),
    .a14_r_reg(first_mat_14_r_tb),
    .a11_i_reg(first_mat_11_i_tb),
    .a12_i_reg(first_mat_12_i_tb),
    .a13_i_reg(first_mat_13_i_tb),
    .a14_i_reg(first_mat_14_i_tb),
    .a21_r_reg(first_mat_21_r_tb),
    .a22_r_reg(first_mat_22_r_tb),
    .a23_r_reg(first_mat_23_r_tb),
    .a24_r_reg(first_mat_24_r_tb),
    .a21_i_reg(first_mat_21_i_tb),
    .a22_i_reg(first_mat_22_i_tb),
    .a23_i_reg(first_mat_23_i_tb),
    .a24_i_reg(first_mat_24_i_tb),
    .a31_r_reg(first_mat_31_r_tb),
    .a32_r_reg(first_mat_32_r_tb),
    .a33_r_reg(first_mat_33_r_tb),
    .a34_r_reg(first_mat_34_r_tb),
    .a31_i_reg(first_mat_31_i_tb),
    .a32_i_reg(first_mat_32_i_tb),
    .a33_i_reg(first_mat_33_i_tb),
    .a34_i_reg(first_mat_34_i_tb),
    .a41_r_reg(first_mat_41_r_tb),
    .a42_r_reg(first_mat_42_r_tb),
    .a43_r_reg(first_mat_43_r_tb),
    .a44_r_reg(first_mat_44_r_tb),
    .a41_i_reg(first_mat_41_i_tb),
    .a42_i_reg(first_mat_42_i_tb),
    .a43_i_reg(first_mat_43_i_tb),
    .a44_i_reg(first_mat_44_i_tb),


    /*************************************MATRIX 2*****************************************/
    .b11_r_reg(second_mat_11_r_tb),
    .b12_r_reg(second_mat_12_r_tb),
    .b13_r_reg(second_mat_13_r_tb),
    .b14_r_reg(second_mat_14_r_tb),
    .b11_i_reg(second_mat_11_i_tb),
    .b12_i_reg(second_mat_12_i_tb),
    .b13_i_reg(second_mat_13_i_tb),
    .b14_i_reg(second_mat_14_i_tb),
    .b21_r_reg(second_mat_21_r_tb),
    .b22_r_reg(second_mat_22_r_tb),
    .b23_r_reg(second_mat_23_r_tb),
    .b24_r_reg(second_mat_24_r_tb),
    .b21_i_reg(second_mat_21_i_tb),
    .b22_i_reg(second_mat_22_i_tb),
    .b23_i_reg(second_mat_23_i_tb),
    .b24_i_reg(second_mat_24_i_tb),
    .b31_r_reg(second_mat_31_r_tb),
    .b32_r_reg(second_mat_32_r_tb),
    .b33_r_reg(second_mat_33_r_tb),
    .b34_r_reg(second_mat_34_r_tb),
    .b31_i_reg(second_mat_31_i_tb),
    .b32_i_reg(second_mat_32_i_tb),
    .b33_i_reg(second_mat_33_i_tb),
    .b34_i_reg(second_mat_34_i_tb),
    .b41_r_reg(second_mat_41_r_tb),
    .b42_r_reg(second_mat_42_r_tb),
    .b43_r_reg(second_mat_43_r_tb),
    .b44_r_reg(second_mat_44_r_tb),
    .b41_i_reg(second_mat_41_i_tb),
    .b42_i_reg(second_mat_42_i_tb),
    .b43_i_reg(second_mat_43_i_tb),
    .b44_i_reg(second_mat_44_i_tb),

    /*********************************Output Matrix****************************/
    .c11_r(c11_r_tb),
    .c12_r(c12_r_tb),
    .c13_r(c13_r_tb),
    .c14_r(c14_r_tb),
    .c11_i(c11_i_tb),
    .c12_i(c12_i_tb),
    .c13_i(c13_i_tb),
    .c14_i(c14_i_tb),

    .d11_r(d11_r_tb),
    .d12_r(d12_r_tb),
    .d13_r(d13_r_tb),
    .d14_r(d14_r_tb),
    .d11_i(d11_i_tb),
    .d12_i(d12_i_tb),
    .d13_i(d13_i_tb),
    .d14_i(d14_i_tb),

    .done(mat_mul_valid_tb)

);

endmodule