clear all; format compact; format long e

eulergamma=-psi(1) % True value of Euler constant to 16 digits

npts=20;
Ns=zeros(1,npts); 
hsum=zeros(1,npts);
relerr=zeros(1,npts);
nhsum=zeros(1,npts);
for i=1:npts
    Ns(i)=2^i;
    nhsum_DP=HarmonicSum(Ns(i)); % Double precision -- N needs to be very large to see issues
    nhsum_SP=harmonicSP(Ns(i)); % Single precision -- easier to see problem
    nhsum(i)=nhsum_SP; % Plot single-precision results
    hsum(i)=(psi(Ns(i)+1)-psi(1)); % Theoretical result
    relerr(i)=abs(nhsum(i)-hsum(i))/hsum(i);
    gamma_SP = nhsum_SP-log(Ns(i));
    gamma_DP = nhsum_DP-log(Ns(i));
    rel_error_euler_SP = abs(gamma_SP-eulergamma)/eulergamma;
    rel_error_euler_DP = abs(gamma_DP-eulergamma)/eulergamma;
    fprintf("N=%10d, relerr_SP=%g relerr_DP=%g\n", ...
            Ns(i), rel_error_euler_SP, rel_error_euler_DP);
end

figure(1); clf;
loglog(Ns,relerr,'ro--');
title('Error in harmonic sum');
xlabel('N'); ylabel('Relative error');

figure(2); clf;
semilogx(Ns,nhsum,'ro--', Ns,hsum,'g.-');
title('Harmonic sum');
xlabel('N'); ylabel('H(N)');
legend('numerical','"exact"', 'Location','NorthWest');

%-----------------------
% Calculating the harmonic sum for a given integer N
function nhsum=HarmonicSum(N)
    nhsum=0.0;
    %for i=1:N % Forward summation -- less accurate
    for i=N:-1:1 % Backward summation -- more accurate
        nhsum=nhsum+1.0/i;
    end
end
