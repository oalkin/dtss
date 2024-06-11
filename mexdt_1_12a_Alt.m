% Script: mexdt_1_12a_Alt.m
sSource = audioSynthesizer;
sWriter = dsp.AudioFileWriter('Output_sound.flac');
sWriter.SampleRate = sSource.SampleRate;
sWriter.FileFormat = 'FLAC';
 
while ~isDone(sSource)  % Loop through until done:
  x = step(sSource);    %   Get the next frame of data from synthesizer
  sWriter(x);           %   Write frame into file
end
release(sWriter);
[data,fs] = audioread("Output_sound.flac");
sound(data,fs);