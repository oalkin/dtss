% Script: mexdt_4_8.m
fs = 200;     % Sampling rate
Ts = 1/fs;    % Sampling interval
f = [-700:0.5:700];     % Vector of frequencies
Xa = 1./(100+j*2*pi*f); % Original spectrum
% Compute the spectrum of the impulse-sampled signal.
Xs = 1./(1-exp(-100*Ts)*exp(-j*2*pi*f*Ts));
% Compute system functions of reconstruction filters.
Hzoh = Ts*sinc(f*Ts).*exp(-j*pi*Ts);  % Eqn. (4.48)
Hfoh = Ts*sinc(f*Ts).*sinc(f*Ts);     % Eqn. (4.50)
Hr = Ts*((f>=-0.5*fs)&(f<=0.5*fs));   % Eqn. (4.52)
% Compute spectra of reconstructed signals.
Xzoh = Xs.*Hzoh;  % Eqn. (4.49)
Xfoh = Xs.*Hfoh;  % Eqn. (4.51)
Xr = Xs.*Hr;      % Eqn. (4.53)
% Graph the results.
tiledlayout(3,1);
nexttile;
plot(f,abs(Xzoh),'-',f,abs(Xa),'--'); grid;
title('Spectr. of signal reconstr. through zero-order hold');
xlabel('f (Hz)');
ylabel('Magnitude');
legend('|X_{zoh}(f)|','|X(f)|');
nexttile;
plot(f,abs(Xfoh),'-',f,abs(Xa),'--'); grid;
title('Spectr. of signal reconstr. through first-order hold');
xlabel('f (Hz)');
ylabel('Magnitude');
legend('|X_{foh}(f)|','|X(f)|');
nexttile;
plot(f,abs(Xr),'-',f,abs(Xa),'--'); grid;
title('Spectr. of signal reconstr. through bandlimited interp.');
xlabel('f (Hz)');
ylabel('Magnitude');
legend('|X_{r}(f)|','|X(f)|');