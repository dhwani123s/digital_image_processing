clc
clear all
close all

n=input('Enter Sampling Rate: '); 
I=im2double(imread('cameraman.jpg'));
J=im2double(imresize(I,1/n));

x=imresize(J,n,'nearest');%Nearest Neighborhood interpolation 
y=imresize(J,n,'bilinear');%Bilinear interpolation 
z=imresize(J,n,'bicubic');%Bicubic interpolation

%Original image
subplot(2,3,1);
imshow(I);
title('Original Image');

%Downscaled image by 1/n
subplot(2,3,3);
imshow(J);
title(['DownScaled Image by : 1 /',num2str(n)]);

%Nearest Neighborhood interpolation
subplot(2,3,4);
imshow(x);
title('UpScaled Using "Nearest" InterPolation'); %Bilinear interpolation

subplot(2,3,5);
imshow(y);
title('UpScaled Using "Bilinear" InterPolation'); %Bicubic interpolation

subplot(2,3,6);
imshow(z);
title('UpScaled Using "Bicubic" InterPolation'); %PSNR

[m,n]=size(I);
max_n=0;
max_b1=0;
max_bc=0;
for a=1:m 
    for b=1:n
        max_n=max_n + ((x(a,b)-I(a,b))^2); max_b1=max_b1 + ((y(a,b)-I(a,b))^2); max_bc=max_bc + ((z(a,b)-I(a,b))^2);
    end
end

mse_n=(max_n)/(m*n); 
mse_b1=(max_b1)/(m*n); 
mse_bc=(max_bc)/(m*n);

psnr_n=10*log((255^2)/mse_n)%PSNR Nearest Neighborhood 
psnr_bl=10*log((255^2)/mse_b1)%PSNR Bilinear 
psnr_bc=10*log((255^2)/mse_bc)%PSNR Bicubic