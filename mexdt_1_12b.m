% Script: mexdt_1_12b.m
%---------------------------------------------------------------------
% WARNING: Online version of MATLAB does not support the 
% 'audioDeviceWriter' object used for frame-by-frame playback.
% Consequently, this script can only be executed on a local
% installation of MATLAB. For the online version of MATLAB, use
% the alternate script 'mex_1_12b_Alt.m' instead.
%---------------------------------------------------------------------
sheetMusic = {
  "F4",  1.5, 1;
  "rest",0.5, 1;
  "A4",  1.5, 1;
  "F4",  0.5, 1;
  "C5",  1,   1;
  "Bb4", 0.5, 1;
  "A4",  0.5, 1;
  "G4",  0.5, 1;
  "F4",  0.5, 1;
  "F#4", 1,   1;
  "G4",  1,   1;
  "rest",2,   1;
  "C4",  2,   1;
  "E4",  1,   1;
  "G4",  1,   1;
  "Bb4", 2.5, 1;
  "D5",  0.5, 1;
  "C5",  0.5, 1;
  "Bb4", 0.5, 1;
  "G#4", 0.5, 1;
  "A4",  0.5, 1;
  "A4",  1,   1;
  "rest",2,   1  }

sSource = audioSynthesizer('Notes',sheetMusic,'BeatsPerMin',100);
sPlayer = audioDeviceWriter('SampleRate',sSource.SampleRate);
 
while ~isDone(sSource)  % Loop through until done:
  x = step(sSource);    %   Get the next frame of data from synthesizer
  sPlayer(x);           %   Play back the frame
end
release(sPlayer);