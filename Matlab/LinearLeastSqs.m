clc;
clear;
format long; format compact;

%% AD: Notation used here is (taken from student solution)
% unknown coefficients [a,b,c] -> p; 
% Data t -> x
% Data I(t) -> y(x)
% AD: I suggest sticking to original notation from lectures/assignment when possible

%% data points
x = 1:1:10; 
y = [14; 20; 21; 24; 15; 45; 67; 150; 422; 987];
m = length(x); % AD (best to get m from y to ensure consistency with actual input)

% AD: Observe how only this line needs to be changed to change the fitting formula!
f_quad = @(x) [ones(size(x)), x, x.^2];
f_exp = @(x) [ones(size(x)), x, exp(x)];

% AD: Part c+d: Do actual fitting and compute residual
[p_quad,y_quad] = LinearLeastSq(x,y,f_quad);
residual_quad = norm(y-y_quad,2)^2
[p_exp,y_exp] = LinearLeastSq(x,y,f_exp);
residual_exp = norm(y-y_exp,2)^2

% Part c plotting
% AD: Come back to this line after you look at the function LinearLeastSq
% For plotting we want to be able to evaluate the fit at a finer grid
% Observe how we do not need to repeat f(t) ever again!
y_fit_x = @(x,p,f) f(x')*p; % y=A*x but now A has more rows

figure(1); clf; grid on; 
plot(x, y, 'sk'); hold on;

plot_x = 1:0.1:10; % Put more points for plotting fits with a smooth curve

% AD: Quadratic fit
plot(plot_x, y_fit_x(plot_x, p_quad, f_quad), 'r-'); hold on;
% AD: Exponential fit
plot(plot_x, y_fit_x(plot_x, p_exp, f_exp), 'b--'); hold on;

% ---------------
% AD: Let's see how easy it is to do a cubic fit instead of quadratic
% We will learn after midterm how to do polynomial fitting more efficiently/easily
% In Matlab you can use the built-in function polyfit to do this
% Part a/b first half
f_cub = @(x) [ones(size(x)), x, x.^2, x.^3];
[p_cub,y_cub] = LinearLeastSq(x,y,f_cub);
residual_cub = norm(y-y_cub,2)^2
plot(plot_x, y_fit_x(plot_x, p_cub, f_cub), 'g-.'); hold on;

%--------
xlabel('x');
ylabel('y');
legend('Data', 'Quadratic', 'Exponential', 'Cubic');

%------------------------------------------------

% Part c fitting, general for any formula
% AD: Wrote one function that can do any fitting, avoiding duplicating code
% once for quadratic and once for exponential
function [p,y_fit] = LinearLeastSq(x,y,f)

   % Part a/b second half
   A = f(x'); % AD: Observe how this uses no loops only vectorized/array syntax

   % Simplest method to solve is using backslash:
   p = A\y %% backslash

   %% AD: Observe how I can evaluate the fit without repeating the formula again
   %% y=A*x regardless of the fitting formula!
   y_fit = A*p;

   %% Confirm other methods give the same answer:
   
   %% QR: 
   [Q, R] = qr(A);
   p_qr = R\(Q'*y) %% QR Factorization

   % Normal equations:
   %% (A' * A) * x = (A' * b)
   %% B * x = Y
   B = A'*A;
   z = A'*y;
   p_norm_eq = B\z % Optimal solution
      
end

