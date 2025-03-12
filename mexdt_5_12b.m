% Script: mexdt_5_12b.m
states1 = [0,0];                 % Initialize r1 and r2 for stage 1
states2 = [0,0];                 % Initialize r1 and r2 for stage 2
coeffs1 = [0,3.474,6.812,1,0.6,-0.27];    % Coefficients for stage 1
coeffs2 = [0,-2.474,0.2314,1,-1.6,0.89];  % Coefficients for stage 2
x = ones(1,100);
y = zeros(1,100);
for n=1:100
  inp = x(n);
  [w1,states1] = ss_iir2(inp,coeffs1,states1);
  [w2,states2] = ss_iir2(inp,coeffs2,states2);
  y(n) = w1+w2;
end
stem([0:99],y);