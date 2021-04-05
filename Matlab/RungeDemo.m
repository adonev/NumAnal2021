% illustration of Runge's phenomenenon
clear
format long; format compact;

runge=1; % Choose function to use
nodes=1; % Choose nodes to use 1=uniform, 2=Chebyshev, 3=Gauss

% How many nodes to use:
ns = [6:2:16]; % Demo for class

if(runge)
  f = @(x) 1./(1+x.^2);
else  
  f = @(x) exp(x);
end   

if(runge)
   a = -5; b = 5;
else
   a = -2; b = 2;
end 
     
% To plot smooth curves we will use 1000 points
xVals = linspace(a,b,1000);

figure(1); clf

for n=ns
    % interpolation points
    if (nodes==1)
      % equidistant
      xs = a+(0:n)*(b-a)/n;
    elseif (nodes==2)
      % Chebyshev grid:
      %xs = cos(pi*(2*(0:n)+1)/(2*n+2)); % Does not include the endpoints
      % Alternative Chebyshev grid that includes the endpoints:
      xs = cos(pi*[0:n]/n); % Includes endpoints
      xs = 0.5*(b+a) + 0.5*(b-a)*xs; % Scale and center
    else  
      [xs,w]=GLNodeWt(n+1); % See webpage for code
      xs = 0.5*(b+a) + 0.5*(b-a)*xs; % Scale and center
    end
    
    % Pre-compute some things:
    ws = BarycentricWeights(xs);
    ys = f(xs); 
    
    % Plot true function  
    plot(xVals,f(xVals),'k','LineWidth',2);
    hold on;
    
    % Plot interpolation nodes
    plot(xs,f(xs),'ro');
    
    % Plot polynomial interpolant:
    fVals_bary = Barycentric(xVals,xs,ys,ws);
    plot(xVals,fVals_bary,'r--','LineWidth',2);
        
    legend('f(x)','nodes','p(x)');
    xlabel('x')
    hold off
    if(length(ns)>1) 
      pause
    end  
end

figure(2); clf;
semilogy(xVals,abs(fVals_bary-f(xVals)),'b','LineWidth',2);
max_error = norm(fVals_bary-f(xVals),'inf')

% -----------------------

function ws = BarycentricWeights(xs)
   
   ws = zeros(size(xs));
   for k=1:length(xs)
      % w(k) = 1 / \prod_{j \neq k} x(k)-x(j)
      ws(k) = 1/(prod(xs(k)-xs(1:k-1))*prod(xs(k)-xs(k+1:end)));
   end   

end

% This function works for non-scalar x_eval also but not efficiently
function p_x = Barycentric(x_eval,xs,ys,ws)
   
   p_x=zeros(size(x_eval));
   for i=1:length(x_eval)
      x=x_eval(i); % We add eps here to avoid division by zero
      y = x-xs;
      y(abs(y)<eps) = eps;
      numer = sum(ys.*ws./y);
      denom = sum(ws./y);
      p_x(i) = numer/denom;
   end   
   
end
