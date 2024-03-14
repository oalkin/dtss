function [pts] = guiDrawPulseTrain(d,tper,t0,t1,t2)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  pts = guiInitPulseTrain(d,t1/tper,t2/tper);
  pts(1,:) = tper*pts(1,:);
  pts(1,:) = pts(1,:)+t0;
end  