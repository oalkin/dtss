% Script: exdt_8_12.m
T = 1/500;  % Sampling interval
n = [0:149];
yhat = 62.5738*sin(2*pi*10*n*T+1.4137);  % Steady-state output of differentiator
y = 62.8319*cos(2*pi*10*n*T);            % Actual derivative of x(t)
plot(n*T,y,n*T,yhat); grid;
axis([0,0.275,-70,70]);
xlabel('Time (sec)');
ylabel('Amplitude');
legend('Actual derivative', 'Differentiator output');