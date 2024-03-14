function [hAxes,hBtn1,hBtn2] = guiPlotPanelZoomY(hObject,hCallback)
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
  guiEmpty(hBtnPanel);
  hBtn1 = guiButton(hBtnPanel,hCallback,'Y+','zoom in (Y axis)');
  guiEmpty(hBtnPanel);
  hBtn2 = guiButton(hBtnPanel,hCallback,'Y-','zoom out (Y axis)');
  guiEmpty(hBtnPanel);
  set(hBtnPanel,'Sizes',[20,30,10,30,-1]);
  set(hBtn1,'Callback',{hCallback,1});
  set(hBtn2,'Callback',{hCallback,2});
  set(hAxes,'UserData',{0,0,hBtn1,hBtn2,0,0,[],[],[],[]});
  set(hAxes,'NextPlot','replacechildren');
  set(hBtn1,'UserData',hAxes);
  set(hBtn2,'UserData',hAxes);      
end