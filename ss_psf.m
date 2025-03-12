function y = ss_psf(x,r,buffer)
  y = zeros(size(x));         % Placeholder for output signal
  nSamples = size(x,1);       % Number of samples
  wnm1 = 0;                   % Variable to hold w[n-1]
  for i=1:nSamples
    w = x(i)+r*buffer(end);           % Eqn. (8.214)
    y(i) = 0.5*(w+wnm1);              % Eqn. (8.215)
    buffer = [y(i);buffer(1:end-1)];  % Update buffer
    wnm1 = w;                         % Update w[n-1]; w[n-1] <-- w[n]
  end
end