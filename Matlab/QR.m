format compact;

n = 3; % Size of matrix
n_steps = 10; % Do 10 iterations

A = randn(n,n); % Create random matrix
A = (A+A')/2 % Make matrix symmetric

X=eye(n); % Product of Q_k's
Lambda=A; % A_k in the notes
for k=1:n_steps
    [Q,R]=qr(Lambda);
    Lambda=R*Q
    X=X*Q;
end

eigvals = diag(Lambda) % Extract diagonal elements
eigvecs = X

[X, Lambda] = eig(A)

% Compare to QR of A^k
[Q,R] = qr(A^n_steps);
Q
