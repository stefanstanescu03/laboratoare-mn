clc, clearvars, close all

n = 50;

x = randn(n, 1);
y = randn(n, 1);

A = zeros(n, 3);
b = zeros(n, 1);

for i = 1:n
    A(i, 1) = x(i);
    A(i, 2) = y(i);
    A(i, 3) = 1;
    if i < n / 2
        b(i) = 1;
    else
        b(i) = -1;
    end
end

coeff = CMMP(A, b)

plot(x(1:25, 1), y(1:25, 1), 'r*');
hold on
plot(x(26:50, 1), y(26:50, 1), 'b*');

xx = -5:0.02:5;
yy = (-coeff(1) .* xx - coeff(3)) ./ coeff(2);

hold on
plot(xx, yy);