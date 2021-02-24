clear % ALWAYS do this at the beginning (avoid clear all)
format long; format compact % Print more digits without white space

f = @(x,y) y - sqrt(3)/2*(x.^2); % Defines a "function handle"
g = @(x,y) 2*x.^2 + 8*y.^2 - 8;

% Even better is to use vector-valued functions of vector arguments:
h = @(z) [z(2) - sqrt(3)/2*(z(1).^2); 2*z(1).^2 + 8*z(2).^2 - 8];

%% Worksheet 2.1 & 2.2
% Plot the curves & Intersection points
figure(1);
hold on;
fimplicit(f, [-2, 2]);
fimplicit(g, [-2, 2]);
plot([-1, 1], [sqrt(3)/2, sqrt(3)/2], 'r*');

%% Worksheet 2.5
% Plot the Newtron iterations

J_2D = @(x, y) [- sqrt(3)*x, 1; 4*x, 16*y];  % Jacobian matrix in 2D
% This version is a matrix-valued function of a vector-valued argument
J = @(z) [- sqrt(3)*z(1), 1; 4*z(1), 16*z(2)];  % Jacobian matrix 

tol=1e-15;
n_maxiter=5; % Max number of iterations

%X0=[2;3]; % Initial guess
X0=[-1.5;2]; % Initial guess

[X,n_iter,X_history] = NewtonMethod2D(f,g,J_2D,X0,n_maxiter,tol);
plot(X_history(:, 1), X_history(:, 2), 'k^');

legend('F', 'G', 'Intersection points', 'Newton Iteration', 'Location', 'southwest');

% Try our vectorized version that works in any dimension!
fprintf('VECTORized version (better code, same result):\n\n');
[X,n_iter,X_history] = NewtonMethod(h,J,X0,n_maxiter,tol);


% -----------------------
% Worksheet 2.5
% This function only works in 2D
% Below is a better version that works in any number of dimensions
function [X,n_iter,X_history] = NewtonMethod2D(f,g,J,X,n,tol)

   n_iter=n;
   for k=1:n
      
      % First function evaluation 
      f_x=f(X(1), X(2));   
      g_x=g(X(1), X(2));
      
      % Stop as soon as we have reached desired tolerance
      if(norm([f_x, g_x],'inf')<tol)
         n_iter=k-1; % How many iterations we took
         break % Already accurate enough
      end
      
      % Worksheet 2.4
      X = X - J(X(1), X(2)) \ [f_x; g_x]

      X_history(k,:)=X';
                  
   end
      
end

% -----------------------
% Worksheet 2.5
% This function works in any dimension
function [X,n_iter,X_history] = NewtonMethod(h,J,X,n,tol)

   n_iter=n;
   for k=1:n
      
      % First function evaluation 
      h_X=h(X);
      
      % Stop as soon as we have reached desired tolerance
      if(norm(h_X,'inf')<tol)
         n_iter=k-1; % How many iterations we took
         break % Already accurate enough
      end
      
      % Worksheet 2.4
      X = X - J(X) \ h_X

      X_history(k,:)=X';
                  
   end
      
end
