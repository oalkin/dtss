function handle = guiPanel(hObject)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2012 by Oktay Alkin.
% All rights reserved.
%
  handle = uipanel('Parent',hObject,...
    'BorderType','none','BackgroundColor',guiBgColor,...
    'Units','normalized');