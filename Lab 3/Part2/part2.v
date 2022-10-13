module part2(a, b, cin, s, cout);
	input a[3:0];
	input b[3:0];
	input cin;
	output s[3:0];
	output cout;
	
	wire c1, c2, c3;
	c1 = a[0] + b[0] + cin;
	c2 = a[1] + b[1];
	c3 = a[2] + b[2];
	c4 = a[3] + b[3];

	if(w0 > 1) begin
		s[0] =  

	