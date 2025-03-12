% Script: exdt_8_14.m
N = 15;
Omgc = 0.3*pi;  % Cutoff frequency
M = (N-1)/2;    % Center of symmetry
n = [0:N-1];
h1 = Omgc/pi*sinc(Omgc/pi*(n-M)).*hamming(15)'   % w/ Hamming window
h2 = Omgc/pi*sinc(Omgc/pi*(n-M)).*blackman(15)'  % w/ Blackman window
Omg = [-256:255]/256*pi;
H1 = fftshift(fft(h1,512));  % Frequency response (w/ Hamming window)
H2 = fftshift(fft(h2,512));  % Frequency response (w/ Blackman window)
% Graph the two magnitude responses
plot(Omg,abs(H1),'b-',Omg,abs(H2),'m-'); grid;
hold on;
plot([-pi,-0.3*pi,-0.3*pi,0.3*pi,0.3*pi,pi],[0,0,1,1,0,0],'r--');
hold off;
axis([-pi,pi,0,1.2]);
xlabel('\Omega (rad)');
ylabel('Magnitude');
title('|H_{1}(\Omega)| and |H_{2}(\Omega)|');
legend('Hamming','Blackman')