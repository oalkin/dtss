function handle = guiIndex(hObject,hCallback,title,tooltip,...
     value,minVal,maxVal,padding)
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
  hHBox = guiHBox(hVBox);
  str = sprintf('Click to decrement %s.',tooltip);
  hBtnL = uicontrol('Parent',hHBox,'Style','pushbutton',...
    'String','<','TooltipString',str,...
    'BusyAction','cancel','Interruptible','off');
  str = sprintf('Enter the value of %s here.',tooltip);
  hEdt = uicontrol('Parent',hHBox,'BackgroundColor',[1,1,1],...
    'Style','edit','String','','TooltipString',str,...
    'Min',0,'Max',1);
  str = sprintf('Click to increment %s.',tooltip);
  hBtnR = uicontrol('Parent',hHBox,'Style','pushbutton',...
    'String','>','TooltipString',str,...
    'BusyAction','cancel','Interruptible','off');
  set(hHBox,'Sizes',[25,-1,25]);
  guiEmpty(hVBox);
  set(hVBox,'Sizes',[-1,22,25,-1]);
  minVal = round(minVal);
  maxVal = round(maxVal);
  value = round(value);
  if (value < minVal)
    value = minVal;
  elseif (value > maxVal)
    value = maxVal;
  end;
  handle = {hBtnL,hEdt,hBtnR,hTxt,value,minVal,maxVal,tooltip};
  set(hEdt,'String',num2str(value));
  set(hBtnL,'UserData',handle);
  set(hEdt,'UserData',handle);
  set(hBtnR,'UserData',handle);
  set(hBtnL,'Callback',{hCallback,1});
  set(hEdt,'Callback',{hCallback,2});
  set(hBtnR,'Callback',{hCallback,3});
  if (value == minVal)
    set(hBtnL,'Enable','off');
  else  
    set(hBtnL,'Enable','on');
  end;  
  if (value == maxVal)  
    set(hBtnR,'Enable','off');
  else  
    set(hBtnR,'Enable','on');
  end;  