% Script: mexdt_2_5a.m
xvec = [0,100*ones(1,18)];   % Vector to hold input signal
yvec = [10000,zeros(1,18)];  % Vector to hold output signal
c = 0.005;                   % Interest rate
offset = 1;                  % Offset to fix index issues
% Start the loop to compute the output signal
for n=1:18
  yvec(offset+n)=(1+c)*yvec(offset+n-1)-xvec(offset+n);  % Eqn. (2.12)
end;  
% Display the output signal
tmp = [[0:18]',yvec'];
disp(tmp);