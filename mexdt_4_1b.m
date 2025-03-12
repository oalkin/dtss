% Script: mexdt_4_1b.m
Xa = @(f) 2./(1+4*pi*pi*f.*f);    % Original spectrum
f = [-3:0.01:3];
fs = 2;        % Sampling rate
Ts = 1/fs;     % Sampling interval
% Approximate spectrum of impulse-sampled signal
Xs = zeros(size(Xa(f)));
for k=-5:5
  Xs = Xs+fs*Xa(f-k*fs);  % Eqn. (4.12)
end
tiledlayout(2,1);
nexttile;      % Graph the original spectrum
plot(f,Xa(f)); grid;
axis([-3,3,-0.5,4.5]);
title('X_{a}(f)');
nexttile;      % Graph spectrum of impulse-sampled signal
plot(f,Xs); grid;
axis([-3,3,-0.5,4.5]);
hold on;
for k=-5:5
  tmp = plot(f,fs*Xa(f-k*fs),'r--');
end
hold off;
title('X_{s}(f)');
xlabel('f (Hz)');