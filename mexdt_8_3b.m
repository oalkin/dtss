% Script: mexdt_8_3b.m
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('GuitarA2.flac');
% Create an "audio player" object
sPlayer = audioDeviceWriter('SampleRate',sReader.SampleRate); 
%------------------------------------------------------------
% Design resonant bandpass filters
fs = sReader.SampleRate;
Omgb = 2*pi*60/fs;    % Bandwidth for all four filters
Omg01 = 2*pi*110/fs;  % Center frequency for filter 1
Omg02 = 2*pi*330/fs;  % Center frequency for filter 2
Omg03 = 2*pi*550/fs;  % Center frequency for filter 3
Omg04 = 2*pi*770/fs;  % Center frequency for filter 4
[r1,gain1] = ss_respar(Omg01,Omgb);  % Parameters for filter 1
[r2,gain2] = ss_respar(Omg02,Omgb);  % Parameters for filter 2
[r3,gain3] = ss_respar(Omg03,Omgb);  % Parameters for filter 3
[r4,gain4] = ss_respar(Omg04,Omgb);  % Parameters for filter 4
%------------------------------------------------------------
nChannels = info(sReader).NumChannels;  % Number of channels
buffer1 = zeros(2,nChannels);           % Buffer for filter 1 
buffer2 = zeros(2,nChannels);           % Buffer for filter 2
buffer3 = zeros(2,nChannels);           % Buffer for filter 3
buffer4 = zeros(2,nChannels);           % Buffer for filter 4
while ~isDone(sReader)                   
  x = sReader();                                
  [w1,buffer1] = ss_resf(x,Omg01,r1,gain1,buffer1);
  [w2,buffer2] = ss_resf(x,Omg02,r2,gain2,buffer2);
  [w3,buffer3] = ss_resf(x,Omg03,r3,gain3,buffer3);
  [w4,buffer4] = ss_resf(x,Omg04,r4,gain4,buffer4);
  y = w1+w2+w3+w4;                      % Compute output frame
  sPlayer(y);
end
release(sReader);  % We are finished with the input audio file
release(sPlayer);  % We are finished with the audio output device