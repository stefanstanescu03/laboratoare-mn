clc, clearvars, close all

I = imread('lena.png');
I = rgb2gray(I);
I = double(I);
[U, S, V] = svd(I);
r = 100;
J = U(:, 1:r) * S(1:r, 1:r) * V(:, 1:r)';
imshow(uint8(J));