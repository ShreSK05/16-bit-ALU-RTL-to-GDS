

`timescale 1ns / 1ps

module alu(
    input  [15:0] A,
    input  [15:0] B,
    input  [3:0]  Sel,
    output reg [15:0] Out,
    output reg  e_bit,
    output reg  overflow
);

    wire [16:0] sum;
    assign sum = {1'b0, A} + {1'b0, B};

    wire [16:0] diff;
    assign diff = {1'b0, A} - {1'b0, B};

    always @(*) begin
        Out      = 16'd0;
        e_bit    = 1'b0;
        overflow = 1'b0;

        case (Sel)
            4'b0000: begin
                Out   = sum[15:0];
                e_bit = sum[16];
                if ((A[15] == 0 && B[15] == 0 && Out[15] == 1) ||
                    (A[15] == 1 && B[15] == 1 && Out[15] == 0))
                    overflow = 1;
            end

            4'b0001: begin
                Out   = diff[15:0];
                e_bit = diff[16];
                if ((A[15] == 1 && B[15] == 0 && Out[15] == 0) ||
                    (A[15] == 0 && B[15] == 1 && Out[15] == 1))
                    overflow = 1;
            end

            4'b0010: begin
                {e_bit, Out} = A * B;
                overflow = 0;
            end

            4'b0011: begin
                if (B != 0)
                    Out = A / B;
                else
                    Out = 16'd0;
                e_bit = 0;
                overflow = 0;
            end

            4'b0100: begin
                Out   = A << 1;
                e_bit = A[15];
                overflow = 0;
            end

            4'b0101: begin
                Out   = A >> 1;
                e_bit = A[0];
                overflow = 0;
            end

            4'b0110: begin
                Out = {A[14:0], A[15]};
                e_bit = 0;
                overflow = 0;
            end

            4'b0111: begin
                Out = {A[0], A[15:1]};
                e_bit = 0;
                overflow = 0;
            end

            4'b1000: begin
                Out = A & B;
                e_bit = 0;
                overflow = 0;
            end

            4'b1001: begin
                Out = A | B;
                e_bit = 0;
                overflow = 0;
            end

            4'b1010: begin
                Out = ~(A & B);
                e_bit = 0;
                overflow = 0;
            end

            4'b1011: begin
                Out = ~(A | B);
                e_bit = 0;
                overflow = 0;
            end

            4'b1100: begin
                Out = A ^ B;
                e_bit = 0;
                overflow = 0;
            end

            4'b1101: begin
                Out = ~(A ^ B);
                e_bit = 0;
                overflow = 0;
            end

            4'b1110: begin
                Out = (A > B) ? 16'd1 : 16'd0;
                e_bit = 0;
                overflow = 0;
            end

            4'b1111: begin
                Out = ~A + 16'd1;
                e_bit = 0;
                overflow = 0;
            end

            default: begin
                Out = 16'd0;
                e_bit = 0;
                overflow = 0;
            end
        endcase
    end

endmodule

