% Script: mexdt_8_5b.m
load noisyECG.mat
plot(t(501:1000),x(501:1000)); grid;
axis([1.8,2.7,0.85,1.25]);
xlabel('Time (sec)');
ylabel('Amplitude');