function [A] = As(u, beta, A)
    [n, p] = size(A);
    for j = 1:p
        t = 0;
        for i = 1:n
            t = t + u(i) * A(i, j);
        end
        t = t / beta;
        for i = 1:n
            A(i, j) = A(i, j) - t * u(i);
        end
    end
end

