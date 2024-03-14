function value = guiRef(ref)
% This function is for internal use by the interactive demo
% programs that accompany the text
%    "Signals and Systems: A MATLAB-Integrated Approach"
%    by Oktay Alkin.
% Copyright (c) 2014 by Oktay Alkin.
% All rights reserved.
%
  dict = {...
    'eq:saSOP1a',     '(1.1)';...           %sop_demo1
    'eq:saSOP1b',     '(1.2)';...
    'fig:saSOP1',     '1.4';...
    'fig:saSOP2',     '1.5';...
    'ex:0104',        '1.1';...             %end sop_demo_1
    'eq:saSOP1c',     '(1.3)';...           %sop_demo2
    'eq:saSOP2a',     '(1.7)';...  
    'eq:saSOP4',      '(1.11)';... 
    'fig:saSOP3',     '1.6';...  
    'fig:saSO3',      '1.15';...
    'ex:0105',        '1.2';...             %end sop_demo2 
    'eq:saUS1a',      '(1.16)';...          %imp_demo
    'eq:saUS4b',      '(1.25)';...
    'fig:saUS1a',     '1.21';...
    'fig:saUS2b',     '1.25';...            %end imp_demo
    'fig:saSO1',      '1.13';...            %stp_demo1&2
    'eq:saUS7a',      '(1.30)';...
    'eq:saUS7b',      '(1.31)';...
    'fig:saUS3a',     '1.27';...
    'fig:saUS4a',     '1.29';...
    'fig:saUS4b',     '1.30';...            %end stp_demo1&2
    'eq:saSin1',      '(1.44)';...          %sin_demo1
    'eq:saPH1b',      '(1.47)';...
    'fig:saPH1',      '1.41';...            %end sin_demo1
    'eq:impDecCT1',   '(1.48)';...          %id_demo
    'eq:impDecCT8',   '(1.54)';...
    'fig:impDec1',    '1.42';...            %end id_demo
    'ex:0102',        '1.4';...             %cexp_demo
    'eq:saSC1',       '(1.55)';...
    'eq:saSC3d',      '(1.60)';...
    'eq:ex0102b',     '(1.66)';...
    'eq:ex0102d',     '(1.68)';...
    'fig:ex0102',     '1.44';...            %end cexp_demo
    'ex:0108',        '1.5';...             %sin_demo2
    'ex:0109',        '1.6';...
    'eq:ex0108d',     '(1.69)';...
    'eq:ex0108k',     '(1.76)';...
    'fig:ex0109a',    '1.45';...
    'fig:ex0109b',    '1.46';...            %end sin_demo2
    'eq:saSC13',      '(1.78)';...          %exp_demo
    'eq:ex0103b',     '(1.82)';...
    'ex:0103',        '1.7';...
    'fig:ex0103',     '1.48';...            %end exp_demo
    'eq:saSC15',      '(1.83)';...          %tavg_demo
    'eq:saSC16',      '(1.84)';...
    'ex:0113',        '1.8';...
    'fig:ex0113',     '1.49';...            %and tavg_demo
    'eq:saPha1',      '(1.124)';...         %phs_demo
    'eq:saPha5',      '(1.128)';...
    'fig:saPha1',     '1.56';...
    'fig:saPha2',     '1.57';...            %end phs_demo
    'ex:0214',        '2.9';...
    'ex:0242',        '2.10';...
    'eq:ex0214a',     '(2.60)';...
    'eq:ex0242b',     '(2.65)';...
    'eq:ex0242f',     '(2.68)';...
    'fig:ex0214a',    '2.14';...
    'fig:ex0242b',    '2.17';...
    'ex:0215',        '2.13';...
    'eq:ex0215c',     '(2.90)';...
    'eq:ex0215d',     '(2.91)';...
    'fig:ex0215',     '2.22';...
    'ex:0216',        '2.14';...
    'ex:0217',        '2.15';...
    'eq:ex0216d',     '(2.92)';...
    'eq:ex0217p',     '(2.105)';...
    'fig:ex0216',     '2.23';...
    'fig:ex0217',     '2.26';...
    'eq:fdpCT2',      '(4.2)';...
    'eq:fdpCT33',     '(4.24)';...
    'fig:fdpCT1',     '4.1';...
    'fig:fdpCT4',     '4.4';...
    'ex:0217',        '2.15';...
    'eq:ex0217i',     '(2.104)';...
    'eq:ex0217p',     '(2.105)';...
    'fig:ex0217',     '2.26';...
    'ex:0218',        '2.16';...
    'eq:ex0218d',     '(2.108)';...
    'eq:ex0218f',     '(2.117)';...
    'fig:ex0218b',    '2.27';...
    'eq:tdConvCT11a', '(2.153)';...
    'eq:tdConvCT11b', '(2.154)';...
    'ex:0230',        '2.20';...
    'fig:ex0230',     '2.38';...
    'ex:0231',        '2.21';...
    'fig:ex0231a',    '2.39';...
    'ex:0232',        '2.22';...
    'fig:ex0232a',    '2.41';...
    'fig:ex0232b',    '2.43';...
    'ex:0234',        '2.23';...
    'fig:ex0234',     '2.44';...
    'ex:0221',        '3.3';...             %ma_demo1
    'eq:ex0221b',     '(3.11)';...
    'fig:ex0221a',    '3.6';...
    'fig:ex0221b',    '3.7';...
    'ex:0222',        '3.4';...             %ma_demo2
    'eq:ex0222a',     '(3.12)';...
    'fig:ex0222',     '3.8';...
    'ex:0223',        '3.5';...             %ma_demo3
    'eq:ex0223a',     '(3.13)';...
    'fig:ex0223',     '3.9';...
    'ex:0224',        '3.6';...             %es_demo
    'eq:ex0224a',     '(3.14)';...
    'fig:ex0224b',    '3.10';...
    'ex:0237',        '3.12';...            %nr_demo2
    'ex:0238',        '3.13';...
    'eq:ex0237e',     '(3.64)';...
    'eq:ex0238k',     '(3.77)';...
    'fig:ex0236',     '3.14';...
    'fig:ex0238b',    '3.18';...
    'ex:0243',        '3.15';...            %fr_demo2
    'eq:ex0243d',     '(3.80)';...
    'eq:ex0243t',     '(3.91)';...
    'fig:ex0243',     '3.20';...
    'eq:tdDiffDTBlock1', '(3.92)';...       %dgm_demo1
    'eq:ex0220m',        '(3.112)';...
    'ex:0220',           '3.16';...
    'fig:tdDiffDTBlock0','3.21';...
    'fig:ex0220',        '3.24';...
    
    'eq:tdConvDT7',   '(3.128)';...
    'eq:tdConvDT9',   '(3.130)';...
    'ex:0244',        '3.21';...
    'fig:ex0244a',    '3.29';...
    'fig:ex0244c',    '3.31';...
    'eq:fdpTFS18',    '(4.40)';...
    'eq:fdpTFS21',    '(4.43)';...
    'ex:0401',        '4.1';...
    'ex:0402',        '4.2';...
    'eq:ex0401f',     '(4.44)';...
    'eq:ex0402b',     '(4.45)';...
    'fig:ex0401',     '4.5';...
    'fig:ex0402',     '4.6';...
    'ex:0403',        '4.3';...
    'eq:ex0403e',     '(4.46)';...
    'fig:ex0403',     '4.7';...
    'ex:0404',        '4.4';...
    'fig:ex0404a',    '4.8';...
    'fig:ex0404b',    '4.9';...
    'ex:0405',        '4.5';...
    'eq:fdpEFS12',    '(4.71)';...
    'eq:fdpEFS13',    '(4.72)';...
    'eq:ex0405d',     '(4.73)';...
    'fig:ex0405b',    '4.11';...
    'fig:ex0405c',    '4.12';...
    'ex:0406',        '4.6';...
    'eq:ex0406e',     '(4.74)';...
    'eq:ex0406f',     '(4.75)';...
    'fig:ex0406a',    '4.13';...
    'fig:ex0406b',    '4.14';...
    'eq:saFT22',      '(4.137)';...
    'eq:saFT32',      '(4.143)';...
    'fig:saFT3',      '4.31';...
    'fig:saFT6',      '4.34';...
    'ex:0412',        '4.12';...
    'eq:ex0412c',     '(4.144)';...
    'eq:ex0412d',     '(4.145)';...
    'fig:ex0412a',    '4.35';...
    'fig:saFT9',      '4.37';...
    'ex:0414',        '4.14';...
    'eq:ex0414b',     '(4.153)';...
    'eq:ex0414e',     '(4.154)';...
    'fig:ex0414',     '4.42';...
    'ex:0415',        '4.15';...
    'eq:ex0415m',     '(4.155)';...
    'eq:ex0415n',     '(4.156)';...
    'fig:ex0415a',    '4.43';...
    'fig:ex0415c',    '4.45';...
    'ex:0416',        '4.16';...
    'eq:ex0416e',     '(4.157)';...
    'fig:ex0416a',    '4.46';...
    'fig:ex0416b',    '4.47';...
    'ex:0417',        '4.17';...
    'eq:ex0417f',     '(4.159)';...
    'fig:ex0417a',    '4.48';...
    'fig:ex0417b',    '4.49';...
    'ex:0418',        '4.18';...
    'eq:ex0418a',     '(4.160)';...
    'fig:ex0418a',    '4.50';...
    'fig:ex0418c',    '4.52';...
    'ex:0429',        '4.29';...
    'eq:ex0429e',     '(4.237)';...
    'eq:ex0429f',     '(4.238)';...
    'fig:ex0429a',    '4.64';...
    'fig:ex0429b',    '4.65';...
    'ex:0430',        '4.30';...
    'eq:ex0430f',     '(4.246)';...
    'eq:ex0430g',     '(4.247)';...
    'fig:ex0430a',    '4.66';...
    'fig:ex0430b',    '4.67';...
    'ex:0432',        '4.32';...
    'eq:ex0432d',     '(4.258)';...
    'eq:ex0432p',     '(4.262)';...
    'fig:ex0432a',    '4.70';...
    'fig:ex0432d',    '4.73';...
    'ex:0433',        '4.33';...
    'eq:ex0433e',     '(4.275)';...
    'eq:ex0433g',     '(4.276)';...
    'fig:ex0433a',    '4.74';...
    'fig:ex0433c',    '4.76';...
    'ex:0434',        '4.34';...
    'eq:saFTP160',    '(4.283)';...
    'eq:saFTP167',    '(4.290)';...
    'ex:0442',        '4.43';...
    'eq:ex0442c',     '(4.351)';...
    'fig:ex0442a',    '4.87';...
    'fig:ex0442b',    '4.88';...
    'ex:0444',        '4.45';...
    'eq:ex0444ab',    '(4.367)';...
    'eq:ex0444e',     '(4.370)';...
    'fig:ex0444a',    '4.89';...
    'fig:ex0444c',    '4.91';...
    'ex:0445',        '4.46';...
    'eq:ex0445b',     '(4.375)';...
    'eq:ex0445g',     '(4.380)';...
    'fig:ex0445a',    '4.92';...
    'fig:ex0445c',    '4.94';...
    'ex:0446',        '4.47';...
    'eq:ex0446c',     '(4.385)';...
    'eq:ex0446e',     '(4.387)';...
    'fig:ex0446a',    '4.95';...
    'ex:0506',        '5.5';...
    'eq:ex0506d',     '(5.25)';...
    'eq:ex0506e',     '(5.26)';...
    'fig:ex0506a',    '5.4';...
    'fig:ex0506b',    '5.5';...
    'ex:0507',        '5.10';...
    'eq:ex0507b',     '(5.86)';...
    'fig:ex0507a',    '5.18';...
    'fig:ex0507b',    '5.19';...
    'ex:0508',        '5.16';...
    'eq:ex0508d',     '(5.100)';...
    'fig:ex0508a',    '5.26';...
    'fig:ex0508b',    '5.27';...
    'ex:0511',        '5.12';...
    'eq:ex0511d',     '5.89';...
    'fig:ex0511a',    '5.20';...
    'ex:0513',        '5.13';...
    'eq:ex0513b',     '(5.90)';...
    'fig:ex0513a',    '5.21';...
    'fig:ex0513b',    '5.22';...
    'ex:0514',        '5.14';...
    'ex:0515',        '5.15';...
    'ex:0504',        '5.17';...
    'eq:ex0504j',     '(5.105)';...
    'fig:ex0504a',    '5.28';...
    'fig:ex0504b',    '5.29';...
    'fig:ex0514a',    '5.23';...
    'fig:ex0515',     '5.25';...
    'fig:dtftIns2',   '5.15';...
    'fig:dtftIns3',   '5.16';...
    'fig:dtftIns4',   '5.17';...
    'eq:dtftIns2',    '(5.78)';...
    'eq:dtftIns7',    '(5.83)';...
    'ex:0526',        '5.28';
    'eq:ex0526c',     '(5.224)';...
    'fig:ex0526',     '5.41';...
    'ex:0540',        '5.29';...            %sf_demo6
    'eq:FourDTPer12', '(5.231)';...
    'eq:FourDTPer17', '(5.236)';...
    'fig:ex0540',     '5.42';...            %end_sf_demo6
    'eq:FourDFT31',   '(5.260)';...         %pf_demo
    'eq:ex0532b',     '(5.264)';...
    'ex:0532',        '5.34';...
    'fig:ex0532a',    '5.47';...
    'eq:ApproxFT1',   '(5.307)';...         %dft_demo           
    'eq:ApproxFT8',   '(5.312)';...         %end_dft_demo
    'eq:IdealSamp1',  '(6.4)';...           %smp1_demo
    'eq:IdealSamp9a', '(6.13)';... 
    'fig:IdealSamp1', '6.2';... 
    'fig:IdealSamp3', '6.4';...             %end smp1_demo
    'ex:0601',        '6.1';...             %smp_demo2
    'fig:ex0601a',    '6.6';...
    'fig:ex0601b',    '6.7';...             %end smp_demo2
    'ex:0602',        '6.2';...             %smp_demo3
    'ex:0603',        '6.3';...
    'fig:ex0602a',    '6.12';...
    'fig:ex0603c',    '6.16';...            %end_smp_demo3
    'eq:LapIntro6',   '(4.6)';...           %app_laplace1
    'eq:LapIntro9',   '(4.8)';...
    'fig:LapIntro1a', '4.1';...
    'fig:LapIntro1b', '4.2';...
    'fig:LapIntro3',  '4.4';...             %end_app_laplace1
    'ex:0707',        '7.7';...             %lap_demo2
    'eq:ex0707d',     '(7.28)';...
    'eq:ex0707m',     '(7.31)';...
    'fig:ex0707a',    '7.14';...
    'fig:ex0707d',    '7.17';...            %end_lap_demo2
    'eq:LapSys45',    '(7.142)';...         %pz_demo1
    'eq:LapSys47',    '(7.144)';...
    'fig:LapSys2',    '7.40';...
    'fig:LapSys4',    '7.42';...            %end_pz_demo1
    'eq:ztIntro4ca',  '(8.9)';...           %zt_demo1
    'eq:ztIntro4cd',  '(8.12)';...
    'fig:ztIntro2',   '8.3';...             %end_zt_demo1 
    'ex:0815',        '8.8';...             %zt_demo2
    'eq:ex0815b',     '(8.29)';...
    'eq:ex0815i',     '(8.34)';...
    'fig:ex0815f',    '8.10';...
    'fig:ex0815e',    '8.14';...            %end_zt_demo2
    'eq:ztSys55',     '(8.259)';...         %pz_demo2
    'eq:ztSys57',     '(8.261)';...
    'fig:ztSystem1',  '8.32';...
    'fig:ztSystem5',  '8.38';...            %end_pz_demo2
    'ex:1001',        '10.1';...
    'eq:FiltDist1',   '(10.5)';...
    'eq:lsDT19',      '(10.28)';...
    'fig:FiltDist1',  '10.3';...
    'fig:ex1001b',    '10.5';...
    'eq:FiltIdeal1',  '(10.29)';...
    'eq:FiltIdeal3',  '(10.31)';...
    'eq:FiltIdeal4',  '(10.32)';...
    'fig:FiltIdeal1', '10.6';...
    'fig:FiltIdeal5', '10.10';...
    'eq:FiltIdeal2',  '(10.30)';...
    'eq:FiltIdeal5',  '(10.33)';...
    'eq:FiltIdeal10', '(10.38)'
    'fig:FiltIdeal2', '10.7';...
    'fig:FiltIdeal5a','10.11';...
    'fig:FiltIdeal6', '10.12';...
    'eq:ButtLP1',     '(10.45)';...
    'eq:ButtLP13',    '(10.57)';...
    'fig:ButtLP1',    '10.15';...
    'fig:ButtLP2',    '10.16';...
    'eq:ChebLP1',     '(10.66)';...
    'eq:ChebLP11',    '(10.70)';...
    'fig:ChebPoly1',  '10.19';...
    'fig:ChebPoly3',  '10.21';...
    'eq:ChebLP71',    '(10.102)';...
    'eq:ChebLP78c',   '(10.112)';...
    'fig:ChebFilt1',  '10.23';...
    'eq:IIRDes1',     '(10.132)';...        %impinv_demo
    'eq:IIRDes11a',   '(10.143)';...
    'fig:ImpInvar1',  '10.29';...           %end_impinv_demo
    'eq:IIRDes14',    '(10.146)';...        %biln_demo
    'eq:IIRDes29',    '(10.160)';...
    'fig:IIRBilinear1','10.31';...
    'fig:IIRBilinear2','10.32';...          %end_biln_demo
    'eq:amSig1',      '(11.3)';...
    'eq:amModIndex',  '(11.6)';...
    'fig:amWave1',    '11.4';...
    'fig:amWave2',    '11.5';...
    'ex:1101',        '11.1';...
    'eq:ex1101b',     '(11.7)';...
    'eq:ex1101d',     '(11.9)';...
    'fig:ex1101a',    '11.6';...
    'eq:amSpec2',     '(11.10)';...
    'fig:amSpec1',    '11.7';...
    'ex:1102',        '11.2';...
    'eq:ex1102b',     '(11.11)';...
    'eq:ex1102e',     '(11.13)';...
    'fig:ex1102a',    '11.8';...
    'ex:1104',        '11.4';...            %am_demo5
    'eq:ex1104b',     '(11.15)';...
    'eq:ex1104q',     '(11.29)';...
    'fig:ex1104a',    '11.12';...
    'eq:amPhas17',    '(11.30)';...         %am_demo6
    'fig:ex1104b',    '11.13';...
    'eq:amSwMod1',    '(11.36)';...
    'eq:amSwMod9',    '(11.45)';...
    'fig:amGen2',     '11.15';...
    'fig:amGen5',     '11.18';...
    'eq:amGen22',     '(11.46)';...
    'eq:amGen26',     '(11.51)';...
    'fig:amGen7',     '11.19';...
    'fig:amGen8',     '11.20';...
    'tab:amGen1',     '11.1';...
    'ex:amDemod3',    '11.7';...
    'eq:amDemod1',    '(11.52)';...
    'eq:amDemod21',   '(11.65)';...
    'fig:amDemod1',   '11.21';...
    'fig:amDemod3',   '11.23';...
    'eq:amSwMod1',    '(11.36)';...
    'eq:amSwMod9',    '(11.45)';...
    'fig:amGen2',     '11.15';...
    'fig:amGen5',     '11.18';...
    'eq:cwDSB1',      '(11.68)';...
    'fig:cwDSB1',     '11.26';...
    'ex:1108',        '11.8';...
    'eq:ex1108b',     '(11.69)';...
    'eq:ex1108c',     '(11.70)';...
    'fig:ex1108a',    '11.27';...
    'eq:dsbSpec2',    '(11.71)';...
    'fig:dsbSpec1',   '11.28';...
    'ex:1109',        '11.9';...
    'eq:ex1109a',     '(11.72)';...
    'eq:ex1109c',     '(11.73)';...
    'fig:ex1109a',    '11.29'
  };
  value = '';
  key = find(strcmp(ref,dict(:,1)),1,'first');
  if (key > 0),
    value = dict{key,2};
  end;
end  