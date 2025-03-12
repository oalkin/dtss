% Script: mexdt_4_6a.m
x = @(t) exp(-abs(t));
t = [-4:0.001:4];
xnat = ss_natsamp(x,0.2,0.5,t);
plot(t,xnat);
xlabel('t (sec)');