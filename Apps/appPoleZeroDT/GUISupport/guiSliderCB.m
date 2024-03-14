function tmp = guiSliderCB(hObject,eventdata,code)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  handle = get(hObject,'UserData');
  if (hObject == handle{1}) % Slider
    tmp = get(hObject,'Value');
    set(handle{3},'String',num2str(tmp));
    handle{4} = tmp;
    set(hObject,'UserData',handle);
    % Update edit control data.
    edt = handle{3};
    tmpE = get(edt,'UserData');
    set(edt,'UserData',handle);
  elseif (hObject == handle{3}) % Edit field  
    flg = 0;
    tmp = str2double(get(hObject,'String'));
    if (tmp < handle{5})
      tmp = handle{5};
      flg = 1;
    elseif (tmp > handle{6})
      tmp = handle{6};
      flg = 1;
    end;
    if (flg > 0)
      str = sprintf('The value entered is out of range.\n%.3g <= %s <= %.3g',handle{5},handle{7},handle{6});
      warndlg(str,'Out of range','modal');
    end;
    set(hObject,'String',num2str(tmp));
    set(handle{1},'Value',tmp);
    handle{4} = tmp;
    set(hObject,'UserData',handle);
    % Update slider data.
    sldr = handle{1};
    tmpS = get(sldr,'UserData');
    set(sldr,'UserData',handle);
  end;