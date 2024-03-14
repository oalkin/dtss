function [mag,phs] = guiFreqz(zrs,pls,gain,Omega)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  nz = length(zrs);        % Number of zeros.
  np = length(pls);        % Number of poles.
  nOmg = length(Omega);    % Number of frequency points.
  z = exp(j*Omega);        % Get points on the unit-circle.
  mag = ones(1,nOmg);
  phs = zeros(1,nOmg);
  if (nz > 0),
    for n = 1:nz
      mag = mag.*abs(z-zrs(n));
      phs = phs+angle(z-zrs(n));
    end;  
  end;  
  if (np > 0),
    for n = 1:np
      tmp = abs(z-pls(n));
      tmp = tmp+(tmp<eps)*eps;
      mag = mag./tmp;
      phs = phs-angle(z-pls(n));
    end;  
  end;   
  mag = mag*gain;
  phs = guiWrapToPi(phs);  