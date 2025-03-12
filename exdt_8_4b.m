% Script: exdt_8_4b.m
% Set vectors numerator and denominator polynomials
num = [0.625];
den = [1,1.1542,1.4161,0.625];
% Obtain the discrete-time filter using the function impinvar()
[numz,denz] = impinvar(num,den,5)
% Compute and compare magnitude responses of the analog and
% discrete-time filters
[Ha,Wa] = freqs(num,den,512);
[Hz,Wz] = freqz(numz,denz,512,5);
plot(Wa/(2*pi),abs(Ha));
hold on;
plot(Wz,abs(Hz),'r--');
hold off;
axis([0,2.5,0,1.2]);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Magnitude Response Comparison');
legend('Analog Filter','Discrete-time Filter');