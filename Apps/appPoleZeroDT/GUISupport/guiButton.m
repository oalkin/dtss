function handle = guiButton(hObject,hCallback,title,tooltip)
% This function is for internal use by the interactive demo 
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2012 by Oktay Alkin.
% All rights reserved.
%
  str = sprintf('Click to %s.',tooltip);
  handle = uicontrol('Parent',hObject,'Style','pushbutton',...
    'String',title,'TooltipString',str,'BackgroundColor',guiBgColor);
  set(handle,'Callback',{hCallback});