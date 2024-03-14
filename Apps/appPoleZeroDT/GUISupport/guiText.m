function handle = guiText(hObject,title)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  handle = uicontrol('Parent',hObject,'Style','text','String',title,...
    'HorizontalAlignment','left','BackgroundColor',guiBgColor);
end