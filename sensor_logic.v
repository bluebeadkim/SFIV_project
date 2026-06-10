module sensor_logic (
	input 	wire 		clk,
	input	wire	[3:0]	raw_sensor_in,
	output	reg	[3:0]	filtered_data_out
);

	always @(posedge clk) begin
		filtered_data_out <= raw_sensor_in;
	end
endmodule
