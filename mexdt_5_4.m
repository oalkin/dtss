% Script: mexdt_5_4.m
A = [5,7,0,3,-2];        % Coefficients a_4, ..., a_0
B = [8,6,-3,1,-4,2];     % Coefficients b_5, ..., b_0
tmpA = fliplr(A);        % Coefficients a_0, ..., a_4
tmpB = fliplr(B);        % Coefficients b_0, ..., a_5
tmpC = conv(tmpA,tmpB);  % Coefficients c_0, ..., a_9
C = fliplr(tmpC)         % Coefficients c_9, ..., c_0