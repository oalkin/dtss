function hTitle = guiSetTitle(hObject,title)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  hTitle = uicontrol('Parent',hObject,'Style','text',...
    'String',title,'FontSize',guiFontSize,'FontWeight','bold',...
    'FontUnits','points','BackgroundColor',guiBgColor);
end  