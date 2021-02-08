clear % ALWAYS do this at the beginning (avoid clear all)
format long; format compact % Print more digits without white space

c=13.0;
f = @(x) x^2-c; % Defines a "function handle"

x_exact = sqrt(c) % Only one solution

% We know 0<x<c since c>1
[x,a,b] = SimpleBisection(f,0,c,10)

tol=1e-3
n_estimated = ceil(log2(c/tol))
[x,a,b] = SimpleBisection(f,0,c,1000,tol)
error = abs(x-x_exact)

function [x,a,b] = SimpleBisection(f,a,b,n,tol)

   f_a=f(a);
   f_b=f(b);
   for k=0:n-1

      x=(a+b)/2; % midpoint of interval

      % Stop as soon as we have reached desired tlerance
      if exist('tol','var') % tol(erance) is an optional argument
         if((b-a)/2<tol)
            n_iter=k % Print out how many iterations we took
            break % Already accurate enough
         end
      end      
                     
      f_x=f(x); % Compute f(x) only ONCE per iteration
      
      if(f_x*f_a<0)
         b=x; f_b=f_x;
      else % Should this be elseif(f_x*f_b<0) instead?
         a=x; f_a=f_x;
      end
      
   end
   
   % True answer is somewhere in [a,b]      
   x=(a+b)/2; % Best guess for answer
   
end
