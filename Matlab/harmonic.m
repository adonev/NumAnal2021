clear all; format compact; format long e

npts=30;
Ns=zeros(1,npts); 
hsum=zeros(1,npts);
relerr=zeros(1,npts);
nhsum=zeros(1,npts);
for i=1:npts
    Ns(i)=2^i;
    nhsum(i)=HarmonicSum(Ns(i));
    hsum(i)=(psi(Ns(i)+1)-psi(1)); % Theoretical result
    relerr(i)=abs(nhsum(i)-hsum(i))/hsum(i);
    gamma = nhsum(i)-log(Ns(i))
end
eulergamma=-psi(1) % True value to 16 digits
rel_error_euler = abs(gamma-eulergamma)/eulergamma;

figure(1);
loglog(Ns,relerr,'ro--');
title('Error in harmonic sum');
xlabel('N'); ylabel('Relative error');

figure(2);
semilogx(Ns,nhsum,'ro--', Ns,hsum,'g.-');
title('Harmonic sum');
xlabel('N'); ylabel('H(N)');
legend('double','"exact"', 'Location','NorthWest');

%-----------------------
% Calculating the harmonic sum for a given integer N
function nhsum=HarmonicSum(N)
    nhsum=0.0;
    %for i=1:N % Forward summation
    for i=N:-1:1 % Backward summation
        nhsum=nhsum+1.0/i;
    end
end
