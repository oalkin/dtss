function newHandles = guiInitTextFig(handles)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2012 by Oktay Alkin.
% All rights reserved.
%
  set(handles.axesT,'XTick',[]);
  set(handles.axesT,'YTick',[]);
  tmpCol = get(handles.figure1,'Color');
  set(handles.axesT,'XColor',tmpCol);
  set(handles.axesT,'YColor',tmpCol);
  axes(handles.axesT);
  axis([0,1,0,1]);
  handles.hZoom = zoom;
  handles.hPan = pan;
  setAllowAxesZoom(handles.hZoom,handles.axesT,false);
  setAllowAxesPan(handles.hPan,handles.axesT,false);
  newHandles = handles;