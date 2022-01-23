clc;
clear all;
close all;

img = imread('I1.jpg');
subplot(3,2,1)
imshow(img);
title('Original Image')

i_gray = rgb2gray(img)
I = imresize(i_gray, [255,255]);
[x,y] = size(I)
subplot(3,2,2)
imshow(I)
title('gray scale with resizing')
% Histogram with command
p = histeq(I);
subplot(3,2,3)
imshow(p)
title('Histogram Equalized Image')
subplot(3,2,5)
imhist(p,100);
%stem(p);
title('With inbuilt Command')
% Histogram without inbuilt command
hist=zeros(1,256);
for i=0:255
    for j=1:x
        for k=1:y
            if(I(j,k)==i)
            hist(i+1)=hist(i+1)+1;
            end
        end
    end
end
norm_hist=hist./(x*y);
cdf_hist=zeros(1,length(norm_hist));
for i=1:length(norm_hist)
    if(i==1)
        cdf_hist(i)=norm_hist(i);
    else
        cdf_hist(i)=cdf_hist(i-1)+norm_hist(i);
    end
end
absolute_cdf=cdf_hist.*255;
I_eq=zeros(x,y);
for i=1:x
    for j=1:y
        for k=0:255
            if(I(i,j)==k)
                I_eq(i,j)=ceil(absolute_cdf(k+1));
                break
            end
        end
    end
end
I_eq_uint8=uint8(I_eq);
subplot(3,2,4);
imshow(I_eq_uint8);
title('Histogram Equalized image')
subplot(3,2,6);
%stem(I_eq_uint8)
imhist(I_eq_uint8,100);
title('Without Command')

% Histogram Equalization with noise element added
J = imnoise(i_gray,'gaussian')
figure;
subplot(221);
imshow(J);
title('Added Noise Image');
A = histeq(J)
subplot(222);
imshow(J);
title('Histogram equalizer of noise image');
subplot(223);
imhist(p);
title('Histogram of Original Image');
subplot(224);
imhist(A);
title('Histogram of Noise Image');

% Histogram Equalization with High and low contrast images , Bright and Dark kind of images 
dark = imread('I1.jpg');
bright = imread('I1.jpg');
low_c = imread('I1.jpg');
high_c = imread('I1.jpg');
figure;
subplot(131);
imshow(dark);
title('Original Dark Image');
q = histeq(dark);
subplot(132);
imshow(q);
title('Histogram Equalization of Dark Image');
subplot(133);
imhist(q);
title('Histogram of Dark Image');

figure;
subplot(131);
imshow(bright);
title('Original bright Image');
r = histeq(bright);
subplot(132);
imshow(r);
title('Histogram Equalization of bright Image');
subplot(133);
imhist(r);
title('Histogram of bright Image');

figure;
subplot(131);
imshow(low_c);
title('Original Low Contrast Image');
s = histeq(low_c);
subplot(132);
imshow(s);
title('Histogram Equalization of Low Contrast Image');
subplot(133);
imhist(s);
title('Histogram of Low Contrast Image');

figure;
subplot(131);
imshow(high_c);
title('Original high Contrast Image');
t = histeq(high_c);
subplot(132);
imshow(t);
title('Histogram Equalization of high Contrast Image');
subplot(133);
imhist(t);
title('Histogram of high Contrast Image');