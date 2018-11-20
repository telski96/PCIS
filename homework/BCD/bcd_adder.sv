`timescale 10ns / 1ns

module bcd_adder(
	input [3:0] a,b,
	input cin,
	output logic [3:0] s,
	output logic cout
	);

	// TODO
	
endmodule

module bcd_adder_test;
	logic [3:0] a, b;
	logic cin;
	logic [3:0] s;
	logic cout;

	bcd_adder uut(.*);

	task test_vector (
		input [3:0] a_test, b_test,
		input cin_test,
		input cout_expected,
		input [3:0] s_expected);

		a = a_test;
		b = b_test;
		cin = cin_test;

		#10 assert ((s_expected == s) && (cout_expected == cout))
		else $warning("%0d + %0d + %0d expected %0d%0d but was %0d%0d",a_test, b_test, cin_test, cout_expected, s_expected,cout,s);
	endtask

	initial begin
		test_vector(0,0,0,0,0);
		test_vector(0,0,1,0,1);
		test_vector(0,1,0,0,1);
		test_vector(1,0,0,0,1);

		test_vector(1,1,0,0,2);
		test_vector(2,2,0,0,4);
		test_vector(2,3,0,0,5);
		test_vector(3,2,0,0,5);

		test_vector(1,1,1,0,3);
		test_vector(2,2,1,0,5);
		test_vector(2,3,1,0,6);
		test_vector(3,2,1,0,6);

		test_vector(5,5,0,1,0);
		test_vector(5,5,1,1,1);

		test_vector(7,8,0,1,5);
		test_vector(8,7,1,1,6);

		test_vector(9,9,0,1,8);
		test_vector(9,9,1,1,9);
		$finish; 
	end

	initial $monitor("%0d + %0d + %0d = %0d%0d",a, b, cin, cout, s);
endmodule