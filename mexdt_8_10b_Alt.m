% Script: mexdt_8_10b_Alt.m
% Redesign the 10th-order Chebyshev bandpass filter to obtain SOS
[zrs,pls,gain] = cheby1(5,1,[0.26,0.48])  % Alternative syntax for cheby1()
[sos,gain] = zp2sos(zrs,pls,gain)         % Convert to SOS
sos(:,1:3) = sos(:,1:3)*(gain^(1/5));     % Absorb gain factor into each section
%--------------------------------------------------------------
% Create an "audio file reader" object
sReader = dsp.AudioFileReader('Ballad_22050_Hz.flac','ReadRange',[1,661500]);
% Create an "audio file writer" object
sWriter = dsp.AudioFileWriter('Output_sound.flac');
sWriter.SampleRate = sReader.SampleRate;
sWriter.FileFormat = 'FLAC';
nChannels = info(sReader).NumChannels;    % Number of channels
states1 = zeros(2,nChannels);             % States for section 1 
states2 = zeros(2,nChannels);             % States for section 2
states3 = zeros(2,nChannels);             % States for section 3
states4 = zeros(2,nChannels);             % States for section 4
states5 = zeros(2,nChannels);             % States for section 5
while ~isDone(sReader)                   
  x = sReader();                                
  [w1,states1] = ss_iir2f(x,sos(1,:),states1);
  [w2,states2] = ss_iir2f(w1,sos(2,:),states2);
  [w3,states3] = ss_iir2f(w2,sos(3,:),states3);
  [w4,states4] = ss_iir2f(w3,sos(4,:),states4);
  [y,states5]  = ss_iir2f(w4,sos(5,:),states5);
  sWriter(y);
end
release(sReader);  % We are finished with the input audio file
release(sWriter);  % We are finished with the audio file writer