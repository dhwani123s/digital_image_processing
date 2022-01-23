clc
clear all
close all

I = imread('cameraman.jpg');
I2 = imrotate(I, 45); % Rotate image anticlockwise by an angle of 45
I3 = imrotate(I, -45); % rotate image by an angle 45

subplot(2,2,1);
imshow(I);%original Image 
title("Original Image");

subplot(2,2,2); 
imshow(I2)
title("image anticlockwise by an angle of 45");


subplot(2,2,4); 
imshow(I3);%Rotated Image
title('rotate image by an angle 45');