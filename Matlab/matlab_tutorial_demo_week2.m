%% More about plotting the figure
x = 1:10;  % Iteration number
% error (y) ~ 3 * (1/2)^n
y = (3 + 0.2 * randn(1, 10)) .* (2.^(-x));


%% Use log scale for clarity
fig1 = figure(1);
plot(x, y)

fig2 = figure(2);
semilogy(x, y);

% semilogx, loglog
%% Line Style
% Doc: https://www.mathworks.com/help/matlab/ref/linespec.html

fig3 = figure(3);
semilogy(x, y, 'r*-');  % 'r' for red, '*' marker, '-' solid line
y_est = 3 * (2.^(-x));
hold on;
semilogy(x, y_est, 'b--');  % 'b' for blue, '--' dash line

%% More notations on figures
xlabel('Iteration number n');
ylabel('Error');
title('Iteration error');
legend('Iteration error', 'fit by 3*(1/2)^n');

%% Save figures
% Use file type .png or .eps for LaTeX / PDF / Word
saveas(fig3, 'Iteration error.png');
% saveas(fig3, 'Iteration error', 'epsc');


%% More on the matrix

A = [1, 2, 3, 4;
     5, 6, 7, 8;
     9, 10, 11, 12;
     13, 14, 15, 16];

% Choose several columns or rows
A(1:2, :);  % Fisrt two rows
A(:, 3:end); % Last two columns

% Use integar array as index
A([2, 4], [1, 3]) % Intersections of 2nd&4th rows with 1st&3rd columns

% Use boolen array as index
x = randn(1, 20);
x_bool = x > 0; % x < 2;
x(x_bool); % Select all the positive elements of x, equivalent to x(x > 0)

% Reshape the matrix
A_row = reshape(A, 1, 16);  % Change it into a row vector (COLUMNWISE!)
A_row = reshape(A', 1, 16);
A_re = reshape(A_row, 8, 2);

% Assign values once in a cloumn/row
A(1, :) = 0;
A(:, 1) = randi(20, 4, 1);

% Create new matrix and assign values (for recording results)
iter_num = 10;
% Pre-create the vector
res = zeros(iter_num, 1);
for i = 1:iter_num
    xi = randi(10);
    res(i) = xi;
    % Avoid using res = [xi, res]; MUCH slower!
end


%% More about functions
%% Three ways to define a function
% -- Lambda function  
%       - easy to define, suitable for simple functions
%       - hard to hold complicated cases
% -- Define function at the END of the script
%       - Can hold complicated cases, can be reused in the same script
%       - Avoid writing several seperate function files
%       - Can't be used by other scripts!
% -- Define function in a seperate function file
%       - Can hold complicated case
%       - Can be used by many scripts
%       - Multiple files

% Lambda function
newton_iter_1 = @(x, f, fprime) x - f(x) ./ fprime(x);

% func_name = @(input variables) function_formula;

ff = @(x) sin(x);  ffprime = @(x) cos(x);
f_exp = @(x) exp(-x.^2);

x0 = 1/2;
x1_1 = newton_iter_1(x0, ff, ffprime);
x1_2 = newton_iter_2(x0, ff, ffprime);
%x1_3 = newton_iter_3(x0, ff, ffprime); % Put function code in file newton_iter_3.m

fprintf('x1_1 = %.4f,   x1_2 = %.4f,   x1_3 = %.4f \n', x1_1, x1_2, x1_3);

%% Format string
% Doc: https://www.mathworks.com/help/matlab/ref/sprintf.html
formatSpec = "The current time is: %d:%d %s";
A1 = 11;
A2 = 20;
A3 = 'a.m.';
str = sprintf(formatSpec,A1,A2,A3)

A = pi*ones(1,3);
txt = sprintf('%f | %.2f | %12f', A)

txt = sprintf('Displaying pi: \n %f \n %.2f \n %12f', A)

% % Define function at the END of the script
function [x_new, y] = newton_iter_2(x, f, fprime)
     y = 2*x;
     x_new = x - f(x) ./ fprime(x);
end
