% Script: mexdt_8_11.m
wn = bartlett(25);
hn = fir1(24,[0.4,0.7],wn)
Omg = [-256:255]/256*pi;
H = fftshift(fft(hn,512));
Omgd = [-1,-0.7,-0.7,-0.4,-0.4,0.4,0.4,0.7,0.7,1]*pi;
Hd = [0,0,1,1,0,0,1,1,0,0];
plot(Omg,abs(H),Omgd,Hd); grid;
axis([-pi,pi,-0.1,1.1]);
title('|H(\Omega)|');
xlabel('\Omega (rad)');
ylabel('Magnitude');