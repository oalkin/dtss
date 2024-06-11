function y = ss_convolve(h,x)
  Nh = length(h);                      % Length of vector 'h'
  Nx = length(x);                      % Length of vector 'x'
  buffer = zeros(Nh,1);                % Create all zero buffer
  y = [];                              % Empty vector for 'y'
  for n = 1:Nx
    buffer = [x(n);buffer(1:end-1)];   % Update buffer with next sample
    out = h*buffer;                    % Compute dot product
    y = [y,out];                       % Append to vector 'y'
  end
  % Flush out the buffer
  for n = 1:Nh-1
    buffer = [0;buffer(1:end-1)];      % Insert zero into buffer
    out = h*buffer;                    % Compute dot product
    y = [y,out];                       % Append to vector 'y'
  end
end