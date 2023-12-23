function [A] = GPC(A)
    [n, ~] = size(A);
    for k = 1:n-1

        maxim = -1;
        indexi = -1;
        indexj = -1;

        for i = k:n
            for j = k:n
                if abs(A(i, j)) > maxim
                    maxim = abs(A(i, j));
                    indexi = i;
                    indexj = j;
                end
            end
        end

        for j = k:n
            aux = A(k, j);
            A(k, j) = A(indexi, j);
            A(indexi, j) = aux;
        end

        for i = 1:n
            aux = A(i, k);
            A(i, k) = A(i, indexj);
            A(i, indexj) = aux;
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
end

