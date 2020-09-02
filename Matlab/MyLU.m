function A = MyLU(A)
% LU factorization in-place (overwrite A)
[n,m]=size(A);
if (n ~= m); error('Matrix not square'); end
for k=1:(n-1) % For variable x(k)
   % Calculate multipliers in column k:
   A((k+1):n,k) = A((k+1):n,k) / A(k,k);
   % Note: Pivot element A(k,k) assumed nonzero!
   for j=(k+1):n
      % Eliminate variable x(k) from all remaining equations
      A((k+1):n,j) = A((k+1):n,j) - A((k+1):n,k) * A(k,j);
   end
end
end
