function [pts] = guiInitPulseTrain(d,t1,t2)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2012 by Oktay Alkin.
% All rights reserved.
%
  t1new = floor(t1);
  t2new = ceil(t2);
  x = [];
  y = [];
  for i=t1new:t2new,
    x = [x,[i,i,i+d,i+d]];  
    y = [y,[0,1,1,0]];
  end;
  pts=[x;y];