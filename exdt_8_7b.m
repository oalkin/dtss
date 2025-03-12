% Script: exdt_8_7b.m
% Design the analog prototype filter using the function butter()
[num,den] = butter(4,0.7146,'s')
% Create a vector of radian frequencies
omg = [0:0.01:3];
% Compute the spectrum for the analog prorotype filter
G = freqs(num,den,omg);
% Obtain H(z) through bilinear transformation
[numz,denz] = bilinear(num,den,1)
% Set a vector of angular frequencies.
Omg = [0:0.01:1]*pi;
% Compute the frequency spectrum for the discrete-time filter
H = freqz(numz,denz,Omg);
% Graph the magnitude responses of the two filters
tiledlayout(2,1);
nexttile;
plot(omg,abs(G)); grid;
axis([0,3,0,1.2]);
title('|G(\omega)|');
xlabel('\omega (rad/s)');
ylabel('Magnitude');
nexttile;
plot([0,Omg1,Omg1],[0,0,10],'r--',...       % Plot markers.
  [0,Omg1,Omg1],[-Rp,-Rp,-30],'r--',...
  [Omg2,Omg2,pi],[10,-As,-As],'r--');
hold on;
plot(Omg,20*log10(abs(H)),'b-');            % Plot the dB magnitude.
hold off;
axis([0,pi,-30,10]);
title('|H(\Omega)|_{dB}');
xlabel('\Omega (rad)');
ylabel('Magnitude (dB)');