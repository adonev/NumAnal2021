clear % ALWAYS do this at the beginning (avoid clear all)
format long; format compact % Print more digits without white space

c=133
sqrt_c=sqrt(c);

k_max=50;
% Create vectors of k_max entries and initialize to zero
x_k=zeros(k_max,1); % Store x(k) in memory
error_k=zeros(k_max,1); % Relative error e(k) = |x[k-1]-sqrt(c)|/sqrt(c)

%x=10; p=0.5; % Babylonian method p=1/2
%x=c; p=0.25; % p=1/4
x=c; p=0.75; % p=3/4
for k=1:k_max % Repeat calculation for k=1,2,3,...,100
   error_k(k) = abs((x-sqrt_c)/sqrt_c); % Relative error
   x = p*x+(1-p)*c/x; % A variant of the Babylonian method
   x_k(k) = x; % Matlab starts indexing arrays at index=1
end

figure(1); clf; % Open and/or clear old figure
semilogy([1:k_max], error_k, 'r--o'); % Logarithmic axis for y
xlabel('k'); ylabel('Relative error e[k]');
