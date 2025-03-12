% Script: mexdt_4_6b.m
x = @(t) exp(-abs(t));
t = [-4:0.001:4];
xzoh = ss_zohsamp(x,0.2,0.5,t);
plot(t,xzoh);
xlabel('t (sec)');