clc;
clear all;
close all;

%I = imread ();
i = imread('image5.png');
I = rgb2gray(i);
subplot(2,3,1);
imshow(I);
title('Original image')

subplot(2,3,2);
Y1 = edge(I,'sobel');
imshow(Y1);
title('Sobel edge detector');

subplot(2,3,3);
Y2 = edge(I,'prewitt');
imshow(Y2);
title('Prewitt edge detector');

subplot(2,3,4);
Y3 = edge(I,'roberts');
imshow(Y3);
title('Roberts edge detector');

subplot(2,3,5);
Y4 = edge(I,'canny');
imshow(Y4);
title('Canny edge detector');

subplot(2,3,6);
Y5 = edge(I,'log');
imshow(Y5);
title('LoG edge detector');
