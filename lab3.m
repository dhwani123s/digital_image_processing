clc;
clear all;
close all;
% Read an 8 bit image and then apply different image
% enhancement techniques:
% (a) Brightness improvement
% (b) Brightness reduction
% (c) Thresholding
% (d) Negative of an image
% (e) Log transformation
% (f) Power Law transformation
% (a) Brightness improvement
I = imread('cameraman.jpg');
figure;
subplot(2,2,1);
imshow(I);
title('Original Image')

I1 = rgb2gray(I);
subplot(2,2,2)
imshow(I1)
title('Gray Scale of Original Image')

b_improve = imadjust(I1);
subplot(2,2,3)
imshow(b_improve);
title('Brightness improvement')
subplot(2,2,4)
plot(b_improve,I1)

xlabel('Input Grey Level')
ylabel('Output Grey Level')
title('Brightness improvement')

% (b) Brightness reduction
I2 = imread('cameraman.jpg');
figure;
subplot(2,2,1);
imshow(I2);
title('Original Image')
I12 = rgb2gray(I2);
subplot(2,2,2)
imshow(I12)
title('Gray Scale of Original Image')
b_reduce = I12-100;
subplot(2,2,3)
imshow(b_reduce);
title('Brightness reduction')
subplot(2,2,4)
plot(b_reduce,I1)
xlabel('Input Grey Level')
ylabel('Output Grey Level')
title('Brightness reduction')

% (c) Thresholding
T = imread('cameraman.jpg');
figure;
subplot(2,2,1);
imshow(T);
title('Original Image')
T1 = rgb2gray(T);
subplot(2,2,2)
imshow(T1)
title('Gray Scale of Original Image')
t1 = imresize(T1,[256,256]);
t = imresize(T1,[256,256]);
for j=1:256
    for k=1:256
        if t(j,k)<=150
            t(j,k)=0;
        else
            t(j,k)=255;
        end
    end
end
subplot(2,2,3);
imshow(t);
title('Thresholding');
subplot(2,2,4)
plot(t1,t)
xlabel('Input Grey Level')
ylabel('Output Grey Level')
title('Thresholding')

%(d) Negative of an image
%Negative Transform
A = imread('cameraman.jpg');
figure;
subplot(2,2,1)
imshow(A)
A1 = rgb2gray(A);
title('Original Image')
L=256;
I_negative=(L-1)-A;
A2 = rgb2gray(I_negative);
subplot(2,2,2)
imshow(I_negative);
title('Image negative -> S = L - 1 - r')
subplot(2,2,3)
plot(A1,A1)
xlabel('Input Grey Level')
ylabel('Output Grey Level')
title('Identity Transform')
subplot(2,2,4)
plot(A1,A2)
xlabel('Input Grey Level')
ylabel('Output Grey Level')
title('Negative Transform')

%Log Transform
% (e) Log transformation
B = imread('cameraman.jpg');
figure;
subplot(3,2,1)
imshow(B)
title('Original Image')

B_grey = rgb2gray(B);
C1=2;
I1_log=C1*log(1+double(B_grey));
subplot(3,2,2);
imshow(I1_log);
title('Log Transformation -> S = C*log(1+r) ,C=2')

subplot(3,2,3)
plot(B_grey,I1_log)
xlabel('Input Grey Level')
ylabel('Output Grey Level')
title('Log Transform for C = 2 ')

%Power Law transformation
figure;
S1= rgb2gray(B);
a = 0.5;
g = 2;

S3 = a.*power(S1,g);
subplot(2,2,1);
imshow(S1);
title('Original Image');
subplot(2,2,2);
imshow(S3);
title('Image after Power Law Transformation');
subplot(2,2,[3,4]);
plot(S1,S3);
grid on;
title('Input Vs Output');

%Contrast Improvement
figure;
s1= rgb2gray(B);
c= 5;
s2=s1*c;
subplot(121);
imshow(s1);title('Original Image'); 
subplot(122);
imshow(s2);
title('Contrast Improved Image');

%Contrast Reduction
figure;
s1= rgb2gray(B);
c= 2;
s2=s1/c;
subplot(121);
imshow(s1);
title('Original Image');
subplot(122);
imshow(s2);
title('Contrast Reduced Image');