function [U, M, p] = GPP(A)
    [n, ~] = size(A);
    p = zeros(n, 1);
    for k = 1:n-1

        maxim = -1;
        index = -1;

        for i = k:n
            if abs(A(i, k)) > maxim
                maxim = abs(A(i, k));
                index = i;
            end
        end

        p(k) = index;

        for j = k:n
            aux = A(k, j);
            A(k, j) = A(index, j);
            A(index, j) = aux;
        end

        for i = k+1:n
            A(i, k) = A(i, k) / A(k, k);
        end
        for i = k+1:n
            for j = k+1:n
                A(i, j) = A(i, j) - A(i, k) * A(k, j);
            end
        end
    end
    M = tril(A);
    for i = 1:n
        M(i, i) = 1;
    end
    U = triu(A);
end

