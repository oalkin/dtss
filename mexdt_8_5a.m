% Script: mexdt_8_5a.m
load noisyECG.mat
plot(t,x); grid;
axis([0,10,0.85,1.25]);
xlabel('Time (sec)');
ylabel('Amplitude');