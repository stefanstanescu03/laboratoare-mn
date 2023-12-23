clc, clearvars, close all

n = 4;
A = randn(n)
norm(det(A) - DET(A))