# digital_image_processing
MATLAB work of Digital Image and Video Processing


AIM 1 : 

a) Image type conversion:
Gray to Binary
Binary thresholded image
im2bw - image to binary
im2double - image to double precision
im2uint8 - image to 8-bit unsigned integers
im2uint16 - image to 16-bit unsigned integers
gray2ind=intensity image to index image
ind2gray - indexed image to intensity image
mat2gray - matrix to intensity image
rgb2gray - RGB image to grayscale
rgb2ind - RGB image to indexed image
double - double of unit8
im2double – im2double of uint8, im2double of double
b) Explore imrotate command.
c) Explore basic mathematical operations and also show workspace imadd, imsub,
immul, imdiv.


AIM 2 : 

Apply spatial resolution on original image by sampling  1/2, 1/4, 1/16 & 1/32 .Resize the output image again into the orginal image with the same sampling level & comment the result. Apply different interpolation (Nearest Neighbourhood, Bilinear & Bicubic) and comment on result.

AIM 3 :

Read an 8 bit image and then apply different image
enhancement techniques:
(a) Brightness improvement
(b) Brightness reduction
(c) Thresholding
(d) Negative of an image
(e) Log transformation
(f) Power Law transformation

AIM 4 :

To read an image, plot its histogram then do histogram
equalization Comment in the result. (With and Without using
inbuilt functions)

AIM 5 : 

To Implement Smoothing spatial filters. Read an image
and then corrupt it by ‘salt and pepper’, ’Gaussian’, ’speckle’
noise
then apply
(a) AVERAGING filter and Weighted average filter with
3x3 mask , 5x5 mask and 7X7 mask. Calculate PSNR
and comment of result and obtained filtered images
(b) Median filter with 3x3 mask , 5x5 mask and 7X7
mask. Calculate PSNR and comment of result and
obtained filtered images

AIM 6 : 

Apply 1) High pass filter,
2) High boost filter and
3) Composite Laplacian filter with and without Noise
(Salt & Pepper Noise). 
Compare all the techniques.

AIM 7 : 

Write a MATLAB program for erosion, dilation,
opening & closing using inbuilt and without
inbuilt function with different SE
You have to generate own image (binary) to get the correct
result

AIM 8 :

Write a matlab code for studying effect of Different
Masks (Sobel, Prewitt, Roberts canny and LoG) on Edges of
square with diagonals

AIM 9 : 

Write an algorithm to count the number of objects in an
image. Also check efficiency of your algorithm by varying
different dependent parameters

AIM 10 :

(a) For RGB image apply HSI conversation and display
all the three planes separately
(b) On the converted HSI image, apply HSI to RGB
conversation and compare original RGB image with
reconstructed RGB image (using histogram analysis and PSNR
analysis)
