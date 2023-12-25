function [x] = CMMP(A, b)
    [R, U, beta] = TORT(A);
    [m, n] = size(A);
    for k = 1:n
        t = 0;
        for i = k:m
            t = t + U(i, k) * b(i);
        end
        t = t / beta(k);
        for i = k:m
            b(i) = b(i) - t * U(i, k);
        end
    end
    x = UTRIS(R(1:n,:), b(1:n));
end

