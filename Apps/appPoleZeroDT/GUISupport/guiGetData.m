function [hData,hFig] = guiGetData(hObject)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;
end