function guiSetAxes(hAxes)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
% 
  uData = get(hAxes,'UserData');
  zIdxx = uData{5};
  zIdxy = uData{6};
  zxa = uData{7};
  zxb = uData{8};
  zya = uData{9};
  zyb = uData{10};
  axis(hAxes,[zxa(zIdxx),zxb(zIdxx),zya(zIdxy),zyb(zIdxy)]);
end

