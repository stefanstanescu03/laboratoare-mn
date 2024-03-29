function [A] = INV_GPP(A)
    [n, ~] = size(A);
    [U, M, p] = GPP(A);
    A = UINV(U);
    for k = n-1:-1:1
        for i = 1:k
            for l = k+1:n
                A(i, k) = A(i, k) - A(i, l) * M(l, k);
            end
        end
        for i = k+1:n
            s = 0;
            for l = k+1:n
               s = s + A(i, l) * M(l, k);
            end
            A(i, k) = -s;
        end
        if p(k) ~= k
            for i = 1:n
                aux = A(i, k);
                A(i, k) = A(i, p(k));
                A(i, p(k)) = aux;
            end
        end
    end
end

