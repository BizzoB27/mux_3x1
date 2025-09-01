module mux_3x1(i0,i1,i2,s0,s1,y);
	input i0,i1,i2,s0,s1;
	output y;
	assign y = s0 ? i1 : (s1 ? i2 : i0); // condition ? true : false   
endmodule

module top;
	reg i0,i1,i2,s0,s1;
	wire y;
	mux_3x1 dut (.i0(i0),.i1(i1),.i2(i2),.s0(s0),.s1(s1),.y(y));
	initial begin
		/*{s0,s1}=$random;
		s1=0; s0=0;
		i0=1; i1=1; i2=0;*/
		repeat (50)begin
			{i0,i1,i2,s0,s1}=$random;
			#5;
			$display("\ti0=%b,i1=%b,i2=%b,s1=%b, s0=%b --> y=%b",i0,i1,i2,s1,s0,y);
		end
	end
endmodule
