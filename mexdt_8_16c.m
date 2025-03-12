% Script: mexdt_8_16c.m
x = [1;zeros(44100,1)];       % Generate a unit impulse sequence
buffer = zeros(100,1);        % Buffer for 100-sample delay
y = ss_psf(x,0.995,buffer);   % Run through plucked string filter
sound(y,22050);               % Play back the sound