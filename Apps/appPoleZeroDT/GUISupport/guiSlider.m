function handle = guiSlider(hObject,hCallback,title,tooltip,...
     value,minVal,maxVal,stepVal,editWidth,padding)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  hVBox = guiVBox(hObject);
  guiEmpty(hVBox);
  guiEmpty(hVBox);
  hHBox = guiHBox(hVBox);
  hTxt = uicontrol('Parent',hHBox,'Style','text',...
    'String',title,'FontSize',10,'HorizontalAlignment','left',...
    'BackgroundColor',guiBgColor);
  str = sprintf('Enter the value of %s here.',tooltip);
  hEdt = uicontrol('Parent',hHBox,'BackgroundColor',[1,1,1],...
    'Style','edit','String','','TooltipString',str,...
    'Min',0,'Max',1);
  set(hHBox,'Sizes',[-1,editWidth]);
  guiEmpty(hVBox);
  str = sprintf('Use this slider to adjust %s.',tooltip);
  hSld = uicontrol('Parent',hVBox,'Style','slider',...
    'Min',minVal,'Max',maxVal,'Value',value,...
    'SliderStep',stepVal,'TooltipString',str,...
    'BusyAction','cancel','Interruptible','off');
  guiEmpty(hVBox);
  guiEmpty(hVBox);
  set(hVBox,'Sizes',[-1,2,22,padding,25,2,-1]);
  if (value < minVal)
    value = minVal;
  elseif (value > maxVal)
    value = maxVal;
  end;
  handle = {hSld,hTxt,hEdt,value,minVal,maxVal,tooltip};
  set(hEdt,'String',num2str(value));
  set(hSld,'UserData',handle);
  set(hEdt,'UserData',handle);
  set(hSld,'Callback',{hCallback,1});
  set(hEdt,'Callback',{hCallback,2});  
end  