% Script: mexdt_8_16d.m
x = [1;zeros(44100,1)];              % Generate a unit impulse sequence
buffer = zeros(66,1);                % Buffer for 66-sample delay
y = ss_tpsf(x,0.4391,0.995,buffer);  % Run through tunable plucked string filter
sound(y,22050);                      % Play back the sound