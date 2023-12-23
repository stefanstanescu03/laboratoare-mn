function [A] = CHOL(A)
    [n, ~] = size(A);
    if A(1, 1) <= 0
        disp("A nu este pozitiv definita");
        return;
    end
    A(1, 1) = sqrt(A(1, 1));
    for i = 2:n
        A(i, 1) = A(i, 1) / A(1, 1);
    end
    for k = 2:n
        a = A(k, k);
        for l = 1:k-1
            a = a - A(k, l) ^ 2;
        end
        if a <= 0
            disp("A nu este pozitiv definita");
            return;
        end
        A(k, k) = sqrt(a);
        if k == n
            return;
        end
        for i = k+1:n
            for l = 1:k-1
                A(i, k) = A(i, k) - A(i, l) * A(k, l);
            end
            A(i, k) = A(i, k) / A(k, k);
        end
    end
end

