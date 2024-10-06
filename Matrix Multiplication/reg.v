// File : register.v
// Author : Mohamed Ayman
// Date : 4/5/2024
// Version : 1
// Abstract : This file is just for registering an input

module register #(
    parameter DATA_WIDTH = 18
) (
    input wire clk,
    input wire rst,
    input wire [ DATA_WIDTH - 1 : 0 ] in,
    output reg [ DATA_WIDTH - 1 : 0 ] out
);
    
    always @(posedge clk or negedge rst) begin
        if(!rst)begin
            out <= 0;
        end
        else begin
            out <= in;
        end
    end
endmodule