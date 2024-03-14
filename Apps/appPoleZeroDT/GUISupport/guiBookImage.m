function hAxes = guiBookImage(hObject);
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  hBox = guiHBox(hObject);
  hPanel = guiPanel(hBox);
  img = imread('book_cover.png','BackgroundColor',guiBgColor);
  hAxes = guiAxes(hPanel);
  set(hAxes,'Units','pixels');
  image(img);
  axis off;
  axis image;
  guiEmpty(hBox);
  set(hBox,'Sizes',[209,-1]);
  
  %adjustMargins(hData.ImgAxes,3);
  %tmpPos = get(hAxes,'Position');
  tmpPos = [1,1,209,300];
  set(hAxes,'Position',tmpPos);