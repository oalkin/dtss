function handle = guiPlotTitle(str)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  tmp = sprintf('\\textsf{%s}',str);
  handle = title(tmp,'Interpreter','latex','Fontsize',guiFontSize);
end  