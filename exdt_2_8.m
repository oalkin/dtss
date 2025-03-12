% Script: exdt_2_8.m
r = 2.9;                  % Set the parameter 'r'
ynm1 = 0.2;               % Set initial population to y[-1]=0.2
% Iterate through the difference equation
y = [];
for n=0:29
  yn = r*(1-ynm1)*ynm1;   % Eqn. (2.14)
  ynm1 = yn;
  y = [y,yn];             % Append new sample to the vector
end
% Graph y[n] for n=0,...,29
stem([0:29],y); grid;
xlabel('Sample index n');
ylabel('Population');