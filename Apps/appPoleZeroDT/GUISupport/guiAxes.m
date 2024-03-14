function handle = guiAxes(hObject)
% This function is for internal use by the interactive demo 
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  handle = axes('Parent',hObject,'Units','normalized',...
    'ActivePositionProperty','OuterPosition','Box','on');
end