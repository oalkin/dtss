% Script: mexdt_7_14.m
N = 128;                % Number of samples in the signal
k = 47;                 % DFT sample needed
x = randn(1,N);         % Create a random signal
X = fft(x);             %Compute the FFT
disp('DFT result')
X(k+1)                  % Display X[k]  (Remember MATLAB indices start with 1)
WN = exp(-j*2*pi/N);
hk = WN.^(-k*[0:N]);    % Impulse response for Goertzel system
yk = conv(x,hk);        % Convolve x[n] and hk[n], Eqn. (7.85)
disp('Convolution result')
yk(N+1)                 % Display yk[N]  (Remember MATLAB indices start with 1) 
disp('Use ss_goertzel1()')
Xk = ss_goertzel1(x,k) 
disp('Use ss_goertzel2()')
Xk = ss_goertzel2(x,k)