function [x] = S_INF_TR(L, b)
    [n, ~] = size(L);
    x = zeros(n, 1);
    for i = 1:n
        s = b(i);
        for j = 1:i-1
            s = s - L(i, j) * x(j);
        end
        x(i) = s / L(i, i);
    end
end

