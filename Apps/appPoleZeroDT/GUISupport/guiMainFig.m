function handle = guiMainFig(str)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  str = ['[',str,'-Time Signals and Systems: A MATLAB-Integrated Approach]'];
  str = ['(c) Oktay Alkin     ',str];
  handle = figure('Position',[10,10,1100,720],...
    'NumberTitle','off','Name',str,'Renderer','zbuffer',...
    'MenuBar','none','Toolbar','none');
  warning('off','MATLAB:gui:latexsup:UnsupportedFont');
  warning('off','MATLAB:handle_graphics:exceptions:SceneNode');  