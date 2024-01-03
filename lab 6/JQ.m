function [f,g,U,V] = JQ(A)
    [m, n] = size(A);
    U = eye(m);
    V = eye(n);
    f = zeros(1, n);
    g = zeros(1, n - 1);
    u = zeros(m, 1);
    v = zeros(n, 1);

    for k = 1:n
        sigma = 0;
        for i = k:m
            sigma = sigma + A(i, k) ^ 2;
        end
        sigma = sign(A(k, k)) * sqrt(sigma);
        u(k) = A(k, k) + sigma;
        for i = k+1:m
            u(i) = A(i, k);
        end
        beta = u(k) * sigma;
        A(k, k) = -sigma;
        for j = k+1:n
            tau = 0;
            for i = k:m
                tau = tau + u(i) * A(i, j);
            end
            tau = tau / beta;
            for i = k:m
                A(i, j) = A(i, j) - tau * u(i);
            end
        end
        for i = 1:m
            tau = 0;
            for j = k:m
                tau = tau + U(i, j) * u(j);
            end
            tau = tau / beta;
            for j = k:m
                U(i, j) = U(i, j) - tau * u(j);
            end
        end
        if k < n - 1
            sigma = 0;
            for j = k+1:n
                sigma = sigma + A(k, j) ^ 2;
            end
            sigma = sign(A(k, k + 1)) * sqrt(sigma);
            v(k + 1) = A(k, k + 1) + sigma;
            for j = k+2:n
                v(j) = A(k, j);
            end
            gamma = v(k + 1) * sigma;
            A(k, k + 1) = -sigma;
            for i = k+1:m
                tau = 0;
                for j = k + 1:n
                    tau = tau + A(i, j) * v(j);
                end
                tau = tau / gamma;
                for j = k+1:n
                    A(i, j) = A(i, j) - tau * v(j);
                end             
            end
            for i = 1:n
                tau = 0;
                for j = k + 1:n
                    tau = tau + V(i, j) * v(j);
                end
                tau = tau / gamma;
                for j = k+1:n
                    V(i, j) = V(i, j) - tau * v(j);
                end   
            end
        end
    end
    for i = 1:n-1
        f(i) = A(i, i);
        g(i) = A(i, i + 1);
    end
    f(n) = A(n, n);
end

