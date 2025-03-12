% Script: mexdt_1_12a.m
sSource = audioSynthesizer;
sPlayer = audioDeviceWriter('SampleRate',sSource.SampleRate);
 
while ~isDone(sSource)  % Loop through until done:
  x = step(sSource);    %   Get the next frame of data from synthesizer
  sPlayer(x);           %   Play back the frame
end
release(sPlayer);