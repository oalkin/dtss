% Script: mexdt_5_14b.m
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('AG_Duet_22050_Hz.flac','ReadRange',[1,661500]);
% Create an "audio player" object
sPlayer = audioDeviceWriter('SampleRate',sReader.SampleRate); 
%------------------------------------------------------------
L1 = 901;   r1 = 0.805;   % Parameters for comb filter 1
L2 = 778;   r2 = 0.827;   % Parameters for comb filter 2
L3 = 1011;  r3 = 0.783;   % Parameters for allpass filter 1
L4 = 1123;  r4 = 0.764;   % Parameters for allpass filter 2 
L5 = 125;   r5 = 0.7;
L6 = 42;    r6 = 0.7;
L7 = 12;    r7 = 0.7;
%------------------------------------------------------------
numChannels = info(sReader).NumChannels;  % Number of channels
bufferCF1 = zeros(L1,numChannels);        % Buffer for comb filter 1 
bufferCF2 = zeros(L2,numChannels);        % Buffer for comb filter 2
bufferCF3 = zeros(L3,numChannels);        % Buffer for comb filter 3
bufferCF4 = zeros(L4,numChannels);        % Buffer for comb filter 4
bufferAP1 = zeros(L5,numChannels);        % Buffer for allpass filter 1  
bufferAP2 = zeros(L6,numChannels);        % Buffer for allpass filter 2
bufferAP3 = zeros(L7,numChannels);        % Buffer for allpass filter 3
% Refer to Fig. 5.72 for the loop
while ~isDone(sReader)                   
  x = sReader();                                
  [w1,bufferCF1] = ss_combf(x,r1,bufferCF1);
  [w2,bufferCF2] = ss_combf(x,r2,bufferCF2);
  [w3,bufferCF3] = ss_combf(x,r3,bufferCF3);
  [w4,bufferCF4] = ss_combf(x,r4,bufferCF4);
  [w5,bufferAP1] = ss_allpassf((w1+w2+w3+w4)*0.2,r5,bufferAP1);
  [w6,bufferAP2] = ss_allpassf(w5,r6,bufferAP2);
  [y,bufferAP3] = ss_allpassf(w6,r7,bufferAP3);
  y(:,2) = -y(:,2);                       % Negate right channel
  sPlayer(y);
end
release(sReader);  % We are finished with the input audio file
release(sPlayer);  % We are finished with the audio output device