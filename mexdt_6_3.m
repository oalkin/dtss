% Script: mexdt_6_3.m
A = [-2,-2;1,-5];
B = [1;0];
C = [0,5];
d = 0;
Ts = 0.1;
A_bar = eye(2)+A*Ts;
B_bar = B*Ts;
C_bar = C;
d_bar = d;
xn = [3;-2];       % Initial value of state vector
n = [0:30];        % Vector of indices
yn = [];           % Empty vector to start
for nn=0:30,
  xnp1 = A_bar*xn+B_bar;  % 'xnp1' represents x[n+1]
  yn = [yn,C*xn];         % Append to vector 'yn'
  xn = xnp1;              % New becomes old for next iteration
end;
% Graph correct vs. approximate solution
t = [0:0.01:3];
ya = 5/12+70/3*exp(-3*t)-135/4*exp(-4*t);  % Eqn. (6.69)
plot(t,ya,'b-',n*Ts,yn,'ro'); grid;
title('y_{a}(t) and y[n]');
xlabel('t (sec)');