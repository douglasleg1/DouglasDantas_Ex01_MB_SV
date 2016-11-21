module count_1 (input logic clk, reset, output logic [3:0] out);
logic up_down;
always_ff @(posedge clk)
begin
if (reset)
	begin
	out <= 4'd0 ;
	up_down <= 1'b1;
	end
else
	if(up_down == 1'b0)
		if(out == 4'd15)
			begin
			up_down <= 1'b1;
			out <= out - 4'd1;
			end
		else
			out <= out + 4'd1;
	else
		if(out == 4'd0)
			begin
			up_down <= 1'b0;
			out = out + 4'd1;
			end
		else
			out <= out - 4'd1;
end
endmodule