function handle = guiCheckBox(hObject,hCallback,title,tooltip,...
     value,padtop,padbot)
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
  str = sprintf('Check to %s.',tooltip);
  hChk = uicontrol('Parent',hVBox,'Style','checkbox',...
    'String',title,'FontSize',10,'TooltipString',str,...
    'BackgroundColor',guiBgColor);
  guiEmpty(hVBox);
  guiEmpty(hVBox);
  set(hVBox,'Sizes',[-1,padtop,25,padbot,-1]);
  if (value > 0)
    set(hChk,'Value',get(hChk,'Max'));
  else
    set(hChk,'Value',get(hChk,'Min'));
  end;
  set(hChk,'Callback',{hCallback});
  handle = hChk;