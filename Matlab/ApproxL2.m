clear;
format long; format compact;
close all

%% Least-squares approximation in Chebfun
% Alex Townsend, October 2013
% Modified by A. Donev

% (Chebfun example approx/BestL2Approximation.m)
% [Tags: #least squares]

addpath('chebfun'); % Must first download chebfun package

% The `polyfit` command in Chebfun returns the best $L^2$ approximation of a
% given degree to a chebfun:
% help chebfun/polyfit

% Runge phenomenon is avoided if we use L2 approximation:
chebfunpref.setDefaults('domain',[-1 1]);
x = chebfun('x');
n = 10; % Polynomial of degree n
f = 1./(1+25*x.^2);                  % Runge function on [-1,1]
pn = polyfit(f,n);
figure(1); clf;
plot(f);
hold on;
plot(pn,'r');
title(['Best L^2 approx to Runge function of degree ',int2str(n)]); 
hold off;

% sin function
chebfunpref.setDefaults('domain',[0 pi]);
n = 2;
f = chebfun(@(t) sin(t));
pn = polyfit(f,n);
figure(2); clf;
plot(f);
hold on;
plot(pn,'r');
title('Best quadratic L^2 approx to sin(x)');
hold off;


%% References
%
% 1. N. Hale and A. Townsend, A fast, simple, and stable Chebyshev-Legendre
%    transform using an asymptotic formula, _SIAM Journal on Scientific
%    Computing_, 32 (2014), A148-A167.
%
% 2. M. Powell, _Approximation Theory and Methods_, Cambridge University
%    Press, 1981.
%
% 3. A. Townsend and N. Hale, A fast Chebyshev-Legendre transform, Chebfun
%    Example, August 2013.
