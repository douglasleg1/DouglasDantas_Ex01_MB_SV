module count_2 (input logic clk, reset, output logic [3:0] out);
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
			up_down <= 1'b1;
		else
			out <= out + 4'd1;
	else
		if(out == 4'd0)
			up_down <= 1'b0;
		else
			out <= out - 4'd1;
end
endmodule