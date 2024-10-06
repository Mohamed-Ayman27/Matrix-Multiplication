// File : Matrix_Multiplication.v
// Author : Mohamed Ayman
// Date : 4/5/2024
// Version : 1
// Abstract : This file contains a project for 4*4 matrix multiplication

module Matrix_Multiplication #(
    parameter INTEGER_SIZE = 7,
    parameter FRACT_SIZE = 11,
    parameter DATA_WIDTH = INTEGER_SIZE +FRACT_SIZE
) (
    input wire clk,
    input wire rst_n,
    input wire Start_Mul,

    /*************************************MATRIX 1*****************************************/


    /****************MAT1_row1_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a11_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a12_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a13_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a14_r,

    /****************MAT1_row1_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a11_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a12_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a13_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a14_i,


    /****************MAT1_row2_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a21_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a22_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a23_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a24_r,

    /****************MAT1_row2_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a21_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a22_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a23_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a24_i,


    /****************MAT1_row3_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a31_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a32_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a33_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a34_r,

    /****************MAT1_row3_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a31_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a32_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a33_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a34_i,


    /****************MAT1_row4_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a41_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a42_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a43_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a44_r,

    /****************MAT1_row4_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a41_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a42_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a43_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a44_i,


    /*************************************MATRIX 2*****************************************/


    /****************MAT2_row1_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b11_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b12_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b13_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b14_r,

    /****************MAT2_row1_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b11_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b12_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b13_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b14_i,



    /****************MAT2_row2_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b21_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b22_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b23_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b24_r,

    /****************MAT2_row2_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b21_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b22_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b23_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b24_i,



    /****************MAT2_row3_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b31_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b32_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b33_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b34_r,

    /****************MAT2_row3_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b31_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b32_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b33_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b34_i,



    /****************MAT2_row4_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b41_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b42_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b43_r,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b44_r,

    /****************MAT2_row4_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b41_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b42_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b43_i,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b44_i,



    /*************************************OUTPUT MATRIX*****************************************/


    /****************OUT_MAT_row1_real****************/
    output wire signed [ ( DATA_WIDTH ) - 1 : 0 ] Serial_Matrix_Out_r,
    output wire signed [ ( DATA_WIDTH ) - 1 : 0 ] Serial_Matrix_Out_i,


    /**********************************************************
                    [c11 c12 c13 c14]
                    [c21 c22 c23 c24]
                    [c31 c32 c33 c34]
                    [c41 c42 c43 c44]
    The order of which the output of the multiplier comes
    [c11] ---> [c12] ---> [c13] ---> [c14]--->
        
        ---> [c21] ---> [c22] ---> [c23] ---> [c24]--->

                ---> [c31] ---> [c32] ---> [c33] ---> [c34]--->

                    ---> [c41] ---> [c42] ---> [c43] ---> [c44]

    ***********************************************************/

    output wire valid
);


    reg [ ( DATA_WIDTH ) - 1 : 0 ] a11_r_reg , b11_r_reg ,
                                   a12_r_reg , b12_r_reg ,
                                   a13_r_reg , b13_r_reg ,
                                   a14_r_reg , b14_r_reg ,
                                   a11_i_reg , b11_i_reg ,
                                   a12_i_reg , b12_i_reg ,
                                   a13_i_reg , b13_i_reg ,
                                   a14_i_reg , b14_i_reg ,
                                   a21_r_reg , b21_r_reg ,
                                   a22_r_reg , b22_r_reg ,
                                   a23_r_reg , b23_r_reg ,
                                   a24_r_reg , b24_r_reg ,
                                   a21_i_reg , b21_i_reg ,
                                   a22_i_reg , b22_i_reg ,
                                   a23_i_reg , b23_i_reg ,
                                   a24_i_reg , b24_i_reg ,
                                   a31_r_reg , b31_r_reg ,
                                   a32_r_reg , b32_r_reg ,
                                   a33_r_reg , b33_r_reg ,
                                   a34_r_reg , b34_r_reg ,
                                   a31_i_reg , b31_i_reg ,
                                   a32_i_reg , b32_i_reg ,
                                   a33_i_reg , b33_i_reg ,
                                   a34_i_reg , b34_i_reg ,
                                   a41_r_reg , b41_r_reg ,
                                   a42_r_reg , b42_r_reg ,
                                   a43_r_reg , b43_r_reg ,
                                   a44_r_reg , b44_r_reg ,
                                   a41_i_reg , b41_i_reg ,
                                   a42_i_reg , b42_i_reg ,
                                   a43_i_reg , b43_i_reg ,
                                   a44_i_reg , b44_i_reg;



    wire [ ( DATA_WIDTH ) - 1 : 0 ] c11_r , d11_r;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c12_r , d12_r;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c13_r , d13_r;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c14_r , d14_r;

    wire [ ( DATA_WIDTH ) - 1 : 0 ] c11_i , d11_i;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c12_i , d12_i;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c13_i , d13_i;
    wire [ ( DATA_WIDTH ) - 1 : 0 ] c14_i , d14_i;

    
    reg [ ( DATA_WIDTH ) - 1 : 0 ] c11_r_reg , d11_r_reg;
    reg [ ( DATA_WIDTH ) - 1 : 0 ] c12_r_reg , d12_r_reg;
    reg [ ( DATA_WIDTH ) - 1 : 0 ] c13_r_reg , d13_r_reg;
    reg [ ( DATA_WIDTH ) - 1 : 0 ] c14_r_reg , d14_r_reg;

    reg [ ( DATA_WIDTH ) - 1 : 0 ] c11_i_reg , d11_i_reg;
    reg [ ( DATA_WIDTH ) - 1 : 0 ] c12_i_reg , d12_i_reg;
    reg [ ( DATA_WIDTH ) - 1 : 0 ] c13_i_reg , d13_i_reg;
    reg [ ( DATA_WIDTH ) - 1 : 0 ] c14_i_reg , d14_i_reg;


    reg Start_Mul_reg;


always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        { a11_r_reg , b11_r_reg } <= 'b00;
        { a12_r_reg , b12_r_reg } <= 'b00;
        { a13_r_reg , b13_r_reg } <= 'b00;
        { a14_r_reg , b14_r_reg } <= 'b00;
        { a11_i_reg , b11_i_reg } <= 'b00;
        { a12_i_reg , b12_i_reg } <= 'b00;
        { a13_i_reg , b13_i_reg } <= 'b00;
        { a14_i_reg , b14_i_reg } <= 'b00;
        { a21_r_reg , b21_r_reg } <= 'b00;
        { a22_r_reg , b22_r_reg } <= 'b00;
        { a23_r_reg , b23_r_reg } <= 'b00;
        { a24_r_reg , b24_r_reg } <= 'b00;
        { a21_i_reg , b21_i_reg } <= 'b00;
        { a22_i_reg , b22_i_reg } <= 'b00;
        { a23_i_reg , b23_i_reg } <= 'b00;
        { a24_i_reg , b24_i_reg } <= 'b00;
        { a31_r_reg , b31_r_reg } <= 'b00;
        { a32_r_reg , b32_r_reg } <= 'b00;
        { a33_r_reg , b33_r_reg } <= 'b00;
        { a34_r_reg , b34_r_reg } <= 'b00;
        { a31_i_reg , b31_i_reg } <= 'b00;
        { a32_i_reg , b32_i_reg } <= 'b00;
        { a33_i_reg , b33_i_reg } <= 'b00;
        { a34_i_reg , b34_i_reg } <= 'b00;
        { a41_r_reg , b41_r_reg } <= 'b00;
        { a42_r_reg , b42_r_reg } <= 'b00;
        { a43_r_reg , b43_r_reg } <= 'b00;
        { a44_r_reg , b44_r_reg } <= 'b00;
        { a41_i_reg , b41_i_reg } <= 'b00;
        { a42_i_reg , b42_i_reg } <= 'b00;
        { a43_i_reg , b43_i_reg } <= 'b00;
        { a44_i_reg , b44_i_reg } <= 'b00;

        { c11_r_reg , d11_r_reg } <= 'b00;
        { c12_r_reg , d12_r_reg } <= 'b00;
        { c13_r_reg , d13_r_reg } <= 'b00;
        { c14_r_reg , d14_r_reg } <= 'b00;
        { c11_i_reg , d11_i_reg } <= 'b00;
        { c12_i_reg , d12_i_reg } <= 'b00;
        { c13_i_reg , d13_i_reg } <= 'b00;
        { c14_i_reg , d14_i_reg } <= 'b00;
    end
    else if(Start_Mul) begin
        a11_r_reg <= a11_r;
        a12_r_reg <= a12_r;
        a13_r_reg <= a13_r;
        a14_r_reg <= a14_r;
        a11_i_reg <= a11_i;
        a12_i_reg <= a12_i;
        a13_i_reg <= a13_i;
        a14_i_reg <= a14_i;
        a21_r_reg <= a21_r;
        a22_r_reg <= a22_r;
        a23_r_reg <= a23_r;
        a24_r_reg <= a24_r;
        a21_i_reg <= a21_i;
        a22_i_reg <= a22_i;
        a23_i_reg <= a23_i;
        a24_i_reg <= a24_i;
        a31_r_reg <= a31_r;
        a32_r_reg <= a32_r;
        a33_r_reg <= a33_r;
        a34_r_reg <= a34_r;
        a31_i_reg <= a31_i;
        a32_i_reg <= a32_i;
        a33_i_reg <= a33_i;
        a34_i_reg <= a34_i;
        a41_r_reg <= a41_r;
        a42_r_reg <= a42_r;
        a43_r_reg <= a43_r;
        a44_r_reg <= a44_r;
        a41_i_reg <= a41_i;
        a42_i_reg <= a42_i;
        a43_i_reg <= a43_i;
        a44_i_reg <= a44_i;

        b11_r_reg <= b11_r;
        b12_r_reg <= b12_r;
        b13_r_reg <= b13_r;
        b14_r_reg <= b14_r;
        b11_i_reg <= b11_i;
        b12_i_reg <= b12_i;
        b13_i_reg <= b13_i;
        b14_i_reg <= b14_i;
        b21_r_reg <= b21_r;
        b22_r_reg <= b22_r;
        b23_r_reg <= b23_r;
        b24_r_reg <= b24_r;
        b21_i_reg <= b21_i;
        b22_i_reg <= b22_i;
        b23_i_reg <= b23_i;
        b24_i_reg <= b24_i;
        b31_r_reg <= b31_r;
        b32_r_reg <= b32_r;
        b33_r_reg <= b33_r;
        b34_r_reg <= b34_r;
        b31_i_reg <= b31_i;
        b32_i_reg <= b32_i;
        b33_i_reg <= b33_i;
        b34_i_reg <= b34_i;
        b41_r_reg <= b41_r;
        b42_r_reg <= b42_r;
        b43_r_reg <= b43_r;
        b44_r_reg <= b44_r;
        b41_i_reg <= b41_i;
        b42_i_reg <= b42_i;
        b43_i_reg <= b43_i;
        b44_i_reg <= b44_i;

        c11_r_reg <= c11_r;
        c12_r_reg <= c12_r;
        c13_r_reg <= c13_r;
        c14_r_reg <= c14_r;
        c11_i_reg <= c11_i;
        c12_i_reg <= c12_i;
        c13_i_reg <= c13_i;
        c14_i_reg <= c14_i;

        d11_r_reg <= d11_r;
        d12_r_reg <= d12_r;
        d13_r_reg <= d13_r;
        d14_r_reg <= d14_r;
        d11_i_reg <= d11_i;
        d12_i_reg <= d12_i;
        d13_i_reg <= d13_i;
        d14_i_reg <= d14_i;


    end
    else begin
        c11_r_reg <= c11_r;
        c12_r_reg <= c12_r;
        c13_r_reg <= c13_r;
        c14_r_reg <= c14_r;
        c11_i_reg <= c11_i;
        c12_i_reg <= c12_i;
        c13_i_reg <= c13_i;
        c14_i_reg <= c14_i;

        d11_r_reg <= d11_r;
        d12_r_reg <= d12_r;
        d13_r_reg <= d13_r;
        d14_r_reg <= d14_r;
        d11_i_reg <= d11_i;
        d12_i_reg <= d12_i;
        d13_i_reg <= d13_i;
        d14_i_reg <= d14_i;
    end
    
end




always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        Start_Mul_reg   <=  'b0;
    end
    else begin
        Start_Mul_reg <= Start_Mul;
    end
end











matrix_mul_ctrl #(
    .INTEGER_SIZE(INTEGER_SIZE),
    .FRACT_SIZE(FRACT_SIZE),
    .DATA_WIDTH(DATA_WIDTH)
)u0_matrix_ctrl (
    .clk(clk),
    .rst_n(rst_n),
    .Start_Mul(Start_Mul_reg),

    /*************************************MATRIX 1*****************************************/
    .a11_r_reg(a11_r_reg),
    .a12_r_reg(a12_r_reg),
    .a13_r_reg(a13_r_reg),
    .a14_r_reg(a14_r_reg),

    .a11_i_reg(a11_i_reg),
    .a12_i_reg(a12_i_reg),
    .a13_i_reg(a13_i_reg),
    .a14_i_reg(a14_i_reg),

    .a21_r_reg(a21_r_reg),
    .a22_r_reg(a22_r_reg),
    .a23_r_reg(a23_r_reg),
    .a24_r_reg(a24_r_reg),

    .a21_i_reg(a21_i_reg),
    .a22_i_reg(a22_i_reg),
    .a23_i_reg(a23_i_reg),
    .a24_i_reg(a24_i_reg),

    .a31_r_reg(a31_r_reg),
    .a32_r_reg(a32_r_reg),
    .a33_r_reg(a33_r_reg),
    .a34_r_reg(a34_r_reg),

    .a31_i_reg(a31_i_reg),
    .a32_i_reg(a32_i_reg),
    .a33_i_reg(a33_i_reg),
    .a34_i_reg(a34_i_reg),

    .a41_r_reg(a41_r_reg),
    .a42_r_reg(a42_r_reg),
    .a43_r_reg(a43_r_reg),
    .a44_r_reg(a44_r_reg),

    .a41_i_reg(a41_i_reg),
    .a42_i_reg(a42_i_reg),
    .a43_i_reg(a43_i_reg),
    .a44_i_reg(a44_i_reg),


    /*************************************MATRIX 2*****************************************/
    .b11_r_reg(b11_r_reg),
    .b12_r_reg(b12_r_reg),
    .b13_r_reg(b13_r_reg),
    .b14_r_reg(b14_r_reg),

    .b11_i_reg(b11_i_reg),
    .b12_i_reg(b12_i_reg),
    .b13_i_reg(b13_i_reg),
    .b14_i_reg(b14_i_reg),

    .b21_r_reg(b21_r_reg),
    .b22_r_reg(b22_r_reg),
    .b23_r_reg(b23_r_reg),
    .b24_r_reg(b24_r_reg),

    .b21_i_reg(b21_i_reg),
    .b22_i_reg(b22_i_reg),
    .b23_i_reg(b23_i_reg),
    .b24_i_reg(b24_i_reg),

    .b31_r_reg(b31_r_reg),
    .b32_r_reg(b32_r_reg),
    .b33_r_reg(b33_r_reg),
    .b34_r_reg(b34_r_reg),

    .b31_i_reg(b31_i_reg),
    .b32_i_reg(b32_i_reg),
    .b33_i_reg(b33_i_reg),
    .b34_i_reg(b34_i_reg),

    .b41_r_reg(b41_r_reg),
    .b42_r_reg(b42_r_reg),
    .b43_r_reg(b43_r_reg),
    .b44_r_reg(b44_r_reg),

    .b41_i_reg(b41_i_reg),
    .b42_i_reg(b42_i_reg),
    .b43_i_reg(b43_i_reg),
    .b44_i_reg(b44_i_reg),

    /*********************************Output Matrix****************************/
    .c11_r(c11_r),
    .c12_r(c12_r),
    .c13_r(c13_r),
    .c14_r(c14_r),
    .c11_i(c11_i),
    .c12_i(c12_i),
    .c13_i(c13_i),
    .c14_i(c14_i),

    .d11_r(d11_r),
    .d12_r(d12_r),
    .d13_r(d13_r),
    .d14_r(d14_r),
    .d11_i(d11_i),
    .d12_i(d12_i),
    .d13_i(d13_i),
    .d14_i(d14_i),

    .valid(valid)
);

Element_Extraction #(
    .INTEGER_SIZE(INTEGER_SIZE),
    .FRACT_SIZE(FRACT_SIZE),
    .DATA_WIDTH(DATA_WIDTH)
)u0_Element_Extraction (
    .clk(clk),
    .rst(rst_n),

    /******************ROW********************/
    .a11_r(c11_r_reg),
    .a12_r(c12_r_reg),
    .a13_r(c13_r_reg),
    .a14_r(c14_r_reg),
    .a11_i(c11_i_reg),
    .a12_i(c12_i_reg),
    .a13_i(c13_i_reg),
    .a14_i(c14_i_reg),

    /******************COL********************/
    .b11_r(d11_r_reg),
    .b21_r(d12_r_reg),
    .b31_r(d13_r_reg),
    .b41_r(d14_r_reg),
    .b11_i(d11_i_reg),
    .b21_i(d12_i_reg),
    .b31_i(d13_i_reg),
    .b41_i(d14_i_reg),


    .Out_Element_r(Serial_Matrix_Out_r),
    .Out_Element_i(Serial_Matrix_Out_i)

);







endmodule