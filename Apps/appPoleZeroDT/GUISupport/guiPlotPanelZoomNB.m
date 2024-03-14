function hAxes = guiPlotPanelZoomNB(hObject)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  hBox = guiHBox(hObject);
  hPanel = guiPanel(hBox);
  hAxes = guiAxes(hPanel);
  guiAdjustMargins(hAxes);
  guiEmpty(hBox);
  hBtnPanel = guiVBox(hBox);
  guiEmpty(hBox);
  set(hBox,'Sizes',[-1,10,30,10]);
end