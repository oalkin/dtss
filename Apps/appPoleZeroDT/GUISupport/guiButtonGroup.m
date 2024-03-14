function handle = guiButtonGroup(hObject,hCallback,title,tooltips,...
     strings,value,padtop,padbot)
% This function is for internal use by the interactive apps that
% accompany the textbooks
%   "Continuous-Time Signals and Systems: A MATLAB-Integrated Approach"
% and
%   "Discrete-Time Signals and Systems: A MATLAB-Integrated Approach"
% by Oktay Alkin.
% Copyright (c) 2014-2024 by Oktay Alkin.
% All rights reserved.
%
  hVBox = guiVBox(hObject);
  guiEmpty(hVBox);
  handle = uibuttongroup('Parent',hVBox,'FontSize',10,...
    'BackgroundColor',guiBgColor);
  for i = 1:max(size(strings))
    tmpStr = strings{i}
    tmpBtn = uiradiobutton(handle,'Text',tmpStr);
  end; 
  guiEmpty(hVBox);
  set(hVBox,'Sizes',[padtop,-1,padbot]);
  set(handle,'Value',get(handle,'Min'));
  set(handle,'Callback',{hCallback});
end