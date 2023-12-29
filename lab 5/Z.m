function [u, beta, x] = Z(x)
    [n, ~] = size(x);
    u = zeros(n, 1);
    s = 0;
    for i = 1:n
        s = s + x(i) ^ 2;
    end
    s = sign(x(1)) * sqrt(s);
    u(1) = x(1) + s;
    for i = 2:n
        u(i) = x(i);
        x(i) = 0;
    end
    beta = u(1) * s;
    x(1) = s;
end

