% Script: exdt_8_13.m
N = 15;
Omgc = 0.3*pi;  % Cutoff frequency
M = (N-1)/2;    % Center of symmetry
n = [0:N-1];
h = Omgc/pi*sinc(Omgc/pi*(n-M))  % Impulse response
Omg = [-256:255]/256*pi;
H = fftshift(fft(h,512));        % Frequency response
% Graph the impulse response h[n] and the magnitude of the 
% frequency response
tiledlayout(2,1);
nexttile;
stem(n,h); grid;
title('h[n]');
xlabel('Sample index n');
ylabel('Amplitude');
nexttile;
plot(Omg,abs(H)); grid;
hold on;
plot([-pi,-0.3*pi,-0.3*pi,0.3*pi,0.3*pi,pi],[0,0,1,1,0,0],'r--');
hold off;
axis([-pi,pi,0,1.2]);
xlabel('\Omega (rad)');
ylabel('Magnitude');
title('|H(\Omega)|');