clc;
close all;
clear all;
P1 = imread('peppers.png');
P2 = rgb2gray(P1); 
P3 = im2double(P2);
P4 = imnoise(P3,'salt & pepper',0.02); %salt and papper noise
P2 = imnoise(P3, 'gaussian'); %Gaussian noise
P5 = imnoise(P3, 'speckle'); %Speckle noise
%3x3 mask
h = [1,2,1; 2,4,2; 1,2,1]/16;
i1 = filter2(h, P4);
i2 = filter2(h, P2);
i3 = filter2(h, P5);
subplot(321);
imshow(P4);
title('Image of Salt and Pepper noise');
subplot(322);
imshow(i1);
title('3x3 mask of salt and pepper noise');
subplot(323);
imshow(P2);
title('Image of Gaussian noise');
subplot(324); 
imshow(i2);
title('3x3 mask of Gaussian noise');
subplot(325); 
imshow(P5);
title('Image of Speckle noise');
subplot(326); 
imshow(i3);
title('3x3 mask of Speckle noise');
%5x5 mask
h = [1,2,4,2,1; 2,4,8,4,2; 4,8,16,8,4; 2,4,8,4,2; 1,2,4,2,1]/100;
i1 = filter2(h, P4);
i2 = filter2(h, P2);
i3 = filter2(h, P5);
figure,
subplot(321);imshow(P4);
title('Image of salt and pepper noise');
subplot(322);
imshow(i1);
title('5x5 mask for salt and pepper noise');
subplot(323);
imshow(P2);
title('Image of Gaussian noise');
subplot(324); 
imshow(i2);
title('5x5 mask for Gaussian noise');
subplot(325); 
imshow(P5);
title('Image of Speckle noise');
subplot(326); 
imshow(i3);
title('5x5 mask for Speckle noise');
%7x7 mask
h = [1,2,4,8,4,2,1; 2,4,8,16,8,4,2; 4,8,16,32,16,8,4;8,16,32,64,32,16,8; 4,8,16,32,16,8,4; 2,4,8,16,8,4,2;  1,2,4,8,4,2,1]/484;
i1 = filter2(h, P4);
i2 = filter2(h, P2);
i3 = filter2(h, P5);
figure,
subplot(321);
imshow(P4);
title('Image of salt and pepper noise');
subplot(322);
imshow(i1);
title('7x7 mask for salt and papper noise');
subplot(323);
imshow(P2);
title('Image of Gaussian noise');
subplot(324); 
imshow(i2);
title('7x7 mask for Gaussian noise');
subplot(325); 
imshow(P5);
title('Image of Speckle noise');
subplot(326); 
imshow(i3);
title('7x7 mask for Speckle noise');