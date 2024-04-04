function h = ss_fir2(N,F,A)
  F = [F,1-F(end-1:-1:1)];  % Mirror the set of frequencies
  A = [A,A(end-1:-1:1)];    % Mirror the amplitudes
  k = [0:N-1];              % Vector of transform indices
  Fk = k/N;                 % Frequencies used in sampling the ideal spectrum
  Ak = interp1(F,A,Fk);     % Samples of amplitude response
  M = (N-1)/2;              % Axis of symmetry
  h = ifft(Ak.*exp(-j*2*pi*Fk*M));  % Inverse FFT to get h[n]
end