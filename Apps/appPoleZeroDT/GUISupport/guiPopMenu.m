function handle = guiPopMenu(hObject,hCallback,title,tooltip,...
     items,value,padding)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  hVBox = guiVBox(hObject);
  guiEmpty(hVBox);
  hTxt = uicontrol('Parent',hVBox,'Style','text',...
    'String',title,'FontSize',10,'HorizontalAlignment','left',...
    'BackgroundColor',guiBgColor);
  guiEmpty(hVBox);
  str = sprintf('Select the %s from the list.',tooltip);
  hPop = uicontrol('Parent',hVBox,'Style','popupmenu',...
    'String',items,'FontSize',10,'TooltipString',str,...
    'Backgroundcolor',[1,1,1]);
  guiEmpty(hVBox);
  set(hVBox,'Sizes',[-1,22,padding,25,-1]);
  value = round(value);
  set(hPop,'Value',value);
  handle = {hPop,hTxt,value,tooltip};
  set(hPop,'Callback',{hCallback});
end  