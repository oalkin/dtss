% Script: mexdt_8_5c.m
load noisyECG.mat
fs = 360;                           % Sampling rate used in ECG data
Xk = fft(x);                        % Compute FFT
magdB = 20*log(abs(fftshift(Xk)));  % dB magnitude spectrum
frq = [0:3599]/3600*fs-fs/2;        % Frequencies in Hz (from -fs/2 to fs/2)
plot(frq,magdB); grid               % Graph dB magnitude
axis([-180,180,-100,200]);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');