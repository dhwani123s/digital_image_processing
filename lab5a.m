clc;
close all;
clear all;
P1 = imread('peppers.png');
P2 = rgb2gray(P1); 
P3 = im2double(P2);
P4 = imnoise(P3,'salt & pepper',0.02); %salt and pepper noise
P5 = imnoise(P3, 'gaussian'); %Gaussian noise
P6 = imnoise(P3, 'speckle'); %Speckle noise
%3x3 mask
h = ones(3,3)/9;
i1 = filter2(h, P4);
i2 = filter2(h, P5);
i3 = filter2(h, P6);
subplot(321);
imshow(P4);
title('Image of salt and pepper noise');
subplot(322);
imshow(i1);
title('3x3 mask of salt and pepper noise');
subplot(323);
imshow(P5);
title('Image of Gaussian noise');
subplot(324); 
imshow(i2);
title('3x3 mask of Gaussian noise');
subplot(325); 
imshow(P6);
title('Image of Speckle noise');
subplot(326); 
imshow(i3);
title('3x3 mask of Speckle noise');
%5x5 mask
h = ones(5,5)/25;
i1 = filter2(h, P4);
i2 = filter2(h, P5);
i3 = filter2(h, P6);
figure,
subplot(321);
imshow(P4);
title('Image of salt and pepper noise');
subplot(322);
imshow(i1);
title('5x5 mask of salt and pepper noise');
subplot(323);
imshow(P5);
title('Image of Gaussian noise');
subplot(324); 
imshow(i2);
title('5x5 mask of Gaussian noise');
subplot(325); 
imshow(P6);
title('Image of Speckle noise');
subplot(326); 
imshow(i3);
title('5x5 mask of Speckle noise');
%7x7 mask
h = ones(7,7)/49;
i1 = filter2(h, P4);
i2 = filter2(h, P5);
i3 = filter2(h, P6);
figure,
subplot(321);
imshow(P4);
title('Image of salt and pepper noise');
subplot(322);
imshow(i1);
title('7x7 mask of salt and pepper noise');
subplot(323);
imshow(P5);
title('Image of Gaussian noise');
subplot(324); 
imshow(i2);
title('7x7 mask of Gaussian noise');
subplot(325); 
imshow(P6);
title('Image of Speckle noise');
subplot(326); 
imshow(i3);
title('7x7 mask of Speckle noise');