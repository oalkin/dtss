function guiAbout(hObject,eventdata)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  hModal = dialog;
  tmpPos = get(hModal,'Position');
  tmpPos(3) = 600;
  tmpPos(4) = 350;
  set(hModal,'Position',tmpPos);
  hLayout = guiHBox(hModal);
  guiEmpty(hLayout);
  hBox1 = guiVBox(hLayout);
  guiEmpty(hLayout);
  hBox2 = guiVBox(hLayout);
  guiEmpty(hLayout);
  set(hLayout,'Sizes',[20,209,20,-1,20]);
  
  guiEmpty(hBox1);
  guiBookImage(hBox1);
  guiEmpty(hBox1);
  set(hBox1,'Sizes',[-1,300,-1]);
  
  guiEmpty(hBox2);
  T1 = guiTextC(hBox2,'Interactive Demo Program',10);
  T2 = guiTextC(hBox2,'to accompany',10);
  T3 = guiTextC(hBox2,'Signals and Systems',14);
  T4 = guiTextC(hBox2,'A MATLAB-Integrated Approach',12);
  T5 = guiTextC(hBox2,'by',10);
  T6 = guiTextC(hBox2,'Oktay Alkin',10);
  T7 = guiTextC(hBox2,'CRC Press,   ISBN: 978-1-4665-9853-9',10);
  T8 = guiTextHL(hBox2,'Publisher''s website','www.crcpress.com/product/isbn/9781466598539',10);
  T9 = guiTextHL(hBox2,'www.signalsandsystems.org','www.signalsandsystems.org',10);
  guiEmpty(hBox2);
  hBox3 = guiHBox(hBox2);
  guiEmpty(hBox3);
  hButton = uicontrol('Parent',hBox3,'String','Ok','Callback','close');
  guiEmpty(hBox3);
  set(hBox3,'Sizes',[-1,60,20]);
  guiEmpty(hBox2);
  set(hBox2,'Sizes',[-1,28,28,34,34,28,28,28,28,28,-1,30,20]);
  set(T3,'FontWeight','bold');
  set(T4,'FontWeight','bold');