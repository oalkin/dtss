function appPoleZeroDT(varargin)
% Pole Zero Explorer
%
% This app is intended for use with the text
%   "Discrete-Time Signals and Systems: A MATLAB-Integrated Approach"
%   by Oktay Alkin.
% Copyright (c) 2014-2024 by Oktay Alkin.
% All rights reserved.

  hMain = guiMainFig('Discrete');
  guiCenterMain(hMain);
  guiSetDefaults(hMain);
  appPoleZeroDT_util(hMain);

function hLayout = appPoleZeroDT_util(hObject)
  hData = {};
  hData.v2a = 2;
  hData.v2b = 1;
  hData.v7 = 0;
  hData.v8Min = -pi;
  hData.v8Max = pi;
  hData.v8 = 0;
  hData.v8Step = [1/200,1/200];
  hData.v9 = 1;
  hData.v10 = 1;
  hData.aCol = [0.8,0,0];
  hData.bCol = [1,1,1];
  hData.cCol = [0,0.7,0];
  hData.z1Idxx = 1;
  hData.z1Idxy = 11;
  hData.z1ya = -0*[0.1,0.2,0.4,0.6,0.8,1,2,4,6,8,10,20,40,60,80,100];
  hData.z1yb = [0.1,0.2,0.4,0.6,0.8,1,2,4,6,8,10,20,40,60,80,100];
  hData.z1xa = -pi;
  hData.z1xb = pi;
  if verLessThan('matlab','8.4.0')
    hData.lw = 1.5;
  else  
    hData.lw = 1;
  end  
  hLayout = guiVBox(hObject);
  hTitle = guiSetTitle(hLayout,'Graphical Interpretation of the Pole Zero Plot');
  hBox1 = guiHBox(hLayout);
  set(hLayout,'Sizes',[24,-1]);
  guiEmpty(hBox1);
  hBox2 = guiVBox(hBox1);
  hBox3 = guiVBox(hBox1);
  set(hBox1,'Sizes',[20,-1,-1]);
  hData = pz_demo2_insert1(hBox2,hData);
  hData = pz_demo2_insert2(hBox3,hData);
  hData.Omg = [-1:0.002:1]*pi;
  hData.Zeros = [];
  hData.Poles = [0.9*exp(j*pi/4),0.9*exp(-j*pi/4)];
  hData.uCirc = guiCircle([0,0],1,400);
  hData = initPoleZero(hData);
  hData.moveRad = 0.1;
  hData.moveAng = 1;
  hData = initPlots(hData); 
  hObject.UserData = hData;

function newData = pz_demo2_insert1(hBox,hData)
  hBox1 = guiHBox(hBox);
  hData.axes1 = guiPlotPanelZoomY(hBox,@pz_demo2_zoom1_callback);
  guiZoomData(hData.axes1,hData.z1Idxx,hData.z1Idxy,...
    hData.z1xa,hData.z1xb,hData.z1ya,hData.z1yb);
  hData.axes2 = guiPlotPanelZoomNB(hBox);
  set(hBox,'Sizes',[100,-1,-1]);
  hData.axesT = guiTextAxes(hBox1,...
    {{[0.05,0.75],['Refer to: Section 8.5.4, Pages 797']},...
     {[0.10,0.50],['through 803, Eqns. ',guiRef('eq:ztSys55'),' through']},...
     {[0.10,0.25],[guiRef('eq:ztSys57'),', Figs. ',guiRef('fig:ztSystem1'),' through ',guiRef('fig:ztSystem5'),'.']}
    });
  guiEmpty(hBox1);
  hBox2 = guiVBox(hBox1);
  guiEmpty(hBox1);
  set(hBox1,'Sizes',[320,20,120,-1]);
  guiEmpty(hBox2);
  hData.hCtl1 = guiButton(hBox2,@pz_demo2_ctl1_callback,...
     'Import PZ map','import pole/zero map by specifying two vectors');
  guiEmpty(hBox2);
  hData.hCtl10 = guiPopMenu(hBox2,@pz_demo2_ctl10_callback,...
     'PZ set:','pole-zero set',...
     {'Fig. 8.38 a,b','Fig. 8.38 c,d','Fig. 8.38 e,f','Fig. 8.38 g,h','Fig. 8.38 i,j','Custom...'},hData.v10,3);
  set(hBox2,'Sizes',[-1,30,-1,60]);
  newData = hData;

function newData = pz_demo2_insert2(hBox,hData)
  hData.axes3 = guiPlotPanel(hBox);
  hBox1a = guiHBox(hBox);
  guiEmpty(hBox);
  hBox1b = guiHBox(hBox);
  guiEmpty(hBox);
  hBox3 = guiHBox(hBox);
  guiEmpty(hBox3);
  hData.axesF = guiTextAxes(hBox3,{{[0.01,0.5],['']}});
  %set(hBox3,'Sizes',[-1,460]);
  set(hBox3,'Sizes',[-1,500]);
  guiEmpty(hBox);
  hBox2 = guiHBox(hBox);
  guiEmpty(hBox);
  set(hBox,'Sizes',[-1,60,10,60,10,40,10,60,20]);
  hData = pz_demo2_insert3a(hBox1a,hData);
  hData = pz_demo2_insert3b(hBox1b,hData);
  hData = pz_demo2_insert4(hBox2,hData);
  hData.T1 = hData.axesF{2};
  newData = hData;
  
function newData = pz_demo2_insert3a(hBox,hData)
  guiEmpty(hBox);
  hBox3 = guiVBox(hBox);
  guiEmpty(hBox3);
  hData.hCtl2a = guiPopMenu(hBox3,@pz_demo2_ctl2a_callback,...
     'Incr. for radius:',...
     'increment used in adjusting the radius of selected pole or zero',...
     {'1','0.1','0.01','0.001','0.0001'},hData.v2a,3);
  guiEmpty(hBox3);
  set(hBox3,'Sizes',[5,55,-1]);
  guiEmpty(hBox);
  hBox1 = guiVBox(hBox);
  guiEmpty(hBox);
  hBox2 = guiVBox(hBox);
  guiEmpty(hBox);
  set(hBox,'Sizes',[-1,150,40,90,40,120,20]);
  hData = pz_demo2_insert5a(hBox1,hData);
  hData = pz_demo2_insert6(hBox2,hData);
  newData = hData;
  
function newData = pz_demo2_insert3b(hBox,hData)
  guiEmpty(hBox);
  hBox3 = guiVBox(hBox);
  guiEmpty(hBox3);
  hData.hCtl2b = guiPopMenu(hBox3,@pz_demo2_ctl2b_callback,...
     'Incr. for angle (deg):',...
     'increment used in adjusting the angle of selected pole or zero',...
     {'1','0.1','0.01','0.001','0.0001'},hData.v2b,3);
  guiEmpty(hBox3);
  set(hBox3,'Sizes',[5,55,-1]);
  guiEmpty(hBox);
  hBox1 = guiVBox(hBox);
  guiEmpty(hBox);
  hData.axesF2 = guiTextAxes(hBox,{{[0.01,0.25],['Gain: $K=1$']}});
  guiEmpty(hBox);
  set(hBox,'Sizes',[-1,150,40,90,40,120,20]);
  hData = pz_demo2_insert5b(hBox1,hData);
  newData = hData;
  
function newData = pz_demo2_insert4(hBox,hData)
  guiEmpty(hBox);
  hData.hCtl8 = guiSlider(hBox,@pz_demo2_ctl8_callback,...
    'Display frequency (Omega0):','display frequency "Omega0" in radians',...
    hData.v8,hData.v8Min,hData.v8Max,hData.v8Step,60,3);
  guiEmpty(hBox);
  hData.hCtl9 = guiCheckBox(hBox,@pz_demo2_ctl9_callback,...
    'Show vectors',...
    'show vectors from each pole and zero to the display frequency',hData.v9,1,0);
  guiEmpty(hBox);
  set(hBox,'Sizes',[-1,250,40,150,20]);
  newData = hData;

function newData = pz_demo2_insert5a(hBox,hData)
  guiEmpty(hBox);
  hBox1 = guiHBox(hBox);
  guiEmpty(hBox);
  set(hBox,'Sizes',[25,30,-1]);
  guiEmpty(hBox1);
  hData.hCtl3 = guiButton(hBox1,@pz_demo2_ctl3_callback,...
     '<','decrease the radius of selected pole or zero'); 
  guiEmpty(hBox1);
  hData.hCtl4 = guiButton(hBox1,@pz_demo2_ctl4_callback,...
     '>','increase the radius of selected pole or zero'); 
  guiEmpty(hBox1);
  set(hBox1,'Sizes',[-1,30,-1,30,-1]);
  newData = hData;
  
function newData = pz_demo2_insert5b(hBox,hData)
  guiEmpty(hBox);
  hBox1 = guiHBox(hBox);
  guiEmpty(hBox);
  set(hBox,'Sizes',[25,30,-1]);
  guiEmpty(hBox1);
  hData.hCtl5 = guiButton(hBox1,@pz_demo2_ctl5_callback,...
     '<','decrease the angle of selected pole or zero'); 
  guiEmpty(hBox1);
  hData.hCtl6 = guiButton(hBox1,@pz_demo2_ctl6_callback,...
     '>','increase the angle of selected pole or zero'); 
  guiEmpty(hBox1);
  set(hBox1,'Sizes',[-1,30,-1,30,-1]);
  newData = hData;
  
function newData = pz_demo2_insert6(hBox,hData)
  guiEmpty(hBox);
  hData.hCtl7 = guiButton(hBox,@pz_demo2_ctl7_callback,...
     'Select >>','select the pole or zero to be moved (it will turn red)');
  guiEmpty(hBox);
  set(hBox,'Sizes',[25,30,-1]);
  newData = hData;

function pz_demo2_ctl1_callback(hObject,eventdata,code)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  prompt = {'Vector for poles',...
            'Vector for zeros'};
  name = 'Vectors for pole/zero map';
  numLines = [1,50;1,50];
  defaultAnswer = {'',''};
  answer = inputdlg(prompt,name,numLines,defaultAnswer);
  if (length(answer) == 2),
    tmpPoles = hData.Poles;
    tmpZeros = hData.Zeros;
    tmp1 = answer{1};
    tmp2 = answer{2};
    try
      hData.Poles = evalin('base',tmp1);
      hData.Zeros = evalin('base',tmp2);
    catch err
      errordlg('Problem reading workspace variable','Error');
      hData.Poles = tmpPoles;
      hData.Zeros = tmpZeros;
    end;    
  end;
  hData = initPoleZero(hData);
  hData = initPlots(hData);
  hFig.UserData = hData;

function pz_demo2_ctl2a_callback(hObject,eventdata)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  hData.v2a = guiPopMenuCB(hObject,eventdata);
  switch hData.v2a
    case 1
      hData.moveRad = 1;
    case 2  
      hData.moveRad = 0.1;
    case 3  
      hData.moveRad = 0.01;
    case 4  
      hData.moveRad = 0.001;
    case 5  
      hData.moveRad = 0.0001;
  end;      
  hFig.UserData = hData;
  
function pz_demo2_ctl2b_callback(hObject,eventdata)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  hData.v2b = guiPopMenuCB(hObject,eventdata);
  switch hData.v2b
    case 1
      hData.moveAng = 1;
    case 2  
      hData.moveAng = 0.1;
    case 3  
      hData.moveAng = 0.01;
    case 4  
      hData.moveAng = 0.001;
    case 5  
      hData.moveAng = 0.0001;
  end;      
  hFig.UserData = hData;
  
function pz_demo2_ctl3_callback(hObject,eventdata,code)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  % Decrease radius
  if (hData.selPole > 0),
    tmp = hData.Poles(hData.selPole);
    tmpRad = abs(tmp);
    tmpAng = angle(tmp)*180/pi;
    tmpRad = max([0,tmpRad-hData.moveRad]);
    hData.Poles(hData.selPole) = tmpRad*exp(j*tmpAng*pi/180);
    tmpIdx = hData.cPoles(hData.selPole);
    if (tmpIdx > 0),
      tmp = hData.Poles(tmpIdx);
      tmpRad = abs(tmp);
      tmpAng = angle(tmp)*180/pi;
      tmpRad = max([0,tmpRad-hData.moveRad]);
      hData.Poles(tmpIdx) = tmpRad*exp(j*tmpAng*pi/180);
    end;    
  elseif (hData.selZero > 0),
    tmp = hData.Zeros(hData.selZero);
    tmpRad = abs(tmp);
    tmpAng = angle(tmp)*180/pi;
    tmpRad = max([0,tmpRad-hData.moveRad]);
    hData.Zeros(hData.selZero) = tmpRad*exp(j*tmpAng*pi/180);
    tmpIdx = hData.cZeros(hData.selZero);
    if (tmpIdx > 0),
      tmp = hData.Zeros(tmpIdx);
      tmpRad = abs(tmp);
      tmpAng = angle(tmp)*180/pi;
      tmpRad = max([0,tmpRad-hData.moveRad]);
      hData.Zeros(tmpIdx) = tmpRad*exp(j*tmpAng*pi/180);
    end;    
  end;    
  hData = updatePlots(hData);
  hFig.UserData = hData;
  
function pz_demo2_ctl4_callback(hObject,eventdata,code)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  % Increase radius
  if (hData.selPole > 0),
    tmp = hData.Poles(hData.selPole);
    tmpRad = abs(tmp);
    tmpAng = angle(tmp)*180/pi;
    tmpRad = tmpRad+hData.moveRad;
    hData.Poles(hData.selPole) = tmpRad*exp(j*tmpAng*pi/180);;
    tmpIdx = hData.cPoles(hData.selPole);
    if (tmpIdx > 0),
      tmp = hData.Poles(tmpIdx);
      tmpRad = abs(tmp);
      tmpAng = angle(tmp)*180/pi;
      tmpRad = tmpRad+hData.moveRad;
      hData.Poles(tmpIdx) = tmpRad*exp(j*tmpAng*pi/180);
    end;    
  elseif (hData.selZero > 0),
    tmp = hData.Zeros(hData.selZero);
    tmpRad = abs(tmp);
    tmpAng = angle(tmp)*180/pi;
    tmpRad = tmpRad+hData.moveRad;
    hData.Zeros(hData.selZero) = tmpRad*exp(j*tmpAng*pi/180);
    tmpIdx = hData.cZeros(hData.selZero);
    if (tmpIdx > 0),
      tmp = hData.Zeros(tmpIdx);
      tmpRad = abs(tmp);
      tmpAng = angle(tmp)*180/pi;
      tmpRad = tmpRad+hData.moveRad;
      hData.Zeros(tmpIdx) = tmpRad*exp(j*tmpAng*pi/180);
    end;    
  end;    
  hData = updatePlots(hData);
  hFig.UserData = hData;
  
function pz_demo2_ctl5_callback(hObject,eventdata,code)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  % Decrease angle
  if (hData.selPole > 0),
    tmp = hData.Poles(hData.selPole);
    tmpRad = abs(tmp);
    tmpAng = angle(tmp)*180/pi;
    tmpAng = tmpAng-hData.moveAng;
    hData.Poles(hData.selPole) = tmpRad*exp(j*tmpAng*pi/180);
    tmpIdx = hData.cPoles(hData.selPole);
    if (tmpIdx > 0),
      tmp = hData.Poles(tmpIdx);
      tmpRad = abs(tmp);
      tmpAng = angle(tmp)*180/pi;
      tmpAng = tmpAng+hData.moveAng;
      hData.Poles(tmpIdx) = tmpRad*exp(j*tmpAng*pi/180);
    end;    
  elseif (hData.selZero > 0),
    tmp = hData.Zeros(hData.selZero);
    tmpRad = abs(tmp);
    tmpAng = angle(tmp)*180/pi;
    tmpAng = tmpAng-hData.moveAng;
    hData.Zeros(hData.selZero) = tmpRad*exp(j*tmpAng*pi/180);
    tmpIdx = hData.cZeros(hData.selZero);
    if (tmpIdx > 0),
      tmp = hData.Zeros(tmpIdx);
      tmpRad = abs(tmp);
      tmpAng = angle(tmp)*180/pi;
      tmpAng = tmpAng+hData.moveAng;
      hData.Zeros(tmpIdx) = tmpRad*exp(j*tmpAng*pi/180);
    end;    
  end;    
  hData = updatePlots(hData);
  hFig.UserData = hData;
  
function pz_demo2_ctl6_callback(hObject,eventdata,code)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  % Increase angle
  if (hData.selPole > 0),
    tmp = hData.Poles(hData.selPole);
    tmpRad = abs(tmp);
    tmpAng = angle(tmp)*180/pi;
    tmpAng = tmpAng+hData.moveAng;
    hData.Poles(hData.selPole) = tmpRad*exp(j*tmpAng*pi/180);
    tmpIdx = hData.cPoles(hData.selPole);
    if (tmpIdx > 0),
      tmp = hData.Poles(tmpIdx);
      tmpRad = abs(tmp);
      tmpAng = angle(tmp)*180/pi;
      tmpAng = tmpAng-hData.moveAng;
      hData.Poles(tmpIdx) = tmpRad*exp(j*tmpAng*pi/180);
    end;    
  elseif (hData.selZero > 0),
    tmp = hData.Zeros(hData.selZero);
    tmpRad = abs(tmp);
    tmpAng = angle(tmp)*180/pi;
    tmpAng = tmpAng+hData.moveAng;
    hData.Zeros(hData.selZero) = tmpRad*exp(j*tmpAng*pi/180);
    tmpIdx = hData.cZeros(hData.selZero);
    if (tmpIdx > 0),
      tmp = hData.Zeros(tmpIdx);
      tmpRad = abs(tmp);
      tmpAng = angle(tmp)*180/pi;
      tmpAng = tmpAng-hData.moveAng;
      hData.Zeros(tmpIdx) = tmpRad*exp(j*tmpAng*pi/180);
    end;    
  end;    
  hData = updatePlots(hData);
  hFig.UserData = hData;
  
function pz_demo2_ctl7_callback(hObject,~,code)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  hData.v7 = hData.v7+1;
  if (hData.v7 > hData.nPoles+hData.nZeros),
    hData.v7 = 0;
  end;
  if (hData.v7 == 0)
    hData.selPole = 0;
    hData.selZero = 0;
  else
    if (hData.v7 <= hData.nPoles),
      hData.selPole = hData.v7;  
      hData.selZero = 0;
    else
      hData.selPole = 0;
      hData.selZero = hData.v7-hData.nPoles;
    end;    
  end;    
  hData = updatePlots(hData);
  hFig.UserData = hData;
  
function pz_demo2_ctl8_callback(hObject,eventdata,code)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  hData.v8 = guiSliderCB(hObject,eventdata,code);
  hData = updatePlots(hData);
  hFig.UserData = hData;
  
function pz_demo2_ctl9_callback(hObject,eventdata,code)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  hData.v9 = guiCheckBoxCB(hObject,eventdata);
  hData = updatePlots(hData);
  hFig.UserData = hData;
 
function pz_demo2_ctl10_callback(hObject,eventdata)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  tmp = guiPopMenuCB(hObject,eventdata);
  if (tmp == hData.v10),
    return;
  end;  
  hData.v10 = tmp;
  switch hData.v10
    case 1
      hData.Zeros = [];
      hData.Poles = [0.9*exp(j*pi/4),0.9*exp(-j*pi/4)];
    case 2
      hData.Zeros = [1];
      hData.Poles = [0.9*exp(j*pi/4),0.9*exp(-j*pi/4)];
    case 3
      hData.Zeros = [0.85];
      hData.Poles = [0.9*exp(j*pi/8),0.9*exp(-j*pi/8),0.75*exp(j*2*pi/3),0.75*exp(-j*2*pi/3)];
    case 4
      k =[1:5];
      hData.Zeros = exp(j*2*pi*k/6);
      hData.Poles = zeros(1,5);
    case 5
      k =[1:5];
      hData.Zeros = exp(j*2*pi*k/6);
      hData.Poles = zeros(1,5);
      hData.Poles(1)= 0.9*exp(j*pi/3.5);
      hData.Poles(2)= 0.9*exp(-j*pi/3.5);
    case 6
      hData = customPoleZero(hData);
  end;
  hData = initPoleZero(hData);
  hData = initPlots(hData);
  hFig.UserData = hData;
  
function pz_demo2_zoom1_callback(hObject,eventdata,code)
  hFig = ancestor(hObject,"figure","toplevel");
  hData = hFig.UserData;  
  guiPlotZoomCB(hObject,eventdata,code);
  guiSetAxes(hData.axes1);
  hFig.UserData = hData;

function newData = customPoleZero(hData)  
  prompt = {'Vector for poles',...
            'Vector for zeros'};
  name = 'Vectors for pole/zero map';
  numLines = [1,50;1,50];
  defaultAnswer = {'',''};
  answer = inputdlg(prompt,name,numLines,defaultAnswer);
  if (length(answer) == 2),
    tmpPoles = hData.Poles;
    tmpZeros = hData.Zeros;
    tmp1 = answer{1};
    tmp2 = answer{2};
    try
      hData.Poles = evalin('base',tmp1);
      hData.Zeros = evalin('base',tmp2);
    catch err
      errordlg('Problem reading workspace variable','Error');
      hData.Poles = tmpPoles;
      hData.Zeros = tmpZeros;
    end;    
  end;
  newData = hData;
  
function newData = initPoleZero(hData)
  hData.nPoles = length(hData.Poles);
  hData.nZeros = length(hData.Zeros);
  hData.selPole = 0;
  hData.selZero = 0;
  hData.v7 = 0;
  hData.cPoles = zeros(size(hData.Poles));
  hData.cZeros = zeros(size(hData.Zeros));
  if (hData.nPoles > 0)
    for n = 1:hData.nPoles,
      tmp1 = hData.Poles(n);
      tmp2 = hData.Poles-conj(tmp1);
      tmp3 = abs(tmp2);
      tmp4 = find((tmp3==0),1);
      if (min(size(tmp4))==1),
        if ((hData.cPoles(n)==0)&(hData.cPoles(tmp4)==0)&(imag(tmp1)~=0))
          hData.cPoles(n) = tmp4;
          hData.cPoles(tmp4) = n;
        end;    
      end;    
    end;
  end;  
  if (hData.nZeros > 0)
    for n = 1:hData.nZeros,
      tmp1 = hData.Zeros(n);
      tmp2 = hData.Zeros-conj(tmp1);
      tmp3 = abs(tmp2);
      tmp4 = find((tmp3==0),1);
      if (min(size(tmp4))==1),
        if ((hData.cZeros(n)==0)&(hData.cZeros(tmp4)==0)&(imag(tmp1)~=0))  
          hData.cZeros(n) = tmp4;
          hData.cZeros(tmp4) = n;
        end;    
      end;    
    end;
  end;  
  newData = hData;
  
function newData = computeStrings(hData)
  if (hData.selPole > 0),
    tmpPol = hData.Poles(hData.selPole);
    tmpRad = abs(tmpPol);
    tmpAng = angle(tmpPol)*180/pi;
    if (imag(tmpPol) < 0),
      hData.Str1 = sprintf('\\textsf{Selected pole: $$\\;p_{%d}=%.3g-j\\,%.3g,\\quad\\left|p_{%d}\\right|=%.3g,\\quad\\theta_{%d}=%.3g^{0}$$}',hData.selPole,real(tmpPol),abs(imag(tmpPol)),hData.selPole,tmpRad,hData.selPole,tmpAng);
    else
      hData.Str1 = sprintf('\\textsf{Selected pole: $$\\;p_{%d}=%.3g+j\\,%.3g,\\quad\\left|p_{%d}\\right|=%.3g,\\quad\\theta_{%d}=%.3g^{0}$$}',hData.selPole,real(tmpPol),imag(tmpPol),hData.selPole,tmpRad,hData.selPole,tmpAng);
    end;    
  elseif (hData.selZero > 0),
    tmpZer = hData.Zeros(hData.selZero);
    tmpRad = abs(tmpZer);
    tmpAng = angle(tmpZer)*180/pi;
    if (imag(tmpZer) < 0),
      hData.Str1 = sprintf('\\textsf{Selected zero: $$\\;z_{%d}=%.3g-j\\,%.3g,\\quad\\left|p_{%d}\\right|=%.3g,\\quad\\theta_{%d}=%.3g^{0}$$}',hData.selZero,real(tmpZer),abs(imag(tmpZer)),hData.selZero,tmpRad,hData.selZero,tmpAng);
    else
      hData.Str1 = sprintf('\\textsf{Selected zero: $$\\;z_{%d}=%.3g+j\\,%.3g,\\quad\\left|p_{%d}\\right|=%.3g,\\quad\\theta_{%d}=%.3g^{0}$$}',hData.selZero,real(tmpZer),imag(tmpZer),hData.selZero,tmpRad,hData.selZero,tmpAng);
    end;    
  else
    hData.Str1 = sprintf('\\textsf{Selected pole or zero: None}');
  end;    
  newData = hData;
  
function newData = computeSignals(hData)
  [hData.Hmag,hData.Hphs] = guiFreqz(hData.Zeros,hData.Poles,1,hData.Omg);
  [hData.Hmag2,hData.Hphs2] = guiFreqz(hData.Zeros,hData.Poles,1,hData.v8);
  newData = hData;
  
function newData = initPlots(hData)
  hData = computeSignals(hData);
  hData = computeStrings(hData);
  axes(hData.axes1);
  hData.P1 = plot(hData.Omg,hData.Hmag,...
     [hData.v8,hData.v8],[0,hData.Hmag2],'--',hData.v8,hData.Hmag2,'*');
  guiSetAxes(hData.axes1);
  set(hData.P1(1),'LineWidth',hData.lw);
  set(hData.P1(2),'LineWidth',hData.lw,'Color',hData.cCol);
  set(hData.P1(3),'Color',hData.cCol);
  guiPlotTitle('$\left|H\left(\Omega\right)\right|$');
  guiXLabel('$\Omega$ (rad)');
  guiYLabel('Magnitude');
  grid;
  axes(hData.axes2);
  hData.P2 = plot(hData.Omg,hData.Hphs,...
     [hData.v8,hData.v8],[0,hData.Hphs2],'--',hData.v8,hData.Hphs2,'*');
  axis([-pi,pi,-4,4]);
  set(hData.P2(1),'LineWidth',hData.lw);
  set(hData.P2(2),'LineWidth',hData.lw,'Color',hData.cCol);
  set(hData.P2(3),'Color',hData.cCol);
  guiPlotTitle('Phase of $\;H\left(\Omega\right)$');
  guiXLabel('$\Omega$ (rad)');
  guiYLabel('Phase (rad)');
  grid;
  axes(hData.axes3);
  hData.P3 = plot([-10,10],[0,0],'k-',[0,0],[-10,10],'k-',...
    hData.uCirc(1,:),hData.uCirc(2,:),'--',...
    [0,2*cos(hData.v8)],[0,2*sin(hData.v8)],'--');
  set(hData.axes3,'dataaspectratio',[1 1 1],'xlim',[-1.5 1.5],'ylim',[-1.5 1.5]);
  hold on;
  hData.PoleVec = [];
  if (length(hData.Poles) > 0),
    for n = 1:length(hData.Poles),
      tmpPol = hData.Poles(n);
      tmp1 = cos(hData.v8);
      tmp2 = sin(hData.v8);
      tmpArr = guiDrawArrow2(real(tmpPol),imag(tmpPol),tmp1,tmp2,0.05,0.05);
      tmpPlt = plot(tmpArr(1,:),tmpArr(2,:));
      set(tmpPlt,'Color',[0,0.7,0]);
      if (hData.v9 > 0),
        set(tmpPlt,'Visible','on');
      else  
        set(tmpPlt,'Visible','off');
      end;    
      hData.PoleVec = [hData.PoleVec,tmpPlt];
    end;
  end;  
  hData.ZeroVec = [];
  if (length(hData.Zeros) > 0),
    for n = 1:length(hData.Zeros),
      tmpZer = hData.Zeros(n);
      tmp1 = cos(hData.v8);
      tmp2 = sin(hData.v8);
      tmpArr = guiDrawArrow2(real(tmpZer),imag(tmpZer),tmp1,tmp2,0.05,0.05);
      tmpPlt = plot(tmpArr(1,:),tmpArr(2,:));
      set(tmpPlt,'Color',[1,0.6,0.4]);
      if (hData.v9 > 0),
        set(tmpPlt,'Visible','on');
      else  
        set(tmpPlt,'Visible','off');
      end;    
      hData.ZeroVec = [hData.ZeroVec,tmpPlt];
    end;  
  end;  
  hData.P4 = plot(real(hData.Poles),imag(hData.Poles),'bx');
  if (length(hData.Poles) > 0),
    set(hData.P4,'LineWidth',hData.lw);
  end;    
  hData.P5 = plot(real(hData.Zeros),imag(hData.Zeros),'bo');
  if (length(hData.Zeros) > 0),
    set(hData.P5,'LineWidth',hData.lw);
  end;    
  hData.P6 = plot(0,0,'rx','Visible','off');
  hData.P7 = plot(0,0,'ro','Visible','off');
  set(hData.P6,'LineWidth',hData.lw);
  set(hData.P7,'LineWidth',hData.lw);
  hold off;
  set(hData.P3(3),'Color',hData.aCol);
  set(hData.P3(4),'Color',hData.aCol);
  guiXLabel('$\textrm{Re}\left\{z\right\}$');
  guiYLabel('$\textrm{Im}\left\{z\right\}$');
  grid;
  set(hData.T1,'String',hData.Str1);
  hZoom = zoom;
  setAllowAxesZoom(hZoom,[hData.axes1,hData.axes2,hData.axesT{1},hData.axesF{1},hData.axesF2{1}],false);
  newData = hData;

function newData = updatePlots(hData)
  hData = computeSignals(hData);
  hData = computeStrings(hData);
  set(hData.P1(1),'YData',hData.Hmag);
  set(hData.P1(2),'XData',[hData.v8,hData.v8],'YData',[0,hData.Hmag2]);
  set(hData.P1(3),'XData',hData.v8,'YData',hData.Hmag2);
  set(hData.P2(1),'YData',hData.Hphs);
  set(hData.P2(2),'XData',[hData.v8,hData.v8],'YData',[0,hData.Hphs2]);
  set(hData.P2(3),'XData',hData.v8,'YData',hData.Hphs2);
  set(hData.P3(4),'XData',[0,2*cos(hData.v8)]);
  set(hData.P3(4),'YData',[0,2*sin(hData.v8)]);
  if (length(hData.Poles) > 0),
    for n = 1:length(hData.Poles),
      tmpPol = hData.Poles(n);  
      tmp1 = cos(hData.v8);
      tmp2 = sin(hData.v8);
      tmpArr = guiDrawArrow2(real(tmpPol),imag(tmpPol),tmp1,tmp2,0.05,0.05);
      tmpPlt = hData.PoleVec(n);
      set(tmpPlt,'XData',tmpArr(1,:));
      set(tmpPlt,'YData',tmpArr(2,:));
      if (hData.v9 > 0),
        set(tmpPlt,'Visible','on');
      else  
        set(tmpPlt,'Visible','off');
      end;
    end;  
  end;  
  if (length(hData.Zeros) > 0),
    for n = 1:length(hData.Zeros),
      tmpZer = hData.Zeros(n);
      tmp1 = cos(hData.v8);
      tmp2 = sin(hData.v8);
      tmpArr = guiDrawArrow2(real(tmpZer),imag(tmpZer),tmp1,tmp2,0.05,0.05);
      tmpPlt = hData.ZeroVec(n);
      set(tmpPlt,'XData',tmpArr(1,:));
      set(tmpPlt,'YData',tmpArr(2,:));
      set(tmpPlt,'Color',[1,0.6,0.4]);
      if (hData.v9 > 0),
        set(tmpPlt,'Visible','on');
      else  
        set(tmpPlt,'Visible','off');
      end;
    end;  
  end;
  set(hData.P4,'XData',real(hData.Poles));
  set(hData.P4,'YData',imag(hData.Poles));
  set(hData.P5,'XData',real(hData.Zeros));
  set(hData.P5,'YData',imag(hData.Zeros));
  if ((hData.selPole == 0)&(hData.selZero == 0)),
    set(hData.P6,'Visible','off');
    set(hData.P7,'Visible','off');
  elseif (hData.selPole > 0),
    tmpPol = hData.Poles(hData.selPole);
    set(hData.P6,'XData',real(tmpPol),'YData',imag(tmpPol),'Visible','on');
    set(hData.P7,'Visible','off');
  else  
    tmpZer = hData.Zeros(hData.selZero);
    set(hData.P7,'XData',real(tmpZer),'YData',imag(tmpZer),'Visible','on');
    set(hData.P6,'Visible','off');
  end;    
  set(hData.T1,'String',hData.Str1);
  newData = hData;  