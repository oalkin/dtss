% Script: mexdt_6_1.m
A = [0,-0.5;0.25,0.75];
B = [2;1];
C = [3,1];
D = [0];
z = sym('z');      % Symbolic variable
tmp = z*eye(2)-A;
rsm = z*inv(tmp)   % Resonant matrix
H = C*rsm*B+D      % Eqn. (6.51)