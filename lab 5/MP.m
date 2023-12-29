function [y] = MP(A, tol, maxiter)
    [n, ~] = size(A);
    y = randn(n, 1);
    y = y ./ norm(y);
    i = 0;
    e = 1;
    while e > tol
        if i > maxiter
            disp('S-a atins numarul maxim de iteratii fara a se fi obtinut nivelul prescris al tolerantei')
            return;
        end
        z = A * y;
        z = z / norm(z);
        e = abs(1 - abs(z'*y));
        y = z;
        i = i + 1;
    end
end

