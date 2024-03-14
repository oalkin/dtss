function guiPlotZoomCB(hObject,eventData,code)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
% 
  hAxes = get(hObject,'UserData');
  uData = get(hAxes,'UserData');
  zIdxx = uData{5};
  zIdxy = uData{6};
  zxa = uData{7};
  zxb = uData{8};
  zya = uData{9};
  zyb = uData{10};
  if (code == 1) 
    if (zIdxy > 1)
      zIdxy = zIdxy-1;
    end  
  elseif (code == 2)    
    if (zIdxy < length(zya))
      zIdxy = zIdxy+1;
    end  
  elseif (code == 3)
    if (zIdxx > 1)
      zIdxx = zIdxx-1;
    end  
  elseif (code == 4)    
    if (zIdxx < length(zxa))
      zIdxx = zIdxx+1;
    end  
  end      
  uData{5} = zIdxx;
  uData{6} = zIdxy;
  set(hAxes,'UserData',uData);
end  