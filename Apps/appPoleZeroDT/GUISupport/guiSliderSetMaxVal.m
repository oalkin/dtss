function newData = guiSliderSetMaxVal(handle,maxVal)
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
  minVal = handle{5};
  %maxVal = handle{6};
  toolTip = handle{7};
  if (maxVal < minVal),
    minVal = maxVal;
    value = maxVal;
    set(hSld,'Value',value,'Min',minVal,'Max',maxVal);
    set(hEdt,'String',num2str(value));
    handle{4} = value;
    handle{5} = minVal;
  elseif (maxVal < value),
    value = maxVal;
    set(hSld,'Value',value,'Max',maxVal);
    set(hEdt,'String',num2str(value));
    handle{4} = value;
  else
    set(hSld,'Max',maxVal);
  end;  
  handle{6} = maxVal;
  set(hSld,'UserData',handle);
  set(hEdt,'UserData',handle);
  newData = handle;
end