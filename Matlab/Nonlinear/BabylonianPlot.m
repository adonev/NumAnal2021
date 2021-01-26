clear % ALWAYS do this at the beginning (avoid clear all)
format long; format compact % Print more digits without white space

c=5743656.17285627454549697
sqrt_c=sqrt(c);

k_max=20;
% Create vectors of 20 entries and initialize to zero
x_k=zeros(k_max,1); % Store x(k) in memory
error_k=zeros(k_max,1); % Relative error e(k) = |x[k-1]-sqrt(c)|

x=1e5; % Initial guess x[k=0] is way off
for k=1:k_max % Repeat calculation for k=1,2,3,...,100
   error_k(k) = abs((x-sqrt_c)/sqrt_c);
   x = (x+c/x)/2; % Babylonian method
   x_k(k) = x; % Matlab starts indexing arrays at index=0
end

figure(1); clf; % Open and/or clear old figure
semilogy([1:k_max], error_k, 'r--o'); % Logarithmic axis for y
xlabel('k'); ylabel('Relative error e[k]');
