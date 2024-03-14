function [mag,phs] = guiFreqs(zrs,pls,gain,omega)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  nz = length(zrs);       % Number of zeros.
  np = length(pls);       % Number of poles.
  nomg = length(omega);   % Number of frequency points.
  s = j*omega;            % Get points on the imaginary axis.
  mag = ones(1,nomg);
  phs = zeros(1,nomg);
  if (nz > 0),
    for n = 1:nz
      mag = mag.*abs(s-zrs(n));
      phs = phs+angle(s-zrs(n));
    end;  
  end;  
  if (np > 0),
    for n = 1:np
      tmp = abs(s-pls(n));
      tmp = tmp+(tmp<eps)*eps;
      mag = mag./tmp;
      phs = phs-angle(s-pls(n));
    end;  
  end;   
  mag = mag*gain;
  phs = guiWrapToPi(phs);