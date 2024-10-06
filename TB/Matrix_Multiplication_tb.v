// File : Matrix_Multiplication.v
// Author : Mohamed Ayman
// Date : 4/5/2024
// Version : 1
// Abstract : This file contains testbench for 4*4 matrix multiplication

`timescale 1 ns / 1 ps

module Matrix_Multiplication_tb;
   parameter INT_WIDTH = 7;
   parameter FRACT_WIDTH = 11;
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


    wire mat_mul_done_tb;
    wire mat_mul_valid_tb;

    wire [ ( DATA_WIDTH ) - 1 : 0 ] Serial_Matrix_Out_r_tb , Serial_Matrix_Out_i_tb;


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

            first_mat_11_r_tb = 'h00046;
            first_mat_11_i_tb = 'h00000;
            first_mat_12_r_tb = 'h3fd90;
            first_mat_12_i_tb = 'h00003;
            first_mat_13_r_tb = 'h3fbf2;
            first_mat_13_i_tb = 'h00036;
            first_mat_14_r_tb = 'h00d0f;
            first_mat_14_i_tb = 'h3fff0;
            first_mat_21_r_tb = 'h00000;
            first_mat_21_i_tb = 'h00000;
            first_mat_22_r_tb = 'h0028e;
            first_mat_22_i_tb = 'h00000;
            first_mat_23_r_tb = 'h3ffd0;
            first_mat_23_i_tb = 'h3ffcb;
            first_mat_24_r_tb = 'h3f1c8;
            first_mat_24_i_tb = 'h3fe49;
            first_mat_31_r_tb = 'h00000;
            first_mat_31_i_tb = 'h00000;
            first_mat_32_r_tb = 'h00000;
            first_mat_32_i_tb = 'h00000;
            first_mat_33_r_tb = 'h019c0;
            first_mat_33_i_tb = 'h00000;
            first_mat_34_r_tb = 'h3aa69;
            first_mat_34_i_tb = 'h00cec;
            first_mat_41_r_tb = 'h00000;
            first_mat_41_i_tb = 'h00000;
            first_mat_42_r_tb = 'h00000;
            first_mat_42_i_tb = 'h00000;
            first_mat_43_r_tb = 'h00000;
            first_mat_43_i_tb = 'h00000;
            first_mat_44_r_tb = 'h05b40;
            first_mat_44_i_tb = 'h00000;


            second_mat_11_r_tb = 'h005e0;
            second_mat_11_i_tb = 'h00000;
            second_mat_12_r_tb = 'h0053f;
            second_mat_12_i_tb = 'h3fff9;
            second_mat_13_r_tb = 'h000fd;
            second_mat_13_i_tb = 'h00000;
            second_mat_14_r_tb = 'h000e6;
            second_mat_14_i_tb = 'h3fff9;
            second_mat_21_r_tb = 'h3fabd;
            second_mat_21_i_tb = 'h3ffee;
            second_mat_22_r_tb = 'h005e2;
            second_mat_22_i_tb = 'h00001;
            second_mat_23_r_tb = 'h3ff37;
            second_mat_23_i_tb = 'h0000e;
            second_mat_24_r_tb = 'h000d9;
            second_mat_24_i_tb = 'h00041;
            second_mat_31_r_tb = 'h3fee6;
            second_mat_31_i_tb = 'h3ffdc;
            second_mat_32_r_tb = 'h3ff3c;
            second_mat_32_i_tb = 'h00039;
            second_mat_33_r_tb = 'h00655;
            second_mat_33_i_tb = 'h3fff7;
            second_mat_34_r_tb = 'h0048f;
            second_mat_34_i_tb = 'h3ff58;
            second_mat_41_r_tb = 'h000a3;
            second_mat_41_i_tb = 'h3fff6;
            second_mat_42_r_tb = 'h3ff09;
            second_mat_42_i_tb = 'h00021;
            second_mat_43_r_tb = 'h3fb5f;
            second_mat_43_i_tb = 'h3ff72;
            second_mat_44_r_tb = 'h0065b;
            second_mat_44_i_tb = 'h3ffe3;

            #(T_CLK)
            mat_mul_enable = 1;

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
    
Matrix_Multiplication #(
    .INTEGER_SIZE(INT_WIDTH),
    .FRACT_SIZE(FRACT_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
)DUT (
    .clk(clk_tb),
    .rst_n(rst_n_tb),
    .Start_Mul(mat_mul_enable),

    /*************************************MATRIX 1*****************************************/
    .a11_r(first_mat_11_r_tb),
    .a12_r(first_mat_12_r_tb),
    .a13_r(first_mat_13_r_tb),
    .a14_r(first_mat_14_r_tb),

    .a11_i(first_mat_11_i_tb),
    .a12_i(first_mat_12_i_tb),
    .a13_i(first_mat_13_i_tb),
    .a14_i(first_mat_14_i_tb),

    .a21_r(first_mat_21_r_tb),
    .a22_r(first_mat_22_r_tb),
    .a23_r(first_mat_23_r_tb),
    .a24_r(first_mat_24_r_tb),

    .a21_i(first_mat_21_i_tb),
    .a22_i(first_mat_22_i_tb),
    .a23_i(first_mat_23_i_tb),
    .a24_i(first_mat_24_i_tb),

    .a31_r(first_mat_31_r_tb),
    .a32_r(first_mat_32_r_tb),
    .a33_r(first_mat_33_r_tb),
    .a34_r(first_mat_34_r_tb),

    .a31_i(first_mat_31_i_tb),
    .a32_i(first_mat_32_i_tb),
    .a33_i(first_mat_33_i_tb),
    .a34_i(first_mat_34_i_tb),

    .a41_r(first_mat_41_r_tb),
    .a42_r(first_mat_42_r_tb),
    .a43_r(first_mat_43_r_tb),
    .a44_r(first_mat_44_r_tb),

    .a41_i(first_mat_41_i_tb),
    .a42_i(first_mat_42_i_tb),
    .a43_i(first_mat_43_i_tb),
    .a44_i(first_mat_44_i_tb),


    /*************************************MATRIX 2*****************************************/
    .b11_r(second_mat_11_r_tb),
    .b12_r(second_mat_12_r_tb),
    .b13_r(second_mat_13_r_tb),
    .b14_r(second_mat_14_r_tb),

    .b11_i(second_mat_11_i_tb),
    .b12_i(second_mat_12_i_tb),
    .b13_i(second_mat_13_i_tb),
    .b14_i(second_mat_14_i_tb),

    .b21_r(second_mat_21_r_tb),
    .b22_r(second_mat_22_r_tb),
    .b23_r(second_mat_23_r_tb),
    .b24_r(second_mat_24_r_tb),

    .b21_i(second_mat_21_i_tb),
    .b22_i(second_mat_22_i_tb),
    .b23_i(second_mat_23_i_tb),
    .b24_i(second_mat_24_i_tb),

    .b31_r(second_mat_31_r_tb),
    .b32_r(second_mat_32_r_tb),
    .b33_r(second_mat_33_r_tb),
    .b34_r(second_mat_34_r_tb),

    .b31_i(second_mat_31_i_tb),
    .b32_i(second_mat_32_i_tb),
    .b33_i(second_mat_33_i_tb),
    .b34_i(second_mat_34_i_tb),

    .b41_r(second_mat_41_r_tb),
    .b42_r(second_mat_42_r_tb),
    .b43_r(second_mat_43_r_tb),
    .b44_r(second_mat_44_r_tb),

    .b41_i(second_mat_41_i_tb),
    .b42_i(second_mat_42_i_tb),
    .b43_i(second_mat_43_i_tb),
    .b44_i(second_mat_44_i_tb),

    /*********************************Output Matrix****************************/
    .Serial_Matrix_Out_r(Serial_Matrix_Out_r_tb),
    .Serial_Matrix_Out_i(Serial_Matrix_Out_i_tb),

    .done(mat_mul_done_tb),
    .valid(mat_mul_valid_tb)

);

endmodule