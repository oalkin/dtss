% Script: mexdt_4_5.m
Xa = @(f) 2./(1+4*pi*pi*f.*f);
f = [-12:0.01:12];
fs = 3;       % Sampling rate
Ts = 1/fs;    % Sampling interval
d = 0.3;      % Duty cycle
Xs = zeros(size(Xa(f)));
for k=-5:5,
  Xs = Xs+fs*Xa(f-k*fs);
end;
Xs = d*Ts*sinc(f*d*Ts).*exp(-j*pi*f*d*Ts).*Xs;  % Eqn. (4.43)
plot(f,abs(Xs)); grid;
axis([-12,12,-0.1,0.7]);
title('|X_{s}(f)|');
xlabel('f (Hz)');