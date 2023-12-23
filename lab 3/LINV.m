function [L] = LINV(L)
    [n, ~] = size(L);
    for j = 1:n
        L(j, j) = 1 / L(j, j);
        if j == n
            return;
        end
        for i = j+1:n
            s = 0;
            for k = j:i-1
                s = s + L(i, k) * L(k, j);
            end
            L(i, j) = -s / L(i, i);
        end
    end
end

