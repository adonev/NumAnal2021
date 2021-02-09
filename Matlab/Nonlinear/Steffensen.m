clear % ALWAYS do this at the beginning (avoid clear all)
format long; format compact % Print more digits without white space

c=13.0;
f = @(x) x^2-c; % Defines a "function handle"

x_exact = sqrt(c) % Only one solution

tol=1e-14;
n_maxiter=100; % Max number of iterations
x_Newton=zeros(n_maxiter,1); % Babylonian/Newton's method iterates
x_Steffensen=zeros(n_maxiter,1); % Steffensen's method iterates

% ------------------------
% Babylonian/Newton method:

n_iter=n_maxiter; % If method does not converge to required tolerance
x=c/2; % Initial guess x[k=0]
for k=1:n_maxiter % Repeat calculation for k=1,2,3,...,100
   x = (x+c/x)/2; % Babylonian method
   x_Newton(k) = x; % Matlab starts indexing arrays at index=1
   if(abs(x^2-c)<tol)
      n_iter=k
      break
   end
end
x_bab = x_Newton(n_iter)
rel_error_bab = abs(x_bab-x_exact)/x_exact

% Make a plot:
figure(1); clf;
semilogy([1:n_iter], abs(x_Newton(1:n_iter)-x_exact), 'kd--');

% -----------------------
% Steffensen's method:
f_prime = 2*x_exact

%x0=x_exact+0.1; % First test method starting close to root
%x0=c/8; % Initial guess
x0=c/2; % Initial guess
%x0=7*c/8; % Initial guess
[x_stef,n_iter,x_Steffensen] = SteffensenMethod(f,x0,n_maxiter,tol);
rel_error_stef = abs(x_stef-x_exact)/x_exact

figure(1); hold on;
semilogy([1:n_iter], abs(x_Steffensen(1:n_iter)-x_exact), 'ro--');

legend('Newton/Babylon','Steffensen');

% -----------------------

function [x,n_iter,x_history] = SteffensenMethod(f,x,n,tol)

   n_iter=n;
   for k=1:n
            
      f_x=f(x); % First function evaluation      
      lambda = (f(x+f_x)-f_x)/f_x % Second function evaluation
      
      x = x - f_x/lambda;      
      x_history(k)=x;
      
      % Stop as soon as we have reached desired tlerance
      if(abs(f_x)<tol)
         n_iter=k; % How many iterations we took
         break % Already accurate enough
      end
            
   end
      
end
