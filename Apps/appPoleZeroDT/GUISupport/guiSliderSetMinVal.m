function newData = guiSliderSetMinVal(handle,minVal)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  hSld = handle{1};
  hTxt = handle{2};
  hEdt = handle{3};
  handle = get(hSld,'UserData');
  value = handle{4};
  %minVal = handle{5};
  maxVal = handle{6};
  toolTip = handle{7};
  if (minVal > maxVal),
    maxVal = minVal;
    value = minVal;
    set(hSld,'Value',value,'Min',minVal,'Max',maxVal);
    set(hEdt,'String',num2str(value));
    handle{4} = value;
    handle{6} = maxVal;
  elseif (minVal > value),
    value = minVal;
    set(hSld,'Value',value,'Min',minVal);
    set(hEdt,'String',num2str(value));
    handle{4} = value;
  else
    set(hSld,'Min',minVal);
  end;  
  handle{5} = minVal;
  set(hSld,'UserData',handle);
  set(hEdt,'UserData',handle);
  newData = handle;
end