% Script: mexdt_8_4.m
[x,fs] = audioread('GuitarA2.flac');
f0 = 220;                 % Analog center frequency
fb = 100;                 % Analog bandwidth
Omg0 = 2*pi*f0/fs;        % Angular center frequency
Omgb = 2*pi*fb/fs;        % Angular bandwidth
[r,gain,zrs,pls] = ss_notchpar(Omg0,Omgb);   % Compute parameters
y = zeros(size(x));       % Create an all-zero vector for the output
nSamp = length(x);        % Number of samples
buffer = zeros(2,1);      % Holds w[n-1] and w[n-2]
y = ss_notchf(x,Omg0,r,gain,buffer);  % Apply notch filter
Yk = fft(y);                          % Compute FFT
nFFT = length(Yk);
mag = abs(fftshift(Yk));              % Magnitude of FFT
frq = ([0:nFFT-1]'/nFFT-0.5)*fs;      % Frequency vector in Hz
plot(frq,mag/fs);         % Graph magnitude spectrum of the output
xlabel('Frequency (Hz)');
ylabel('Magnitude');