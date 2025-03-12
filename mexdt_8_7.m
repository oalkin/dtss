% Script: mexdt_8_7.m
T = 1;
Rp = 2;                    % dB passband ripple
As = 20;                   % dB stopband attenuation
omg1 = 2/T*tan(0.2*pi/2);  % Prewarp critical frequencies
omg2 = 2/T*tan(0.36*pi/2); 
[N,omgc] = buttord(omg1,omg2,Rp,As,'s')  % Compute parameters
[num,den] = butter(N,omgc,'s')           % Design analog filter

tiledlayout(2,2);
nexttile;
omg = [0:0.001:6];
G = freqs(num,den,omg);    % Analog prototype
plot(omg,abs(G)); grid;
xlabel('\omega (rad/s)');
ylabel('Magnitude');
title('|G(\omega)|');
nexttile;
plot(omg,angle(G)); grid;
xlabel('\omega (rad/s)');
ylabel('Phase (rad)');
title('\angle G(\omega)');
nexttile;
[numz,denz] = bilinear(num,den,1/T)      % Bilinear transformation
Omg = [0:0.01:1]*pi;
H = freqz(numz,denz,Omg);  % Discrete-time filter
plot(Omg,abs(H)); grid;
xlabel('\Omega (rad)');
ylabel('Magnitude');
title('|H(\omega)|');
nexttile;
plot(Omg,angle(H)); grid;
xlabel('\Omega (rad)');
ylabel('Phase (rad)');
title('\angle H(\Omega)');