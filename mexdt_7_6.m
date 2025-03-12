% Script: mexdt_7_6.m
x = randn(8,1)+j*randn(8,1)    % Generate complex random signal
xE = 0.5*(x+conj(ss_crev(x)))  % Conjugate symmetric component
xO = 0.5*(x-conj(ss_crev(x)))  % Conjugate antisymmetric component