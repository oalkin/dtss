function handle = guiTextC(hObject,title,fontsize)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  %hBox = guiVBox(hObject);
  handle = uicontrol('Parent',hObject,'Style','text',...
    'String',title,'HorizontalAlignment','center',...
    'BackgroundColor',guiBgColor,'FontSize',fontsize);
  %set(handle,'Units','pixels');
  %tmpPos = get(handle,'Position');
  %tmpPos(4) = height;
  %set(handle,'Position',tmpPos);
  %guiEmpty(hBox);
  %set(hBox,'Sizes',[tmpPos(4),-1]);
end  