module register8bit 
(
	clk, rstn, in, out
);

input     clk;
input     rstn;
input  [7:0] in;
logic  [7:0] reg_value;
output [7:0] out;

always @(posedge clk or negedge rstn ) begin
	if (~rstn) begin
		reg_value   <= {8{1'b0}};
	end
	else begin
		reg_value   <= in;
	end
end

assign out = reg_value;

endmodule
