module unsigned_mult 
(
	clk, rstn, a, b, out
);

input     clk;
input     rstn;
input  [7:0] a;
input  [7:0] b;
output [15:0] out;

logic  [7:0] a_reg;
logic  [7:0] b_reg;
logic  [15:0] mul_val;
logic  [15:0] out_reg;

// INPUT REGS 
register8bit regA (.clk(clk), .rstn(rstn), .in(a), .out(a_reg));

register8bit regB (.clk(clk), .rstn(rstn), .in(b), .out(b_reg));

// CORE
assign mul_val  = a_reg * b_reg;

// OUTPUT REG 
register16bit regOut (.clk(clk), .rstn(rstn), .in(mul_val), .out(out_reg));

assign out = out_reg;

  // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, unsigned_mult);
  end

endmodule
