function [L, U] = LUfactorization (A)
%A=[2 2 3
%   5 9 10
%   4 1 2];
N = size(A,1);
U = A;
L = zeros(N);
for c = 1:N
    for r = c:N
        factor = U(r,c) / U(c,c);
        for c2 = c:N
            if c ~= r 
            U(r,c2) = U(r,c2) - factor * U(c,c2);            
            end
        end
        L(r,c) = factor;
    end
end
%disp("L:");
%disp(L);
%disp("U:");
%disp(U);

%X = L * U;
%disp("X:");
%disp(X);
end