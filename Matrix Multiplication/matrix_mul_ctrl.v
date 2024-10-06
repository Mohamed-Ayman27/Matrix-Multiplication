// File : matrix_mul_ctrl.v
// Author : Mohamed Ayman
// Date : 4/5/2024
// Version : 1
// Abstract : This file contains a project for 4*4 matrix multiplication controller

module matrix_mul_ctrl #(
    parameter INTEGER_SIZE = 7,
    parameter FRACT_SIZE = 11,
    parameter DATA_WIDTH = INTEGER_SIZE +FRACT_SIZE
) (
    input wire clk,
    input wire rst_n,
    input wire Start_Mul,

    /*************************************MATRIX 1*****************************************/


    /****************MAT1_row1_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a11_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a12_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a13_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a14_r_reg,

    /****************MAT1_row1_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a11_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a12_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a13_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a14_i_reg,


    /****************MAT1_row2_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a21_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a22_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a23_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a24_r_reg,

    /****************MAT1_row2_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a21_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a22_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a23_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a24_i_reg,


    /****************MAT1_row3_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a31_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a32_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a33_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a34_r_reg,

    /****************MAT1_row3_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a31_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a32_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a33_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a34_i_reg,


    /****************MAT1_row4_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a41_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a42_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a43_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a44_r_reg,

    /****************MAT1_row4_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] a41_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a42_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a43_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] a44_i_reg,


    /*************************************MATRIX 2*****************************************/


    /****************MAT2_row1_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b11_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b12_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b13_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b14_r_reg,

    /****************MAT2_row1_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b11_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b12_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b13_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b14_i_reg,



    /****************MAT2_row2_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b21_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b22_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b23_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b24_r_reg,

    /****************MAT2_row2_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b21_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b22_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b23_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b24_i_reg,



    /****************MAT2_row3_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b31_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b32_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b33_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b34_r_reg,

    /****************MAT2_row3_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b31_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b32_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b33_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b34_i_reg,



    /****************MAT2_row4_real****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b41_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b42_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b43_r_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b44_r_reg,

    /****************MAT2_row4_imag****************/
    input wire signed [ DATA_WIDTH - 1 : 0 ] b41_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b42_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b43_i_reg,
    input wire signed [ DATA_WIDTH - 1 : 0 ] b44_i_reg,



    /*************************************OUTPUT MATRIX*****************************************/


    /****************OUT_MAT_row1_real****************/
    output reg signed [ DATA_WIDTH - 1 : 0 ] c11_r,
    output reg signed [ DATA_WIDTH - 1 : 0 ] c12_r,
    output reg signed [ DATA_WIDTH - 1 : 0 ] c13_r,
    output reg signed [ DATA_WIDTH - 1 : 0 ] c14_r,

    /****************OUT_MAT_row1_imag****************/
    output reg signed [ DATA_WIDTH - 1 : 0 ] c11_i,
    output reg signed [ DATA_WIDTH - 1 : 0 ] c12_i,
    output reg signed [ DATA_WIDTH - 1 : 0 ] c13_i,
    output reg signed [ DATA_WIDTH - 1 : 0 ] c14_i,


    /****************OUT_MAT_row1_real****************/
    output reg signed [ DATA_WIDTH - 1 : 0 ] d11_r,
    output reg signed [ DATA_WIDTH - 1 : 0 ] d12_r,
    output reg signed [ DATA_WIDTH - 1 : 0 ] d13_r,
    output reg signed [ DATA_WIDTH - 1 : 0 ] d14_r,

    /****************OUT_MAT_row1_imag****************/
    output reg signed [ DATA_WIDTH - 1 : 0 ] d11_i,
    output reg signed [ DATA_WIDTH - 1 : 0 ] d12_i,
    output reg signed [ DATA_WIDTH - 1 : 0 ] d13_i,
    output reg signed [ DATA_WIDTH - 1 : 0 ] d14_i,

    output reg valid

);

    reg [ ( DATA_WIDTH ) - 1 : 0 ] a11_r , b11_r ,
                                   a12_r , b12_r ,
                                   a13_r , b13_r ,
                                   a14_r , b14_r ,
                                   a11_i , b11_i ,
                                   a12_i , b12_i ,
                                   a13_i , b13_i ,
                                   a14_i , b14_i ,
                                   a21_r , b21_r ,
                                   a22_r , b22_r ,
                                   a23_r , b23_r ,
                                   a24_r , b24_r ,
                                   a21_i , b21_i ,
                                   a22_i , b22_i ,
                                   a23_i , b23_i ,
                                   a24_i , b24_i ,
                                   a31_r , b31_r ,
                                   a32_r , b32_r ,
                                   a33_r , b33_r ,
                                   a34_r , b34_r ,
                                   a31_i , b31_i ,
                                   a32_i , b32_i ,
                                   a33_i , b33_i ,
                                   a34_i , b34_i ,
                                   a41_r , b41_r ,
                                   a42_r , b42_r ,
                                   a43_r , b43_r ,
                                   a44_r , b44_r ,
                                   a41_i , b41_i ,
                                   a42_i , b42_i ,
                                   a43_i , b43_i ,
                                   a44_i , b44_i ,
                                   c11_r_comb , c11_i_comb ,
                                   c12_r_comb , c12_i_comb ,
                                   c13_r_comb , c13_i_comb ,
                                   c14_r_comb , c14_i_comb ,
                                   d11_r_comb , d11_i_comb ,
                                   d12_r_comb , d12_i_comb ,
                                   d13_r_comb , d13_i_comb ,
                                   d14_r_comb , d14_i_comb ;


    reg [ 4 : 0 ] current_state, next_state;


    localparam Element_11_calc =5'b0_00_00,


               // Calc elem 12  
               
               Element_12_calc =5'b0_00_01,


               // Calc elem 13  

               Element_13_calc =5'b0_00_11,


               // Calc elem 14  

               Element_14_calc =5'b0_01_00,


            /**********************ROW2******************/


                // Calc elem 21  
               
               Element_21_calc =5'b0_01_01,


               // Calc elem 22  
               
               Element_22_calc =5'b0_01_10,


               // Calc elem 23  

               Element_23_calc =5'b0_01_11,


               // Calc elem 24  

               Element_24_calc =5'b0_10_00,

               
               
            /**********************ROW3******************/


                // Calc elem 31  
               
               Element_31_calc =5'b0_10_01,


               // Calc elem 32  
               
               Element_32_calc =5'b0_10_10,


               // Calc elem 33  

               Element_33_calc =5'b0_10_11,


               // Calc elem 34  

               Element_34_calc =5'b0_11_00,



            /**********************ROW4******************/


                // Calc elem 41  
               
               Element_41_calc =5'b0_11_01,


               // Calc elem 42  
               
               Element_42_calc =5'b0_11_10,


               // Calc elem 43  

               Element_43_calc =5'b0_11_11,


               // Calc elem 44  

               Element_44_calc =5'b1_00_00,

               
               IDLE = 5'b1_00_01,

               Stall_1 = 5'b1_00_11,
               Stall_2 = 5'b1_01_00,
               Stall_3 = 5'b1_01_01,
               Stall_4 = 5'b1_01_10,
               Stall_5 = 5'b1_01_11,
               Stall_6 = 5'b1_10_00;





always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        { a12_r , b12_r } <= 'b00;
        { a13_r , b13_r } <= 'b00;
        { a11_r , b11_r } <= 'b00;
        { a14_r , b14_r } <= 'b00;
        { a11_i , b11_i } <= 'b00;
        { a12_i , b12_i } <= 'b00;
        { a13_i , b13_i } <= 'b00;
        { a14_i , b14_i } <= 'b00;
        { a21_r , b21_r } <= 'b00;
        { a22_r , b22_r } <= 'b00;
        { a23_r , b23_r } <= 'b00;
        { a24_r , b24_r } <= 'b00;
        { a21_i , b21_i } <= 'b00;
        { a22_i , b22_i } <= 'b00;
        { a23_i , b23_i } <= 'b00;
        { a24_i , b24_i } <= 'b00;
        { a31_r , b31_r } <= 'b00;
        { a32_r , b32_r } <= 'b00;
        { a33_r , b33_r } <= 'b00;
        { a34_r , b34_r } <= 'b00;
        { a31_i , b31_i } <= 'b00;
        { a32_i , b32_i } <= 'b00;
        { a33_i , b33_i } <= 'b00;
        { a34_i , b34_i } <= 'b00;
        { a41_r , b41_r } <= 'b00;
        { a42_r , b42_r } <= 'b00;
        { a43_r , b43_r } <= 'b00;
        { a44_r , b44_r } <= 'b00;
        { a41_i , b41_i } <= 'b00;
        { a42_i , b42_i } <= 'b00;
        { a43_i , b43_i } <= 'b00;
        { a44_i , b44_i } <= 'b00;

        c11_r <= 0;
        c12_r <= 0;
        c13_r <= 0;
        c14_r <= 0;

        c11_i <= 0;
        c12_i <= 0;
        c13_i <= 0;
        c14_i <= 0;

        d11_r <= 0;
        d12_r <= 0;
        d13_r <= 0;
        d14_r <= 0;

        d11_i <= 0;
        d12_i <= 0;
        d13_i <= 0;
        d14_i <= 0;

    end
    else begin
        a11_r <= a11_r_reg;
        a12_r <= a12_r_reg;
        a13_r <= a13_r_reg;
        a14_r <= a14_r_reg;
        a11_i <= a11_i_reg;
        a12_i <= a12_i_reg;
        a13_i <= a13_i_reg;
        a14_i <= a14_i_reg;
        a21_r <= a21_r_reg;
        a22_r <= a22_r_reg;
        a23_r <= a23_r_reg;
        a24_r <= a24_r_reg;
        a21_i <= a21_i_reg;
        a22_i <= a22_i_reg;
        a23_i <= a23_i_reg;
        a24_i <= a24_i_reg;
        a31_r <= a31_r_reg;
        a32_r <= a32_r_reg;
        a33_r <= a33_r_reg;
        a34_r <= a34_r_reg;
        a31_i <= a31_i_reg;
        a32_i <= a32_i_reg;
        a33_i <= a33_i_reg;
        a34_i <= a34_i_reg;
        a41_r <= a41_r_reg;
        a42_r <= a42_r_reg;
        a43_r <= a43_r_reg;
        a44_r <= a44_r_reg;
        a41_i <= a41_i_reg;
        a42_i <= a42_i_reg;
        a43_i <= a43_i_reg;
        a44_i <= a44_i_reg;

        b11_r <= b11_r_reg;
        b12_r <= b12_r_reg;
        b13_r <= b13_r_reg;
        b14_r <= b14_r_reg;
        b11_i <= b11_i_reg;
        b12_i <= b12_i_reg;
        b13_i <= b13_i_reg;
        b14_i <= b14_i_reg;
        b21_r <= b21_r_reg;
        b22_r <= b22_r_reg;
        b23_r <= b23_r_reg;
        b24_r <= b24_r_reg;
        b21_i <= b21_i_reg;
        b22_i <= b22_i_reg;
        b23_i <= b23_i_reg;
        b24_i <= b24_i_reg;
        b31_r <= b31_r_reg;
        b32_r <= b32_r_reg;
        b33_r <= b33_r_reg;
        b34_r <= b34_r_reg;
        b31_i <= b31_i_reg;
        b32_i <= b32_i_reg;
        b33_i <= b33_i_reg;
        b34_i <= b34_i_reg;
        b41_r <= b41_r_reg;
        b42_r <= b42_r_reg;
        b43_r <= b43_r_reg;
        b44_r <= b44_r_reg;
        b41_i <= b41_i_reg;
        b42_i <= b42_i_reg;
        b43_i <= b43_i_reg;
        b44_i <= b44_i_reg;

        c11_r <= c11_r_comb;
        c12_r <= c12_r_comb;
        c13_r <= c13_r_comb;
        c14_r <= c14_r_comb;

        c11_i <= c11_i_comb;
        c12_i <= c12_i_comb;
        c13_i <= c13_i_comb;
        c14_i <= c14_i_comb;

        d11_r <= d11_r_comb;
        d12_r <= d12_r_comb;
        d13_r <= d13_r_comb;
        d14_r <= d14_r_comb;

        d11_i <= d11_i_comb;
        d12_i <= d12_i_comb;
        d13_i <= d13_i_comb;
        d14_i <= d14_i_comb;
    end
    
end



    always@(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end



    always@(*)begin

        valid = 1'b0;
        c11_r_comb = 0;
        c12_r_comb = 0;
        c13_r_comb = 0;
        c14_r_comb = 0;

        c11_i_comb = 0;
        c12_i_comb = 0;
        c13_i_comb = 0;
        c14_i_comb = 0;

        d11_r_comb = 0;
        d12_r_comb = 0;
        d13_r_comb = 0;
        d14_r_comb = 0;

        d11_i_comb = 0;
        d12_i_comb = 0;
        d13_i_comb = 0;
        d14_i_comb = 0;




        case(current_state)

            IDLE:begin
                if (Start_Mul) begin
                    next_state = Element_11_calc;
                end
                else begin
                    next_state = IDLE;
                end
            end

            Element_11_calc:begin
                c11_r_comb = a11_r;
                c12_r_comb = a12_r;
                c13_r_comb = a13_r;
                c14_r_comb = a14_r;

                c11_i_comb = a11_i;
                c12_i_comb = a12_i;
                c13_i_comb = a13_i;
                c14_i_comb = a14_i;

                d11_r_comb = b11_r;
                d12_r_comb = b21_r;
                d13_r_comb = b31_r;
                d14_r_comb = b41_r;

                d11_i_comb = b11_i;
                d12_i_comb = b21_i;
                d13_i_comb = b31_i;
                d14_i_comb = b41_i;

                valid = 1'b0;
                next_state = Element_12_calc;
            end

        
            Element_12_calc:begin

                c11_r_comb = a11_r;
                c12_r_comb = a12_r;
                c13_r_comb = a13_r;
                c14_r_comb = a14_r;

                c11_i_comb = a11_i;
                c12_i_comb = a12_i;
                c13_i_comb = a13_i;
                c14_i_comb = a14_i;

                d11_r_comb = b12_r;
                d12_r_comb = b22_r;
                d13_r_comb = b32_r;
                d14_r_comb = b42_r;

                d11_i_comb = b12_i;
                d12_i_comb = b22_i;
                d13_i_comb = b32_i;
                d14_i_comb = b42_i;

                valid = 1'b0;
                next_state = Element_13_calc;
            end



            Element_13_calc:begin

                c11_r_comb = a11_r;
                c12_r_comb = a12_r;
                c13_r_comb = a13_r;
                c14_r_comb = a14_r;

                c11_i_comb = a11_i;
                c12_i_comb = a12_i;
                c13_i_comb = a13_i;
                c14_i_comb = a14_i;

                d11_r_comb = b13_r;
                d12_r_comb = b23_r;
                d13_r_comb = b33_r;
                d14_r_comb = b43_r;

                d11_i_comb = b13_i;
                d12_i_comb = b23_i;
                d13_i_comb = b33_i;
                d14_i_comb = b43_i;

                valid = 1'b0;
                next_state = Element_14_calc;
            end


            Element_14_calc:begin

                c11_r_comb = a11_r;
                c12_r_comb = a12_r;
                c13_r_comb = a13_r;
                c14_r_comb = a14_r;

                c11_i_comb = a11_i;
                c12_i_comb = a12_i;
                c13_i_comb = a13_i;
                c14_i_comb = a14_i;

                d11_r_comb = b14_r;
                d12_r_comb = b24_r;
                d13_r_comb = b34_r;
                d14_r_comb = b44_r;

                d11_i_comb = b14_i;
                d12_i_comb = b24_i;
                d13_i_comb = b34_i;
                d14_i_comb = b44_i;
                valid = 1'b0;

                next_state = Element_21_calc;
            end




            Element_21_calc:begin

                c11_r_comb = a21_r;
                c12_r_comb = a22_r;
                c13_r_comb = a23_r;
                c14_r_comb = a24_r;

                c11_i_comb = a21_i;
                c12_i_comb = a22_i;
                c13_i_comb = a23_i;
                c14_i_comb = a24_i;

                d11_r_comb = b11_r;
                d12_r_comb = b21_r;
                d13_r_comb = b31_r;
                d14_r_comb = b41_r;

                d11_i_comb = b11_i;
                d12_i_comb = b21_i;
                d13_i_comb = b31_i;
                d14_i_comb = b41_i;

                valid = 1'b0;

                next_state = Element_22_calc;
            end

            Element_22_calc:begin

                c11_r_comb = a21_r;
                c12_r_comb = a22_r;
                c13_r_comb = a23_r;
                c14_r_comb = a24_r;

                c11_i_comb = a21_i;
                c12_i_comb = a22_i;
                c13_i_comb = a23_i;
                c14_i_comb = a24_i;

                d11_r_comb = b12_r;
                d12_r_comb = b22_r;
                d13_r_comb = b32_r;
                d14_r_comb = b42_r;

                d11_i_comb = b12_i;
                d12_i_comb = b22_i;
                d13_i_comb = b32_i;
                d14_i_comb = b42_i;

                valid = 1'b0;

                next_state = Element_23_calc;
            end


            Element_23_calc:begin

                c11_r_comb = a21_r;
                c12_r_comb = a22_r;
                c13_r_comb = a23_r;
                c14_r_comb = a24_r;

                c11_i_comb = a21_i;
                c12_i_comb = a22_i;
                c13_i_comb = a23_i;
                c14_i_comb = a24_i;

                d11_r_comb = b13_r;
                d12_r_comb = b23_r;
                d13_r_comb = b33_r;
                d14_r_comb = b43_r;

                d11_i_comb = b13_i;
                d12_i_comb = b23_i;
                d13_i_comb = b33_i;
                d14_i_comb = b43_i;

                valid = 1'b1;

                next_state = Element_24_calc;
            end


            Element_24_calc:begin

                c11_r_comb = a21_r;
                c12_r_comb = a22_r;
                c13_r_comb = a23_r;
                c14_r_comb = a24_r;

                c11_i_comb = a21_i;
                c12_i_comb = a22_i;
                c13_i_comb = a23_i;
                c14_i_comb = a24_i;

                d11_r_comb = b14_r;
                d12_r_comb = b24_r;
                d13_r_comb = b34_r;
                d14_r_comb = b44_r;

                d11_i_comb = b14_i;
                d12_i_comb = b24_i;
                d13_i_comb = b34_i;
                d14_i_comb = b44_i;

                valid = 1'b1;

                next_state = Element_31_calc;
            end

            Element_31_calc:begin

                c11_r_comb = a31_r;
                c12_r_comb = a32_r;
                c13_r_comb = a33_r;
                c14_r_comb = a34_r;

                c11_i_comb = a31_i;
                c12_i_comb = a32_i;
                c13_i_comb = a33_i;
                c14_i_comb = a34_i;

                d11_r_comb = b11_r;
                d12_r_comb = b21_r;
                d13_r_comb = b31_r;
                d14_r_comb = b41_r;

                d11_i_comb = b11_i;
                d12_i_comb = b21_i;
                d13_i_comb = b31_i;
                d14_i_comb = b41_i;

                valid = 1'b1;

                next_state = Element_32_calc;
            end

            Element_32_calc:begin

                c11_r_comb = a31_r;
                c12_r_comb = a32_r;
                c13_r_comb = a33_r;
                c14_r_comb = a34_r;

                c11_i_comb = a31_i;
                c12_i_comb = a32_i;
                c13_i_comb = a33_i;
                c14_i_comb = a34_i;

                d11_r_comb = b12_r;
                d12_r_comb = b22_r;
                d13_r_comb = b32_r;
                d14_r_comb = b42_r;

                d11_i_comb = b12_i;
                d12_i_comb = b22_i;
                d13_i_comb = b32_i;
                d14_i_comb = b42_i;

                valid = 1'b1;

                next_state = Element_33_calc;
            end

            Element_33_calc:begin

                c11_r_comb = a31_r;
                c12_r_comb = a32_r;
                c13_r_comb = a33_r;
                c14_r_comb = a34_r;

                c11_i_comb = a31_i;
                c12_i_comb = a32_i;
                c13_i_comb = a33_i;
                c14_i_comb = a34_i;

                d11_r_comb = b13_r;
                d12_r_comb = b23_r;
                d13_r_comb = b33_r;
                d14_r_comb = b43_r;

                d11_i_comb = b13_i;
                d12_i_comb = b23_i;
                d13_i_comb = b33_i;
                d14_i_comb = b43_i;

                valid = 1'b1;

                next_state = Element_34_calc;
            end

            Element_34_calc:begin

                c11_r_comb = a31_r;
                c12_r_comb = a32_r;
                c13_r_comb = a33_r;
                c14_r_comb = a34_r;

                c11_i_comb = a31_i;
                c12_i_comb = a32_i;
                c13_i_comb = a33_i;
                c14_i_comb = a34_i;

                d11_r_comb = b14_r;
                d12_r_comb = b24_r;
                d13_r_comb = b34_r;
                d14_r_comb = b44_r;

                d11_i_comb = b14_i;
                d12_i_comb = b24_i;
                d13_i_comb = b34_i;
                d14_i_comb = b44_i;

                valid = 1'b1;

                next_state = Element_41_calc;
            end

            Element_41_calc:begin

                c11_r_comb = a41_r;
                c12_r_comb = a42_r;
                c13_r_comb = a43_r;
                c14_r_comb = a44_r;

                c11_i_comb = a41_i;
                c12_i_comb = a42_i;
                c13_i_comb = a43_i;
                c14_i_comb = a44_i;

                d11_r_comb = b11_r;
                d12_r_comb = b21_r;
                d13_r_comb = b31_r;
                d14_r_comb = b41_r;

                d11_i_comb = b11_i;
                d12_i_comb = b21_i;
                d13_i_comb = b31_i;
                d14_i_comb = b41_i;

                valid = 1'b1;

                next_state = Element_42_calc;
            end

            Element_42_calc:begin

                c11_r_comb = a41_r;
                c12_r_comb = a42_r;
                c13_r_comb = a43_r;
                c14_r_comb = a44_r;

                c11_i_comb = a41_i;
                c12_i_comb = a42_i;
                c13_i_comb = a43_i;
                c14_i_comb = a44_i;

                d11_r_comb = b12_r;
                d12_r_comb = b22_r;
                d13_r_comb = b32_r;
                d14_r_comb = b42_r;

                d11_i_comb = b12_i;
                d12_i_comb = b22_i;
                d13_i_comb = b32_i;
                d14_i_comb = b42_i;

                valid = 1'b1;

                next_state = Element_43_calc;
            end

            Element_43_calc:begin

                c11_r_comb = a41_r;
                c12_r_comb = a42_r;
                c13_r_comb = a43_r;
                c14_r_comb = a44_r;

                c11_i_comb = a41_i;
                c12_i_comb = a42_i;
                c13_i_comb = a43_i;
                c14_i_comb = a44_i;

                d11_r_comb = b13_r;
                d12_r_comb = b23_r;
                d13_r_comb = b33_r;
                d14_r_comb = b43_r;

                d11_i_comb = b13_i;
                d12_i_comb = b23_i;
                d13_i_comb = b33_i;
                d14_i_comb = b43_i;

                valid = 1'b1;

                next_state = Element_44_calc;
            end

            Element_44_calc:begin

                c11_r_comb = a41_r;
                c12_r_comb = a42_r;
                c13_r_comb = a43_r;
                c14_r_comb = a44_r;

                c11_i_comb = a41_i;
                c12_i_comb = a42_i;
                c13_i_comb = a43_i;
                c14_i_comb = a44_i;

                d11_r_comb = b14_r;
                d12_r_comb = b24_r;
                d13_r_comb = b34_r;
                d14_r_comb = b44_r;

                d11_i_comb = b14_i;
                d12_i_comb = b24_i;
                d13_i_comb = b34_i;
                d14_i_comb = b44_i;

                valid = 1'b1;

                next_state = Stall_1;
            end

        Stall_1:begin
            valid = 1'b1;

            next_state = Stall_2;
        end

        Stall_2:begin
            valid = 1'b1;

            next_state = Stall_3;
        end

        Stall_3:begin
            valid = 1'b1;

            next_state = Stall_4;
        end

        Stall_4:begin
            valid = 1'b1;

            next_state = Stall_5;
        end

        Stall_5:begin
            valid = 1'b1;

            next_state = Stall_6;
        end
        Stall_6:begin
            valid = 1'b1;

            next_state = IDLE;
        end


        default:begin
            valid = 1'b0;
            c11_r_comb = 0;
            c12_r_comb = 0;
            c13_r_comb = 0;
            c14_r_comb = 0;

            c11_i_comb = 0;
            c12_i_comb = 0;
            c13_i_comb = 0;
            c14_i_comb = 0;

            d11_r_comb = 0;
            d12_r_comb = 0;
            d13_r_comb = 0;
            d14_r_comb = 0;

            d11_i_comb = 0;
            d12_i_comb = 0;
            d13_i_comb = 0;
            d14_i_comb = 0;
            next_state = IDLE;
        end
        endcase
    end



    
endmodule