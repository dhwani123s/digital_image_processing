clc;
clear all;
close all;
        
%
% apply (1) High pass filter mask
% (2) High boost filtering.
% (3) Composite Laplacian filter with and without Noise (Salt & Pepper Noise)

I = imread('image.jpeg');
I = rgb2gray (I)
[m,n] = size(I)
J = imresize(I, [256,256])
[x,y] = size(J)

%(1) High pass filter mask with different masks
figure;
subplot(231);
imshow(J);
title('Original Images')

H1 = [0 1 0;
    1 -4 1;
    0 1 0];
h1 = imfilter(J,H1);
subplot(232);
imshow(h1);
title('High Pass Filter with center -4');

H2 = [0 -1 0;
    -1 8 -1;
    0 -1 0]; 
h2 = imfilter(J,H2); 
subplot(233);
imshow(h2);
title('High Pass Filter with center 8');

%Salt & Pepper Noise 
D2=imnoise(J,'salt & pepper'); 
subplot(234)
imshow(D2) 
title('Salt & Pepper Noise Image')

%Salt & Pepper noise Center Mask=-4
D4=imfilter(D2,H1); 
subplot(235)
imshow(D4)
title({'Center Mask value = - 4','with Salt & Pepper noise'})

%Salt & Pepper noise Center Mask= 8
D3=imfilter(D2,H2); 
subplot(236)
imshow(D3)
title({'Center Mask value = 8','with Salt & Pepper noise'})

% (2) High boost filtering.
figure;
s=input('Enter High Boost Filter Factor:');
subplot(2,3,1);
imshow(J);
title('Original Images')

F1 =[0 1 0;
    1 s-4 1;
    0 1 0];
l = imfilter(J,F1)
subplot(2,3,2);
imshow(l);
title('High Boost filtering with center -4');

F2 = [-1 -1 -1;
    -1 s+8 -1;
    -1 -1 -1]; 
m = imfilter(J,F2)
subplot(233);
imshow(m);
title('High Boost filtering with center 8');

%Salt & Pepper Noise 
M2=imnoise(J,'salt & pepper'); 
subplot(234)
imshow(M2) 
title('Salt & Pepper Noise Image')

%Salt & Pepper noise Center Mask=-4
C1=imfilter(M2,F1); 
subplot(235)
imshow(C1)
title({'Center Mask value = - 4','with Salt & Pepper noise'})

%Center Mask=8, Salt & Pepper noise
C2=imfilter(M2,F2); 
subplot(236)
imshow(C2)
title({'Center Mask value = 8','with Salt & Pepper noise'})


%(3) Composite Laplacian filter with and without Noise (Salt & Pepper
%Noise)
figure;
l1=[0 1 0; %Positive Laplacian Filter
1 -4 1;
0 1 0];

l2=[-1 -1 -1; %Negative Laplacian Filter
-1 8 -1;
-1 -1 -1];

%original
J = imresize(I, [256,256])
J=rgb2gray(imread('image.jpeg'));
subplot(231)
imshow(J) %Original Image 
title('Original Image')

%salt & pepper Noise
N2=imnoise(J,'salt & pepper'); 
subplot(232)
imshow(N2)
title('Salt & Pepper Noise Image')

%No noise Center Mask=-4
j1=imfilter(J,l1);
subplot(233)
imshow(j1)
title({'Center Mask value = - 4','without noise'})

%No noise Center Mask=8
j4=imfilter(J,l2);
subplot(234)
imshow(j4)
title({'Center Mask value = 8','without noise'})

%Salt & Pepper noise, Center Mask=-4,
j1=imfilter(N2,l1);
subplot(235)
imshow(j1)
title({'Center Mask value = - 4','with Salt & Pepper noise'})

% Salt & Pepper noise, Center Mask=8
j4=imfilter(N2,l2); 
subplot(236)
imshow(j4)
title({'Center Mask value = 8','with Salt & Pepper noise'})
