function handle = guiVBox(hObject)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2012 by Oktay Alkin.
% All rights reserved.
%
  handle = uiextras.VBox('Parent',hObject,...
    'BackgroundColor',guiBgColor,'Padding',1);