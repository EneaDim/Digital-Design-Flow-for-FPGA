module register16bit 
(
	clk, rstn, in, out
);

input     clk;
input     rstn;
input  [15:0] in;
logic  [15:0] reg_value;
output [15:0] out;

always @(posedge clk or negedge rstn ) begin
	if (~rstn) begin
		reg_value   <= {16{1'b0}};
	end
	else begin
		reg_value   <= in;
	end
end

assign out = reg_value;

endmodule

