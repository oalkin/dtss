% Script: mexdt_3_2b.m
xa=[ones(1,4),zeros(1,33),ones(1,3)];
ca = ss_dtfs(xa,[0:39]);
stem([0:39],real(ca)); grid;