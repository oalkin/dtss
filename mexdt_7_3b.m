% Script: mexdt_7_3b.m
xn = ones(1,10);        % Length-10 pulse signal
Xk = fft(xn,20);        % X[k] = DFT of x[n] zero padded to 20
% Create a vector for angular frequencies, and compute the DTFT
Omg = [-0.1:0.01:1.1]*2*pi+eps;
XDTFT = sin(5*Omg)./sin(0.5*Omg).*exp(-j*4.5*Omg);  % Eqn. (7.12)
% Compute frequencies that correspond to DFT samples
k = [0:19];
Omg_k = 2*pi*k/20;
% Graph the DTFT and the DFT on the same coordinate system
tiledlayout(2,1);
nexttile;    % Graph magnitudes
plot(Omg,abs(XDTFT),'-',Omg_k,abs(Xk),'ro'); grid;  
axis([-0.2*pi,2.2*pi,-1,11]);
xlabel('Omega (rad)');
ylabel('Magnitude')
nexttile;    % Graph phases
plot(Omg,angle(XDTFT),'-',Omg_k,angle(Xk),'ro'); grid;
axis([-0.2*pi,2.2*pi,-pi,pi]);
xlabel('Omega (rad)');
ylabel('Phase (rad)');