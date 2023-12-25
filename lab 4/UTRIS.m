function [x] = UTRIS(A, b)
    [n, ~]= size(A);
    x = zeros(1, n);
    x(n) = b(n) / A(n, n);
    for k = n-1:-1:1
        x(k) = b(k);
        for i = n:-1:k+1
            x(k) = x(k) - A(k, i) * x(i);
        end
        x(k) = x(k) / A(k, k);
    end
end

