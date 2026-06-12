`include "alu.v"

module alu_tb(

    );
     reg  [15:0] A, B;
    reg  [3:0]  Sel;
    wire [15:0] Out;
    wire  e_bit;
    wire overflow;

    alu uut (
        .A(A),
        .B(B),
        .Sel(Sel),
        .Out(Out),
        .e_bit(e_bit),
        .overflow(overflow)
    );

    initial begin
        $monitor("Time=%0t | Sel=%b | A=%h | B=%h | Out=%h | Carry=%b | Overflow=%b", 
                 $time, Sel, A, B, Out, e_bit, overflow);

        A = 16'd7; B = 16'd9; Sel = 4'b0000; #20;
        A = 16'h7FFF; B = 16'd1; Sel = 4'b0000; #20;
        A = 16'd10; B = 16'd5; Sel = 4'b0001; #20;
        A = 16'h8000; B = 16'd1; Sel = 4'b0001; #20;
        A = 16'd20; B = 16'd3; Sel = 4'b0010; #20;
        A = 16'd100; B = 16'd4; Sel = 4'b0011; #20;
        A = 16'd8; B = 16'd0; Sel = 4'b0100; #20;
        A = 16'd16; B = 16'd0; Sel = 4'b0101; #20;
        A = 16'h8001; B = 16'd0; Sel = 4'b0110; #20;
        A = 16'h8001; B = 16'd0; Sel = 4'b0111; #20;
        A = 16'hF0F0; B = 16'h0FF0; Sel = 4'b1000; #20;
        A = 16'hF0F0; B = 16'h0FF0; Sel = 4'b1001; #20;
        A = 16'hFFFF; B = 16'h0000; Sel = 4'b1010; #20;
        A = 16'h000F; B = 16'h00F0; Sel = 4'b1011; #20;
        A = 16'hAAAA; B = 16'h5555; Sel = 4'b1100; #20;
        A = 16'hAAAA; B = 16'h5555; Sel = 4'b1101; #20;
        A = 16'd10; B = 16'd5; Sel = 4'b1110; #20;
        A = 16'd10; B = 16'd0; Sel = 4'b1111; #20;
      $finish;
    end
    
endmodule
