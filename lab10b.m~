clc;
clear all;
close all; 

HSI=im2double(imread('image4.png')); 
figure,subplot(121),imshow(HSI);
title('HSI Image'); 

%Obtain the Hue, Saturation and Intensity components 
H1=HSI(:,:,1);
S1=HSI(:,:,2);
I1=HSI(:,:,3);

%Multiply Hue by 360 to represent in the range [0 360]
H1=H1*360;

%Preallocate the R,G and B components
 R1=zeros(size(H1));
 G1=zeros(size(H1));
 B1=zeros(size(H1));
 RGB1=zeros([size(H1),3]);

%RG Sector(0<=H<120)

%When H is in the above sector, the RGB components equations are
B1(H1<120)=I1(H1<120).*(1-S1(H1<120));
R1(H1<120)=I1(H1<120).*(1+((S1(H1<120).*cos(H1(H1<120)))./cos(60- H1(H1<120))));
G1(H1<120)=3.*I1(H1<120)-(R1(H1<120)+B1(H1<120));

%GB Sector(120<=H<240)
%When H is in the above sector, the RGB components equations are
%Subtract 120 from Hue
H2=H1-120;
R1(H1>=120&H1<240)=I1(H1>=120&H1<240).*(1-S1(H1>=120&H1<240));
G1(H1>=120&H1<240)=I1(H1>=120&H1<240).*(1+((S1(H1>=120&H1<240).*cos(H2(H1>= 120&H1<240)))./cos(60-H2(H1>=120&H1<240))));
B1(H1>=120&H1<240)=3.*I1(H1>=120&H1<240)- (R1(H1>=120&H1<240)+G1(H1>=120&H1<240));

%BR Sector(240<=H<=360)
%When H is in the above sector, the RGB components equations are
%Subtract 240 from Hue
H2=H1-240;
G1(H1>=240&H1<=360)=I1(H1>=240&H1<=360).*(1-S1(H1>=240&H1<=360));
B1(H1>=240&H1<=360)=I1(H1>=240&H1<=360).*(1+((S1(H1>=240&H1<=360).*cos(H2(H1>=240&H1<=360)))./cos(60-H2(H1>=240&H1<=360))));
R1(H1>=240&H1<=360)=3.*I1(H1>=240&H1<=360)- (G1(H1>=240&H1<=360)+B1(H1>=240&H1<=360));

%Form RGB Image
RGB1(:,:,1)=R1;
RGB1(:,:,2)=G1;
RGB1(:,:,3)=B1;

%Represent the image in the range [0 255]
RGB1=im2double(RGB1); 
subplot(122),imshow(RGB1);
title('RGB Image');

org=im2double(imread('image4.png')); 
[m,n]=size(org);
figure;subplot(121),imshow(org);
title('original image'); 
subplot(122),imshow(RGB1);
title('reconstructed image');
org1=rgb2gray(org); 
RGB2=rgb2gray(RGB1);
figure;
subplot(211);
imhist(org1);
title('Histogram of original image'); 
subplot(212);
imhist(RGB2);
title('Histogram of reconstructed image');
max=0;
for x=1:m
    for y=1:n
        max=max + ((RGB1(x,y)-org(x,y))^2);
    end
end
mse=(max)/(m*n);
psnr=10*log10((255^2)/mse);
disp('MSE:');
disp(mse);
disp('PSNR:');
disp(psnr);