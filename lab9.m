clc;
clear all;
close all;

% Original Image
I = imread('image3.png');
[m,n] = size(I)
J = imresize(I, [256,256])
[x,y] = size(J)
subplot(241);
imshow(J);
title('Original Images')

%J=im2bw(I);
J=logical(I);
F=imfill(J,'holes');
A=fspecial('average');  % Average Filter

S=imfilter(F,A,'replicate');
subplot(122);
imshow(S);
title('Total counted objects');
[M,N]=bwlabel(S);
fprintf('No.of objects: %d',N);
text(18,18,strcat('\color{red} Objects: ',num2str((N))));
hold on
