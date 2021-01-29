clear % ALWAYS do this at the beginning (avoid clear all)
format long; format compact % Print more digits without white space

c=2.0;
f = @(x) x^2-c; % Defines a "function handle"

x_exact = sqrt(c) % Only one solution

tol=1e-12;
n_maxiter=100; % Max number of iterations
x_bisect=zeros(n_maxiter,1);
x_secant=zeros(n_maxiter,1);
x_falsi=zeros(n_maxiter,1);

% ------------------------
x_old=0; % x[k-1]
f_old=f(x_old);
x=c; % x[k]
n_iter=n_maxiter;
for k=1:n_iter
   f_x = f(x);
   x_new = x-f_x*(x-x_old)/(f_x-f_old);
   
   f_old=f_x;
   x_old=x;   
   x=x_new;
   
   x_secant(k)=x;
   if(abs(f_old)<tol)
      n_iter=k
      break
   end 
end     
x_secant(1:n_iter)

figure(1); clf;
semilogy([1:n_iter], abs(x_secant(1:n_iter)-x_exact), 'kd--');

% -----------------------

% We know 0<x<c and f(0)*f(c)<0 (why?)

% Simple bisection:
[x_bi,a,b,n_iter,x_bisect] = SecantBisection(f,0,c,n_maxiter,false,tol);
figure(1); hold on;
semilogy([1:n_iter], abs(x_bisect(1:n_iter)-x_exact), 'ro--');

% Secant+"bisection", called method of Regula Falsi (false position)
[x_falsi,a,b,n_iter,x_secant] = SecantBisection(f,0,c,n_maxiter,true,tol);
figure(1); hold on;
semilogy([1:n_iter], abs(x_secant(1:n_iter)-x_exact), 'bs--');

% Newton method is same as Babylonian method

% Exercise: Add it to the plot by yourselves

legend('Secant','Bisection','Reg. Falsi');

function [x,a,b,n_iter,x_history] = SecantBisection(f,a,b,n,secant,tol)

   f_a=f(a);
   f_b=f(b);
   n_iter=n;
   for k=1:n
   
      if(secant) % Set x[k]=a and x[k-a]=b (or vice versa)
         x=a-f_a*(a-b)/(f_a-f_b); % secant method
      else
         x=(a+b)/2; % midpoint of interval
      end
      x_history(k)=x;
            
      f_x=f(x); % Compute f(x) only ONCE per iteration
      
      % Stop as soon as we have reached desired tlerance
      if(abs(f_x)<tol)
         n_iter=k; % How many iterations we took
         break % Already accurate enough
      end
      
      if(f_x*f_a<0)
         b=x; f_b=f_x;
      else % Should this be elseif(f_x*f_b<0) instead?
         a=x; f_a=f_x;
      end
      
   end
      
end
