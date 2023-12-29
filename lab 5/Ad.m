function [A] = Ad(A, u, beta)
    [m, n] = size(A);
    for i = 1:m
        t = 0;
        for j = 1:n
            t = t + u(j) * A(i, j);
        end
        t = t / beta;
        for j = 1:n
            A(i, j) = A(i, j) - t * u(j);
        end
    end
end

