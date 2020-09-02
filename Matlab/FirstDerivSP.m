format compact; format long
clear all;

u=eps('single')/2;

%d/dx(cos(pi/4)) = -sqrt(2)/2;
x0 = single(pi/4);
exact_ans = single(-sqrt(2)/2);

N=100;
%logarithmic scale
h = single(logspace(-8,0,N));

%calculate one-sided difference
f_prime1 = (cos(x0+h)-cos(x0))./h;

%calculate centered difference
f_prime2 = (cos(x0+h)-cos(x0-h))./h/2;

%calculate relative errors
err1 = abs((f_prime1 - exact_ans)/exact_ans);
err2 = abs((f_prime2 - exact_ans)/exact_ans);

%calculate estimated errors
trunc1 = h/2;
trunc2 = h.^2/6;
round = u./h; % The rounding error is about the same in both cases

figure(1); clf;
loglog(h,err1,'or', h,trunc1,'--r');
hold on;
loglog(h,err2,'sb', h,trunc2,'--b');
loglog(h,round,'-g');
legend('One-sided difference','Truncation error (one-sided)',...
       'Two-sided difference','Truncation error (two-sided)',...
       'Rounding error (both)',...
       'Location','North');

axis([1E-8,1, 1E-6,1]);
xlabel('h'); ylabel('Relative Error')
title('Single-precision first derivative')
