% Script: mexdt_5_14a_Alt.m
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('AG_Duet_22050_Hz.flac','ReadRange',[1,661500]);
% Create an "audio file writer" object
sWriter = dsp.AudioFileWriter('Output sound.flac');
sWriter.SampleRate = sReader.SampleRate;
sWriter.FileFormat = 'FLAC';
%------------------------------------------------------------
L1 = 821;    r1 = 0.85;   % Parameters for comb filter 1
L2 = 613;    r2 = 0.75;   % Parameters for comb filter 2
L3 = 113;    r3 = 0.7;    % Parameters for allpass filter 1
L4 = 41;     r4 = 0.7;    % Parameters for allpass filter 2 
%------------------------------------------------------------
numChannels = info(sReader).NumChannels;  % Number of channels
bufferCF1 = zeros(L1,numChannels);        % Buffer for comb filter 1 
bufferCF2 = zeros(L2,numChannels);        % Buffer for comb filter 2
bufferAP1 = zeros(L3,numChannels);        % Buffer for allpass filter 1  
bufferAP2 = zeros(L4,numChannels);        % Buffer for allpass filter 2
% Refer to Fig. 5.72 for the loop
while ~isDone(sReader)  
  x = sReader();
  [w1,bufferCF1] = ss_combf(x,r1,bufferCF1);
  [w2,bufferCF2] = ss_combf(x,r2,bufferCF2);
  [w3,bufferAP1] = ss_allpassf((w1+w2)*0.4,r3,bufferAP1);
  [y,bufferAP2] = ss_allpassf(w3,r4,bufferAP2);
  sWriter(y);                             % Write frame to file
end
release(sReader);  % We are finished with the input audio file
release(sWriter);  % Release audio writer object