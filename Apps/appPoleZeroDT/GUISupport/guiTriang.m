function pts = guiTriang(ctr,width,height,dir)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2012 by Oktay Alkin.
% All rights reserved.
%
  xmin = ctr(1)-0.5*width;
  xmax = ctr(1)+0.5*width;
  ymin = ctr(2)-0.5*height;
  ymax = ctr(2)+0.5*height;
  switch dir
    case 1 % right
      pts = [xmin,xmin,xmax,xmin;ymin,ymax,ctr(2),ymin];  
    case 2 % left
      pts = [xmax,xmax,xmin,xmax;ymin,ymax,ctr(2),ymin];  
    case 3 % up
      pts = [xmin,xmax,ctr(1),xmin;ymin,ymin,ymax,ymin];  
    case 4 % down
      pts = [xmin,xmax,ctr(1),xmin;ymax,ymax,ymin,ymax]; 
  end;