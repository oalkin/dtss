% Script: mexdt_2_7.m
a = [1,-0.7,-0.8,0.84];    % Feedback coefficients
b = [0.1,0.2,0.3];         % Feed-forward coefficients
y_init = [0.5,0.3,-0.4];   % y[-1], y[-2], and y[-3]
x_init = [0,0,0];          % x[-1], x[-2], and x[-3]
xstream = ones(1,50);      % Unit step input signal
zi = filtic(b,a,y_init,x_init);    % Convert initial conditions
ystream = filter(b,a,xstream,zi);  % Compute the output signal
% Graph the output signal.
stem([0:49],ystream);
title('The output signal');
xlabel('Index n');
ylabel('y[n]');