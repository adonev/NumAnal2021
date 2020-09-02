% f=@mfile uses a function in an m-file

% Parameterized functions are created with:
a = 1; b = 2;
f = @(x)   a*sin(x) + b*exp(-x^2/2) ; % Handle

figure(1)
ezplot(f,[-5,5]); grid

x1=fzero(f, [-2,0])
[x2,f2]=fzero(f, 2.0)
