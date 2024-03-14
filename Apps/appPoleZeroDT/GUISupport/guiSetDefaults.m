function guiSetDefaults(hObject)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  if verLessThan('matlab','8.4.0')
    uiextras.set(hObject,'DefaultHBoxBackgroundColor',guiBgColor);
    uiextras.set(hObject,'DefaultVBoxBackgroundColor',guiBgColor);
    uiextras.set(hObject,'DefaultUipanelBackgroundColor',guiBgColor);
    uiextras.set(hObject,'DefaultEmptyBackgroundColor',guiBgColor);
    uiextras.set(hObject,'DefaultBoxPanelTitleColor','y');
    uiextras.set(hObject,'DefaultBoxPanelFontSize',16);
  end;  