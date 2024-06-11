% Script: mexdt_1_12a.m
sSource = audioSynthesizer;
sWriter = dsp.AudioFileWriter('Output sound.flac');
sWriter.SampleRate = sSource.SampleRate;
sWriter.FileFormat = 'FLAC';
 
while ~isDone(sSource)  % Loop through until done:
  x = step(sSource);    %   Get the next frame of data from synthesizer
  sWriter(x);           %   Write frame into file
end
release(sWriter);