function tmp = guiIndexCB(hObject,eventdata,code)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  handle = get(hObject,'UserData');
  if (hObject == handle{1}) % Left button
    tmp = handle{5}-1;
    if (tmp == handle{6})
      set(hObject,'Enable','off');
    end;  
    if (tmp < handle{6})
      tmp = handle{6};
    end;
    set(handle{2},'String',num2str(tmp));
    handle{5} = tmp;
    set(hObject,'UserData',handle);
    % Update right button data.
    hBtnR = handle{3};
    tmpR = get(hBtnR,'UserData');
    set(hBtnR,'UserData',handle);
    if (tmp < handle{7})
      set(hBtnR,'Enable','on');
    end;  
    % Update edit control data.
    hEdt = handle{2};
    tmpE = get(hEdt,'UserData');
    set(hEdt,'UserData',handle);
  elseif (hObject == handle{2}) % Edit field  
    flg = 0;
    tmp = str2double(get(hObject,'String'));
    tmp = round(tmp);
    if (tmp < handle{6})
      tmp = handle{6};
      flg = 1;
    elseif (tmp > handle{7})
      tmp = handle{7};
      flg = 1;
    end;
    if (flg > 0)
      str = sprintf('The value entered is out of range.\n%d <= %s <= %d',handle{6},handle{8},handle{7});
      warndlg(str,'Out of range','modal');
    end;
    set(hObject,'String',num2str(tmp));
    handle{5} = tmp;
    set(hObject,'UserData',handle);
    % Update left button data.
    hBtnL = handle{1};
    tmpL = get(hBtnL,'UserData');
    set(hBtnL,'UserData',handle);
    % Update right button data.
    hBtnR = handle{3};
    tmpR = get(hBtnR,'UserData');
    set(hBtnR,'UserData',handle);
    if (tmp == handle{6})
      set(hBtnL,'Enable','off');
    else  
      set(hBtnL,'Enable','on');
    end;  
    if (tmp == handle{7})
      set(hBtnR,'Enable','off');
    else  
      set(hBtnR,'Enable','on');
    end;  
  elseif (hObject == handle{3})   % Right button 
    tmp = handle{5}+1;
    if (tmp == handle{7})
      set(hObject,'Enable','off');
    end;
    if (tmp > handle{7})
      tmp = handle{7};
    end;
    set(handle{2},'String',num2str(tmp));
    handle{5} = tmp;
    set(hObject,'UserData',handle);
    % Update left button data.
    hBtnL = handle{1};
    tmpL = get(hBtnL,'UserData');
    set(hBtnL,'UserData',handle);
    if (tmp > handle{6})
      set(hBtnL,'Enable','on');
    end;  
    % Update edit control data.
    hEdt = handle{2};
    tmpE = get(hEdt,'UserData');
    set(hEdt,'UserData',handle);
  end;  