% Script: mexdt_3_2a.m
x = [0,1,2,3,4]
c = ss_dtfs(x,[0:4])
x = ss_invdtfs(c,[-12:15])
stem([-12:15],real(x)); grid;