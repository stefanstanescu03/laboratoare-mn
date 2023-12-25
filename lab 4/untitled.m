clc, clearvars, close all

A = importdata("iris.mat");

[m, n] = size(A);
b = zeros(m, 1);

for i = 1:m
    if A(i, n) == 1
        b(i) = 1;
    else
        b(i) = -1;
    end
    A(i, n) = 1;
end

x = CMMP(A, b)