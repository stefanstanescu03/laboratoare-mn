function [det] = DET(A)
    [U, ~, p] = GPP(A);
    [n, ~] = size(A);
    det = 1;
    for k = 1:n
        det = det * U(k, k);
    end
    for k = 1:n-1
        if p(k) ~= k
            det = -det;
        end
    end
end

