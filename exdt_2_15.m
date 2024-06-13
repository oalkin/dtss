% Script: exdt_2_15.m
A = 20;         % Amplitude of sinusoidal input signal
Omg = 0.2*pi;   % Radian frequency of sinusoidal input signal
alpha = 0.1;    % alpha for the exponential smoother
beta = 1-alpha;
% Compute coefficients k1 and k2 using Eqn. (2.74)
k1 = alpha*A*(1-beta*cos(Omg))/(1-2*beta*cos(Omg)+beta*beta)
k2 = alpha*A*beta*sin(Omg)/(1-2*beta*cos(Omg)+beta*beta)
n = [0:49];     % Vector of indices
% Compute the transient response, the steady-state response and
% the forced response
yt = 2.7129*(0.9.^n);                % Eqn. (2.77)
yss = k1*cos(Omg*n)+k2*sin(Omg*n);   % Eqn. (2.78)
y = yt+yss;                            
% Graph the results.
tiledlayout(3,1);
nexttile;
stem(n,yt); grid;
axis([-0.5,49.5,-4,6]);
title('Transient response y_{t}[n]');
xlabel('Index n');
ylabel('Amplitude');
nexttile;
stem(n,yss); grid;
axis([-0.5,49.5,-4,6]);
title('Steady-state response y_{ss}[n]');
xlabel('Index n');
ylabel('Amplitude');
nexttile;
stem(n,y); grid;
axis([-0.5,49.5,-4,6]);
title('Forced response y[n] = y_{t}[n]+y_{ss}[n]');
xlabel('Index n');
ylabel('Amplitude');