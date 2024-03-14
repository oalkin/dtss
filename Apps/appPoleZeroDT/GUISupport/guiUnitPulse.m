function x = guiUnitPulse(t)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  x = guiUnitStep(t+0.5)-guiUnitStep(t-0.5);
end