clc
clear all
close all
j1=imread('image.jpg');
j2=imread('cameraman.jpg');
i1=imresize(j1,[256 256]);
i2=imresize(j2,[256 256]);

subplot(2,4,1);
imshow(i1);%image 1 for mathematical operation 
title('Image1');
subplot(2,4,2);

imshow(i2);%image 2 for mathematical operation 
title('Image2')

com=imcomplement(i1);
subplot(2,4,3);
imshow(com);%Complement of image1 
title('Complement of Image1')

com=imcomplement(i2); 
subplot(2,4,4); 
imshow(com);%Complement of image2 
title('Complement of Image2')

add=imadd(i1,i2); 
subplot(2,4,5); 
imshow(add);%Addition 
title('Addition')

sub=imsubtract(i1,i2); 
subplot(2,4,6); 
imshow(sub);%Subtraction 
title('Subtraction')

mul=immultiply(i1,i2); 
subplot(2,4,7);
imshow(mul);%Multiplication 
title('Multiplication')

div=imdivide(i1,i2); 
subplot(2,4,8); 
imshow(div);%Division 
title('Division')