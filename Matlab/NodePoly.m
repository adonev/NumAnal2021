% illustration of Runge's phenomenenon
clear
format long; format compact;

nodes=1; % Choose nodes to use 1=uniform, 2=Cheb type 1, 3=Cheb type 2, 4=Gauss, 5=random

n=32;

if (nodes==1) % equidistant
  xs = linspace(-1,1,n);
elseif (nodes==2) % Chebyshev grid
  xs = cos(pi*(2*(0:n)+1)/(2*n+2)); % Does not include the endpoints
elseif (nodes==3) % Alternative Chebyshev grid
  xs = cos(pi*[0:n]/n); % Includes endpoints
elseif (nodes==4) % Gauss nodes  
  [xs,w]=GLNodeWt(n+1); % See webpage for code
else % Random nodes
  xs = 2*rand(n,1)-1;
end

% To plot smooth curves we will use 1000 points
xVals = linspace(-1,1,1000);

% Not vectorized to keep it simple:
nodePoly = @(x) prod(x-xs);

% Evaluate on a fine grid
p = zeros(size(xVals));
for i=1:length(xVals)
  p(i) = nodePoly(xVals(i));
end  

figure(1); clf
semilogy(xVals, abs(p), 'b-');
