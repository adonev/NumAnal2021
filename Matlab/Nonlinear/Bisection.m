c=13.0;
f = @(x) x^2-c; % Defines a "function handle"

x_exact = sqrt(c) % Only one solution
% We know 0<x<c
[x,a,b] = Bisection(f,0,c,100)

function [x,a,b] = Bisection(f,a,b,n)

   f_a=f(a);
   f_b=f(b);
   for k=0:n-1
      x=(a+b)/2;
      f_x=f(x);
      if(f_x*f_a<0)
         a=x; f_a=f_x;
      else   
         b=x; f_b=f_x;
      end
   end
   x=(a+b)/2; % Best guess for answer
   % But true answer is somewhere in [a,b]      
   
end
