% Calculating the harmonic sum for a given integer N
function nhsum=harmonicSP(N)
    nhsumSP=single(0.0);
    for i=1:N % Sum in forward order
    %for i=N:-1:1 % Sum in backward order
        nhsumSP=nhsumSP+single(1.0)/single(i);
    end
    nhsum=double(nhsumSP);    
end