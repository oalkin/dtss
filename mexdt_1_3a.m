% Script: mexdt_1_3a.m
x = [];                % Start with empty vector
for n=-5:10            % Loop over indices
  x = [x,ss_imp(n)];   % Append each value to the vector
end
stem([-5:10],x);