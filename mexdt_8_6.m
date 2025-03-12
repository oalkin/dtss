% Script: mexdt_8_6.m
T = 0.2;
num = [0.6250];                  % Numerator of G(s)
den = [1,1.1542,1.4161,0.6250];  % Denominator of G(s)
[numz,denz] = impinvar(num,den,1/T)
Omg = [0:0.001:1]*pi;
H = freqz(numz,denz,Omg);
tiledlayout(2,1);
nexttile;
plot(Omg,abs(H)); grid;
xlabel('\Omega (rad)');
ylabel('Magnitude');
nexttile;
plot(Omg,angle(H)); grid;
xlabel('\Omega (rad)');
ylabel('Phase (rad)');