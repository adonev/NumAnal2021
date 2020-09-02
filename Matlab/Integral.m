clear all; format compact; format long e

nmax=30;
ns=zeros(1,nmax); 
y=zeros(1,nmax); ySP=zeros(1,nmax);
y_lb_th=zeros(1,nmax);y_ub_th=zeros(1,nmax);

%=====================
% Forward
%=====================
y_prev=log(1.2);
y_prevSP=single(y_prev);
for n=1:nmax
    ns(n)=n;
    % Double precision
    y(n)=1/n-5*y_prev;
    y_prev=y(n);
    % Now single precision
    ySP(n)=single(1/n)-5*y_prevSP;
    y_prevSP=ySP(n);
    % Lower and upper bounds:
    y_lb_th(n)=1/(6*(n+1));
    y_ub_th(n)=1/(6*n);
    
    fprintf('y(%d)=%.16f n*y_n=%.16f\n', n, y(n), n*y(n));
    
end

figure(1);
plot(ns,ns.*y,'ro-', ns,ns.*ySP,'bs-', ns,ns.*y_lb_th,'--',  ns,ns.*y_ub_th,':');
ylim([0 1.1/6]);
xlabel('n'); ylabel('n*y_n');
legend('double','single', 'Lower bound','Upper bound', ...
    'Location','SouthWest');

%=====================
% Backward
%=====================

% Start from the lower and upper bounds:
y_lb(nmax)=1/(6*(nmax+1));
y_ub(nmax)=1/(6*nmax);
for n=nmax:-1:2
    % Double precision
    y_ub(n-1)=1/5/n-y_ub(n)/5;
    y_lb(n-1)=1/5/n-y_lb(n)/5;
    fprintf('n=%d: y_n is in interval [%.16f,%.16f]\n', n, y_lb(n), y_ub(n));
end

figure(2);
plot(ns,ns.*y,'ro-', ns,ns.*y_lb,'bs-', ns,ns.*y_ub,'g*-', ...
    ns,ns.*y_lb_th,'--',  ns,ns.*y_ub_th,':');
ylim([0 1.1/6]);
xlabel('n'); ylabel('n*y_n');
legend('forward','lower','upper', 'Lower theory','Upper theory', ...
    'Location','SouthWest');

