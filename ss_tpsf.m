function y = ss_tpsf(x,a,r,buffer)
  y = zeros(size(x));         % Placeholder for output signal
  nSamples = size(x,1);       % Number of samples
  wnm1 = 0;                   % Variable to hold w[n-1]
  vnm1 = 0;                   % Variable to hold v[n-1]
  for i=1:nSamples
    w = x(i)+r*buffer(end);           % Eqn. (/*\matexfileeqn{\ref{eq:mex1017s}}*/)
    v = 0.5*w+0.5*wnm1-a*vnm1;        % Eqn. (/*\matexfileeqn{\ref{eq:mex1017t}}*/)
    y(i) = a*v+vnm1;                  % Eqn. (/*\matexfileeqn{\ref{eq:mex1017u}}*/)
    buffer = [y(i);buffer(1:end-1)];  % Update buffer
    wnm1 = w;                         % Update w[n-1]:  w[n-1] <-- w[n]
    vnm1 = v;                         % Update v[n-1]:  v[n-1] <-- v[n]
  end
end