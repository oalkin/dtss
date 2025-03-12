% Script: mexdt_3_5.m
n = [-10:30];
ytilde = 9.9305*cos(pi*n/5-0.3139);    % Steady-state response found in 
                                       %   Example (3.29)
x = 5*cos(pi*n/5).*(n>=0);             % Right-sided input signal
y = filter([1,-0.2],[1,-0.9,0.36],x);  % Solve the difference equation 
p1 = stem(n-0.125,ytilde,'b');         % Graph steady-state response
hold on                                
p2 = stem(n+0.125,y,'r');              % Graph solution of the diff. eqn.
hold off
axis([-11,31,-12,12]);
xlabel('n');