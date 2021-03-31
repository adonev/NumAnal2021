% Code from Guanchun Li, 2021
clear % ALWAYS do this at the beginning (avoid clear all)
format long; format compact % Print more digits without white space

%% Worksheet5 1.1
n_lst = [10, 12, 14, 15, 16];
cond_lst = 0 * n_lst;  rcond_lst = 0 * n_lst;
for i = 1:length(n_lst)
    n = n_lst(i);
    A = hilb(n);  % Create the Hilbert matrix
    cond_lst(i) = cond(A,2);  % Compute the condition number in L2 norm
    rcond_lst(i) = 1/rcond(A);  % rcond estimates reciprocal condition number in 1 norm
end
figure(1);
semilogy(n_lst, cond_lst, 'r^-');
hold on;
semilogy(n_lst, rcond_lst, 'b*-');
xlabel('Matrix size n');
ylabel('Condition number');
title('Condition number of Hilbert matrix');
legend('cond', 'rcond', 'Location', 'east');

%% Worksheet5 1.2
n = 15; 
A = hilb(n);
x_sol = ones(n, 1);  % Exact solution
b = A*x_sol;   % Righthand side vector
x_hat = A \ b  % Solve directly
delta_x = norm(x_hat - x_sol)  % Error of solution 
rel_err_b = norm(A*x_hat-b) / norm(b)  % Relative error of righthand side

%% Worksheet5 1.3

% Part 1
[U,S,V] = svd(A);  % SVD decomposition
sigma_lst = diag(S)  % List of singular values
sigma_1 = sigma_lst(1); sigma_n = sigma_lst(end);
A_cond = sigma_1 / sigma_n  % cond = sigma_max / sigma_min
A_cond_true = cond(A,2) % Compare to the built-in function

% Part 2
A_pinv = pinv(A,0);  % Generate the pseudo inverse matrix with tolerance=0 (no regularization)
x_hat2 = A_pinv * b;  % The solution obtained through pseudo-inverse matrix
% Let's see if this is any more accurate than using backslash (it is NOT!)
delta_x_pinv = norm(x_hat - x_sol)  % Error of solution 
rel_err_b_pinv = norm(A*x_hat-b) / norm(b)  % Relative error of righthand side

% 1.3.1
epsi_lst = 10.^(-(1:16));
rel_err_lst = 0*epsi_lst;
for i = 1:length(epsi_lst)
    epsi = epsi_lst(i);
    % You can use either pinv or MyPinv here:
    A_pinv = MyPinv(A, epsi*sigma_1);  % Generate the pesudo inverse matrix
    x_hatp = A_pinv * b;  %  The solution obtained through pesudo-inverse matrix
    rel_err_lst(i) = norm(x_hatp - x_sol) / norm(x_sol);  % Compute the relative error
end
figure(2);
loglog(epsi_lst, rel_err_lst, 'r*-');
xlabel('Tolerance');
ylabel('Relative Error');
title('Relative Error for difference tolerance of pinv');

%%------------------------------

%% Pseudo-Inverse Function
function [A_pinv] = MyPinv(A, tol)
    [U,S,V] = svd(A);  % SVD decomposition
    % Regularize the singular values
    sigma_lst = diag(S);
    sigma_lst(sigma_lst < tol) = 0;
    % Generate the inverse of singular values
    inv_sigma_lst = 0*sigma_lst;
    inv_sigma_lst(sigma_lst >= tol) = 1./sigma_lst(sigma_lst >= tol);
    inv_S_reg = diag(inv_sigma_lst);
    % Generate the pesudo inverse matrix
    A_pinv = V * inv_S_reg * U';
end
