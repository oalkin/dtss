% Script: mexdt_8_16a.m
x = [1;zeros(22049,1)];        % Generate a unit impulse sequence
buffer = zeros(100,1);         % Buffer for 100-sample delay
y = ss_combf(x,0.995,buffer);  % Run through comb filter
sound(y,22050);                % Play back the sound