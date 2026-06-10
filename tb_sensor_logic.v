`timescale 1ns/1ps

module tb_sensor_logic;
	
	reg		clk;
	reg	[3:0]	raw_sensor_in;
	wire	[3:0]	filtered_data_out;

	sensor_logic	u_dut (
			.clk(clk),
			.raw_sensor_in(raw_sensor_in),
			.filtered_data_out(filtered_data_out)
			);
	always #10 clk = ~clk; 
	
	initial begin
		clk = 0;
		raw_sensor_in = 4'b1111;

		$dumpfile("pipeline_test.vcd");
		$dumpvars(0, tb_sensor_logic);
		
		// [Scenario 1] normal state
		#50;
		
		//[Scenario 2] Inject Stuck-at-0 fault
		$display("[FAULT INJECTION] Forcing filtered_data_out[0] to 0 at %t", $time);
		force u_dut.filtered_data_out[0] = 1'b0;
		#50;
		
		//[Scenario 3] Release the fault and recovery at 100ns
		$display("[FAULT RELEASE] Releasing filtered_data_out[0] at %t", $time);
		release  u_dut.filtered_data_out[0];
		#50;
		$finish;
	end
endmodule
