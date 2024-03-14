function handle = guiTextHL(hObject,title,link,fontsize)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  labelStr = ['<html><center><a href="',link,'">',title];
  cbStr = ['web(''',link,''',''-browser'')'];
  handle = uicontrol('Parent',hObject,'String',labelStr,...
    'Callback',cbStr,'FontSize',fontsize);
  % jButton = findjobj(handle);
  % jButton.setCursor(java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
  % jButton.setContentAreaFilled(0);
end  