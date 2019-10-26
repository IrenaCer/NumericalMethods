function [A] = MatrixGenerator (N)
A = randi([-1, 1],N,N);
S = abs(sum(A,2));
A((1:N)+N*(0:N-1)) = S;
end