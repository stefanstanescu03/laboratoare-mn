function [A, u, b] = TORT(A)
    [m, n] = size(A);
    u = zeros(m, n);
    b = zeros(1, n);
    p = min(m - 1, n);
    
    for k = 1:p
        s = 0;
        for i =k:m
            s = s + A(i, k) ^ 2;
        end
        s = sqrt(s);
        s = s * sign(A(k, k));
        u(k, k) = A(k, k) + s;
        for i = k+1:m
            u(i, k) = A(i, k);
        end
        b(k) = s * u(k, k);
        A(k, k) = -s;
        for j = k + 1:n
            t = 0;
            for i = k:m
                t = t + u(i, k) * A(i, j);
            end
            t = t / b(k);
            for i = k:m
                A(i, j) = A(i, j) - t * u(i, k);
            end
        end
    end
end

