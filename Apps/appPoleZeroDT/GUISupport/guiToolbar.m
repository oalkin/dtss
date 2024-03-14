function handle = guiToolbar(hObject,buttons)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  handle = findall(hObject,'Type','uitoolbar');
            if isempty(handle)
              handle = uitoolbar(hObject);
            end
  hTools = allchild(handle);
  % for i=1:max(size(hTools))
  %   if (sum(strcmpi(buttons,get(hTools(i),'TooltipString')))==0)
  %     delete(hTools(i));
  %   end;  
  % end;  
  hPush = findall(handle,'Type','uipushtool');
  hToggle = findall(handle,'Type','uitoggletool');
  
  % a = [.20:.05:0.95];
  % img1(:,:,1) = repmat(a,16,1)';
  % img1(:,:,2) = repmat(a,16,1);
  % img1(:,:,3) = repmat(flipdim(a,2),16,1);
  % [img,map] = imread('bookicon.gif');
  % map(find(map(:,1)+map(:,2)+map(:,3)==3)) = NaN;
  % img = ind2rgb(img,map);
  % pth = uipushtool(handle,'CData',img,...
  %   'TooltipString','About this program',...
  %   'HandleVisibility','off',...
  %   'ClickedCallback',@guiAbout);