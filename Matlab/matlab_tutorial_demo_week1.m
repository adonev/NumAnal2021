%% Matrices and Arrays
% _MATLAB_ is an abbreviation for "matrix laboratory." While other programming 
% languages mostly work with numbers one at a time, MATLAB® is designed to operate 
% primarily on whole matrices and arrays.
% 
% All MATLAB variables are multidimensional _arrays_, no matter what type 
% of data. A _matrix_ is a two-dimensional array often used for linear algebra.
%% Array Creation
% To create an array with four elements in a single row, separate the elements 
% with either a comma (|,|) or a space.

a = [1 2 3 4]; 
% This type of array is a _row vector_.
a_column1 = [1; 2; 3; 4];
a_column2 = a'; % Transpose to get a column vector version of a

% 
% To create a matrix that has multiple rows, separate the rows with semicolons.
A = [1 2 3;
     4 5 6; 
     7 8 10];

% Another way to create a matrix is to use a function, such as |ones|, |zeros|, 
% or |rand|. For example, create a 5-by-1 column vector of zeros.
z = zeros(5,1);

% B = ones(5, 1);
% C = eye(4);
% D1 = rand(10); D2 = randn(10);

%% Matrix and Array indexing

% pick up an element from the matrix
A(1, 1);

% Change a specific element
A(3, 3) = 11;

% Select a whole row
A(1, :);

% Select a whole column
A(:, 1);

%% Matrix and Array Operations
% MATLAB allows you to process all of the values in a matrix using a single 
% arithmetic operator or function.

A + 10;

sin(A);

% You can perform standard matrix multiplication, which computes the inner 
% products between rows and columns, using the |*| operator. For example, confirm 
% that a matrix times its inverse returns the identity matrix:
p = A*inv(A);

% To perform element-wise multiplication rather than matrix multiplication, 
% use the |.*| operator:
c1 = A .* A;
c2 = A * A;

% The matrix operators for multiplication, division, and power each have 
% a corresponding array operator that operates element-wise. For example, raise 
% each element of |a| to the third power:

b = a.^3;
%% Calling Functions
% MATLAB® provides a large number of functions that perform computational tasks. 
% Functions are equivalent to _subroutines_ or _methods_ in other programming 
% languages.
% 
max(A);

norm(A);

% Use help ... to get the details of the function

%% 2-D Plots
% To create two-dimensional line plots, use the |plot| function. For example, 
% plot the value of the sine function from 0 to $2\pi$:

x = 0:pi/100:2*pi;
y = sin(x);
plot(x,y)

hold on;
y2 = cos(x);
plot(x, y2, 'r--')

% You can label the axes and add a title.
xlabel('x')
ylabel('y')
title('Plot of the Sine and Cosine Function')
legend('sin(x)', 'cos(x)');
% |'r--'| is a _line specification_. Each specification can include characters 
% for the line color, style, and marker. A marker is a symbol that appears at 
% each plotted data point, such as a |+|, |o|, or |*|. For example, |'g:*'| requests 
% a dotted green line with |*| markers.

%% Formated string
% google matlab format string

f = 71;
c = (f-32)/1.8;
tempText = "Temperature is " + c + "C";

%% For loop

% Every "for" comes with an "end"!

N = 100;
f(1) = 1;
f(2) = 1;

for n = 3:N
    f(n) = f(n-1) + f(n-2);
end
f(1:10)

%% If-else Structure

num = randi(100);
if num < 34
   sz = 'low';
elseif num < 67
   sz = 'medium';
else
   sz = 'high';
end
fprintf([sz, '\n']);