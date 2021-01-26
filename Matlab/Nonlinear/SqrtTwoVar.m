clear % ALWAYS do this at the beginning (avoid clear all)
format long; format compact % Print more digits without white space

% This method only works for c<3:
%c=2.5 % We get "all" digits (?)
c=2.6 % We get ~16 digits
c=2.99 % We get only 12 digits
c=2.999 % We get only ~10 digits

sqrt_c=sqrt(c)

k_max=30;
error_k=zeros(k_max,1); % Relative error e(k) = |x[k-1]-sqrt(c)|

x=c;
y=c-1;
for k=1:k_max % Repeat calculation for k=1,2,3,...,100
   error_k(k) = abs((x-sqrt_c)/sqrt_c);
   x = x - x*y/2;
   y = y^2*(y-3)/4;
end

figure(1); clf; % Open and/or clear old figure
semilogy([1:k_max], error_k, 'r--o'); % Logarithmic axis for y
xlabel('k'); ylabel('Relative error e[k]');
