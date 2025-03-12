% Script: mexdt_8_16b.m
Yk = abs(fftshift(fft(y)));  % Magnitude response
F = [-11025:11024];           % Vector of frequencies in Hz
plot(F,Yk); grid;             % Graph the magnitude response
axis([0,1000,0,100]);
xlabel('Frequency (Hz)');
ylabel('Magnitude');