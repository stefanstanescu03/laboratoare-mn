function [Q, A] = HQ(A)
    [n, ~] = size(A);
    Q = eye(n);
    for k = 1:n-2
        [ u, beta, A(k + 1 : n, k) ] = Z(A(k + 1 : n, k));
        A(k + 1 : n, k + 1 : n) = As(u, beta, A(k + 1 : n, k + 1 : n));
        A(1 : n, k + 1 : n) = Ad(A(1 : n, k + 1 : n), u, beta);
        Q(1 : n, k + 1 : n) = Ad(Q(1 : n, k + 1 : n), u, beta);
    end
end

