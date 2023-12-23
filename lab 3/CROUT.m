function [A] = CROUT(A)
    [n, ~] = size(A);
    for j = 2:n
        A(1, j) = A(1, j) / A(1, 1);
    end
    for k = 2:n
        for i = k:n
            for l = 1:k-1
                A(i, k) = A(i, k) - A(i, l) * A(l, k);
            end
        end
        if k == n
            return;
        end
        for j = k + 1:n
            for l = 1:k-1
                A(k, j) = A(k, j) - A(k, l) * A(l, j);
            end
            A(k, j) = A(k, j) / A(k, k); 
        end
    end
end

