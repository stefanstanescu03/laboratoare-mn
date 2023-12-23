clc, clearvars, close all

n = 4;
A = randn(n)
B = INV_GPP(A);

norm(A * B - eye(n))