clear % ALWAYS do this at the beginning (avoid clear all)
format long; format compact % Print more digits without white space

c=5743656.17285627454549697
sqrt_c=sqrt(c)

x=1e3; % Initial guess
x = (x+c/x)/2
x = (x+c/x)/2
x = (x+c/x)/2
x = (x+c/x)/2

% Let's save lots of typing and use a LOOP
x=1e3; % Initial guess
for k=1:20 % Repeat calculation for k=1,2,3,...,100
   rel_error = (x-sqrt_c)/sqrt_c
   x = (x+c/x)/2; % Babylonian method
end

% Did we really get the answer exactly (error=0)?   
test_1 = sqrt_c^2
test_2 = x^2
fprintf('c=   5.74365617285627454549697e+06\n')
