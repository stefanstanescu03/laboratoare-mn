function [x] = S_SUP_TR(U, b)
    [n, ~] = size(U);
    x = zeros(n, 1);
    for i = n:-1:1
        s = b(i);
        for j = i+1:n
            s = s - U(i, j) * x(j);
        end
        x(i) = s / U(i, i);
    end
end

