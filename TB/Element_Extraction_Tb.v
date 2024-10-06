// File : Element_Extraction_Tb.v
// Author : Mohamed Ayman
// Date : 4/5/2024
// Version : 1
// Abstract : This file contains testbench for Element Extraction of the multipliction 

module Element_Extraction_Tb;

    parameter INT_WIDTH = 6;
    parameter FRACT_WIDTH = 10;
    parameter DATA_WIDTH = INT_WIDTH +FRACT_WIDTH;
    parameter T_CLK = 2.71267;


    reg clk_tb;
    reg rst_tb;

    reg [ DATA_WIDTH - 1 : 0 ]a11_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ]a12_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ]a13_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ]a14_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ]a11_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ]a12_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ]a13_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ]a14_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ]b11_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ]b21_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ]b31_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ]b41_r_tb;
    reg [ DATA_WIDTH - 1 : 0 ]b11_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ]b21_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ]b31_i_tb;
    reg [ DATA_WIDTH - 1 : 0 ]b41_i_tb;

    wire [ ( 2*DATA_WIDTH ) - 1 : 0 ] Out_Element_r_tb;
    wire [ ( 2*DATA_WIDTH ) - 1 : 0 ] Out_Element_i_tb;

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
            a11_r_tb = 'd1;
            a11_i_tb = 'd2;

            a12_r_tb = 'd3;
            a12_i_tb = 'd4;

            a13_r_tb = 'd5;
            a13_i_tb = 'd5;

            a14_r_tb = 'd6;
            a14_i_tb = 'd2;

            b11_r_tb = 'd1;
            b11_i_tb = 'd2;

            b21_r_tb = 'd2;
            b21_i_tb = 'd2;

            b31_r_tb = 'd3;
            b31_i_tb = 'd5;

            b41_r_tb = 'd6;
            b41_i_tb = 'd2;
            
        end
    endtask

    task initialize;
        begin
            clk_tb   = 1'b0;
            rst_tb   = 1'b1;

            a11_r_tb = 'b0;
            a12_r_tb = 'b0;
            a13_r_tb = 'b0;
            a14_r_tb = 'b0;
            a11_i_tb = 'b0;
            a12_i_tb = 'b0;
            a13_i_tb = 'b0;
            a14_i_tb = 'b0;
            b11_r_tb = 'b0;
            b21_r_tb = 'b0;
            b31_r_tb = 'b0;
            b41_r_tb = 'b0;
            b11_i_tb = 'b0;
            b21_i_tb = 'b0;
            b31_i_tb = 'b0;
            b41_i_tb = 'b0;
        end
    endtask

    task reset;
        begin
            rst_tb = 1'b1;
            @(posedge clk_tb);
            rst_tb = 1'b0;
            @(posedge clk_tb);
            rst_tb = 1'b1;
        end
    endtask

    always begin
        #(T_CLK/2.0) clk_tb = ~clk_tb;
    end



Element_Extraction #(
    .INTEGER_SIZE(INT_WIDTH),
    .FRACT_SIZE(FRACT_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
)DUT (
    .clk(clk_tb),
    .rst(rst_tb),
    .a11_r(a11_r_tb),
    .a12_r(a12_r_tb),
    .a13_r(a13_r_tb),
    .a14_r(a14_r_tb),
    .a11_i(a11_i_tb),
    .a12_i(a12_i_tb),
    .a13_i(a13_i_tb),
    .a14_i(a14_i_tb),
    .b11_r(b11_r_tb),
    .b21_r(b21_r_tb),
    .b31_r(b31_r_tb),
    .b41_r(b41_r_tb),
    .b11_i(b11_i_tb),
    .b21_i(b21_i_tb),
    .b31_i(b31_i_tb),
    .b41_i(b41_i_tb),
    .Out_Element_r(Out_Element_r_tb),
    .Out_Element_i(Out_Element_i_tb)
);

endmodule