module unsigned_mult (a, b, out);

input  [7:0] a;
input  [7:0] b;
output [15:0] out;


assign out = a * b;

  // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, unsigned_mult);
  end

endmodule

