function [H] = QR(A, tol)
    [n, ~] = size(A);
    [ Q, H ] = HQ(A);
    iter = 0;
    m = n;
    while m > 1
        u = H(m, m);
        for i = 1:m
            H(i, i) = H(i, i) - u;
        end
        [Q_, R] = qr(H(1 : m, 1 : m));
        H(1:m, 1:m) = R * Q_;
        for i = 1:m
            H(i, i) = H(i, i) + u;
        end
        if m < n
            H(1 : m, m + 1 : n) = Q_' * H(1 : m, m + 1 : n)
        end
        Q(:, 1 : m) = Q(:, 1 : m) * Q_;
        iter = iter + 1;
        disp(iter);
        disp(H);
        if abs(H(m, m - 1)) < tol
            H(m, m - 1) = 0;
            m = m - 1;
        end
    end
end

