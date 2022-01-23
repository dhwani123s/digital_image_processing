clc
clear all
close all 
I=imread('image.jpg'); 
subplot(4,3,1); 
imshow(I);%Original image 
title('Original Image');

I1=rgb2gray(I);
subplot(4,3,2); 
imshow(I1);%RGB to grayscale 
title('RGB to Grayscale Image');

I2=im2bw(I);
subplot(4,3,3); 
imshow(I2);%RGB to Binary
title('RGB to Binary Image');

[x,map]=rgb2ind(I,16);
subplot(4,3,4);
imshow(x,map);%RGB to Indexed Image 
title('RGB to Indexed Image');

I3=im2bw(I1);
subplot(4,3,5);
imshow(I3);%Gray to Binary Image 
title('Gray to Binary Image');

[y,map]=gray2ind(I1,16);
subplot(4,3,6);
imshow(y,map);%Intensity Image to Index image 
title('Intensity Image to Index image');

l=graythresh(I);
I4=im2bw(I,l);
subplot(4,3,7);
imshow(I4);%Binary Thresholded Image 
title('Binary Thresholded Image');

I5=ind2gray(x,map);
subplot(4,3,8);
imshow(I5);%Indexed Image to Intensity Image
title('Indexed Image to Intensity Image');

J = filter2(fspecial('sobel'),I1);
min_matrix = min(J(:)); 
max_matrix = max(J(:));
I6 = mat2gray(J);
min_image = min(I6(:))
max_image = max(I6(:));
subplot(4,3,9);
imshow(I6);%Matrix to Intensity Image 
title('Matrix to Intensity Image');

d = double(I);
I7=uint8(d);
subplot(4,3,10);
imshow(I7);%Double of unit8 display 
title('Double of unit8 display converted to uint8');

I8 = im2double(I);
subplot(4,3,11); imshow(I8);%Im2double of unit8 display 
title('Im2double of unit8 display');

d1 = im2double(d);
I9=uint8(d1);
subplot(4,3,12);
imshow(I9); %Im2double of double display
title('Im2double of double display converted to uint8');

d=reshape(uint8(linspace(1,255,25)),[5,5]);
Double_precision = im2double(d)%image to double precision

u8=reshape(uint16(linspace(0,65535,25)),[5,5]);
Uint8 = im2uint8(u8)%image to 8-bit unsigned integer

u16=reshape(linspace(0,1,20),[5,4]);
Unit16 = im2uint16(u16)%image to 16-bit unsigned integer
