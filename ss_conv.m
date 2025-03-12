function [y,n] = ss_conv(h,x,Nh,Nx)
  y = conv(h,x);        % Compute the convolution
  Ny = length(y);       % Number of samples in y[n]
  nFirst = Nh+Nx;       % Correct index for the first sample in y[n]
  nLast = nFirst+Ny-1;  % Correct index for the last sample in y[n]
  n = [nFirst:nLast];   % Vector of corrected indices
end