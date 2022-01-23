clc;
clear all;
close all;

%using Function 
im=imread('image2.png');
I = rgb2gray (im)
figure;
subplot(2,3,1); 
imshow(im) 
title('original image') 
SE1=[1 1 1;
    1 1 1;
    1 1 1];
SE2 = [ 1 0 0;
    1 0 1;
    0 0 1];

%%Dilation 
D1=imdilate(im,SE1) 
subplot(232); 
imshow(D1)
title('dilated image')

%%EROSION
E1=imerode(im,SE1)
subplot(233);
imshow(E1)
title('ERODED image')

%%OPENING
O1=imopen(im,SE1)
subplot(234);
imshow(O1);
title('OPEN image')

%%CLOSING
C1=imclose(im,SE1)
subplot(235);
imshow(C1);
title('CLOSE image')

%different SE
figure;
im=imread('image2.png');
I = rgb2gray (im)
figure;
subplot(2,3,1); 
imshow(im) 
title('original image')

%%Dilation 
D2=imdilate(im,SE2) 
subplot(232); 
imshow(D2)
title('dilated image with SE2')

%%EROSION
E2=imerode(im,SE2)
subplot(233);
imshow(E2)
title('ERODED image with SE2')

%%OPENING
O2=imopen(im,SE2)
subplot(234);
imshow(O2);
title('OPEN image with SE2')

%%CLOSING
C2=imclose(im,SE2)
subplot(235);
imshow(C2);
title('CLOSE image with SE2')

%without function erosion and dilation
a=imread('image2.png');
a = rgb2gray (a)
figure; 
subplot(131); 
imshow(a); 
title('Original Image') 
p=size(a);
w = [1 1 1;
    1 1 1;
    1 1 1]; 

%structure element 
for x=2:1:p(1)-1
    for y = 2:1:p(2)-1
        a1 = [w(1)*a(x-1,y-1) w(2)*a(x-1,y) w(3)*a(x-1,y+1)...
            w(4)*a(x,y-1) w(5)*a(x,y) w(6)*a(x,y+1) w(7)*a(x+1,y-1) w(8)*a(x+1,y) w(9)*a(x+1,y+1)];
        A1(x,y) = max(a1); %dilation
        A2(x,y) = min(a1); %erosion
    end
end

subplot(132);
imshow(A1);
title('Dilation without function')
subplot(133);
imshow(A2);
title('Erosion without function') 

%opening without function
img = imread('image2.png');
a = rgb2gray (img)
a = double(a);
p = size(a);

figure;
subplot(311);
imshow(img);
title('Original Image')
w = [1 1 1;
    1 1 1;
    1 1 1];
O=imopen(img,w)
subplot(312);
imshow(O);
title('OPEN image with fuction') 

for x=2:1:p(1)-1
    for y = 2:1:p(2)-1
        a1 = [w(1)*a(x-1,y-1) w(2)*a(x-1,y) w(3)*a(x-1,y+1)...
            w(4)*a(x,y-1) w(5)*a(x,y) w(6)*a(x,y+1) w(7)*a(x+1,y-1) w(8)*a(x+1,y) w(9)*a(x+1,y+1)];
        A2(x,y) = min(a1); %erosion
    end
end
q = size(A2);
for i=2:1:q(1)-1
    for j = 2:1:q(2)-1
        a11 = [w(1)*A2(i-1,j-1) w(2)*A2(i-1,j) w(3)*A2(i-1,j+1)...
            w(4)*A2(i,j-1) w(5)*A2(i,j) w(6)*A2(i,j+1) w(7)*A2(i+1,j-1) w(8)*A2(i+1,j) w(9)*A2(i+1,j+1)];
        A22(i,j) = max(a11);%dilation
    end
end
subplot(313);
imshow(A22);
title('Open without function')

% closing without function
img = imread('image.png');
I = rgb2gray (img)
a = double(img);
p = size(a);
figure;
subplot(3,1,1);
imshow(img);
title('Original Image')
w = [1 1 1;1 1 1;1 1 1];
C=imclose(img,w)
subplot(3,1,2);
imshow(C);
title('CLOSE image')
for x=2:1:p(1)-1
    for y = 2:1:p(2)-1
        a1 = [w(1)*a(x-1,y-1) w(2)*a(x-1,y) w(3)*a(x-1,y+1)...
            w(4)*a(x,y-1) w(5)*a(x,y) w(6)*a(x,y+1) w(7)*a(x+1,y-1) w(8)*a(x+1,y) w(9)*a(x+1,y+1)];
        A1(x,y) = max(a1); %dilation
    end
end
q = size(A1);
for i=2:1:q(1)-1
    for j = 2:1:q(2)-1
        a12 = [w(1)*A1(i-1,j-1) w(2)*A1(i-1,j) w(3)*A1(i-1,j+1)...
            w(4)*A1(i,j-1) w(5)*A1(i,j) w(6)*A1(i,j+1) w(7)*A1(i+1,j-1) w(8)*A1(i+1,j) w(9)*A1(i+1,j+1)];
        A12(i,j) = min(a12);%erosion
    end
end
subplot(313);
imshow(A12);
title('close without function')
