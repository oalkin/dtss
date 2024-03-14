function newData = guiIndexSetMaxVal(handle,maxVal)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  hBtnL = handle{1};
  hEdt = handle{2};
  hBtnR = handle{3};
  handle = get(hBtnR,'UserData');
  value = handle{5};
  minVal = handle{6};
  %maxVal = handle{7};
  maxVal = round(maxVal);
  if (maxVal < value)
    value = maxVal;
    set(hEdt,'String',num2str(value));
  end;  
  if (maxVal < minVal)
    minVal = maxVal;
  end;  
  if (value == minVal)
    set(hBtnL,'Enable','off');
  else  
    set(hBtnL,'Enable','on');
  end;  
  if (value == maxVal)  
    set(hBtnR,'Enable','off');
  else  
    set(hBtnR,'Enable','on');
  end;      
  handle{5} = value;
  handle{6} = minVal;
  handle{7} = maxVal;  
  set(hBtnL,'UserData',handle);
  set(hEdt,'UserData',handle);
  set(hBtnR,'UserData',handle);
  newData = handle;