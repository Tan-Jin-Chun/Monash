% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: Lab2_Task5
% Function of the file: Improving the visual quality of the stiched image

% The main 4 image processing techniques
% Adjusting the width of output image so that less black pixels are visible
% Adjusting the brightness (by a scalling factor) of each image so that the
% seam is less visible
% Applying a small amount of Gaussian Blur of Alpha bending near the seam
% to make it less visible
% Adjusting the horizontal location of the seam (it can be moved further to the left
% as the right image)

clear all;clc;close all;

% Declaring and intialising the variable
% Using imread to read the given left and right image
left_image = imread("left.jpg");
right_image = imread("right.jpg");

% Creating the 1024x384 image
new_image = zeros(384,1024);

% The homography
homography = [1.6010, -0.0300, -317.9341;
              0.1279, 1.5325,  -22.5847;
              0.0007, 0,       1.2865];

% Convert the pixel values of the left image to floating-point numbers
double_left_image = double(left_image);

% Getting the dimensions of the image
[height_left_image, width_left_image] = size(left_image);

% Filling the LHS with the left image
new_image(:, 1:width_left_image) = double_left_image;

% Setting up the coordinate vector with z = 1
% Filling in the remaining 512x384 pixels on the RHS
empty_grid = zeros(384*512,3);

% Initialising the variable for looping
x = 512 + 1;
y = 1;

% Using the for loop to fill up the empty grid with 3-element homogeneous
% coordinates
for i = 1:(width_left_image*height_left_image)
    empty_grid(i,:) = [x, y, 1];
    y = y + 1;

    if (y > height_left_image)
        y = 1;
        x = x + 1;
    end

end

% If the right pixel coordinate is valid, generate the pixel value using
% the bilinear interpolation function that we have created (myInterp2)

% If the right pixel coordinate is invalid, use a pixel value of 0

% For each pixel in empty_grid, the homography matrix H is used to transform the 
% pixel coordinates from the right image to the left image. 
% The transformed coordinates are then used to perform bilinear interpolation
% on the right input image using the bilinearInterpolation function.

% Declaring and initialising the variable
% transformed coordinates z = 1
rc = [];

% transformed points
transformed_points = 0; 
intensity_points = 0;

% Declaring the smallest x and largest x variable
largest_x = 0;
smallest_x = 1024;

% pixel by pixel calculation of intensity
for i=1:length(empty_grid)

    % Applying the homography to transform the left image to the corresponding
    % locations in the right image
    transformed_points = (homography * empty_grid(i,:)')';

    % transforming the 3-element homogenous
    % coordinates to 2D image pixel coordinates by dividing the first and
    % second elements by the third elements
    rc = [transformed_points(1)./transformed_points(3), transformed_points(2)./transformed_points(3)];

    if rc(1) > 512
        continue
    end

    % Adding extra conditions to check for here
    if empty_grid(i,1) > largest_x
       largest_x = empty_grid(i,1); 
    end
    if floor(rc(1)) < smallest_x
       smallest_x = floor(rc(1)); 
    end

    % Calling the written function 
    intensity_points = myInterp2(rc(1), rc(2), right_image);

    % Filling the new values (newly found intensity values) into the new
    % image
    new_image(empty_grid(i,2), empty_grid(i,1)) = intensity_points;

end

% Cropping of image
% Automatic cropping of image
new_image = new_image(:, 1:largest_x);

% Declaring and initialising new variables
% Scalling of brightness
crop_right_image = uint8(new_image(:, 513:largest_x));

% Window-by-Window Brightness Adjustment
processed_crop_right_image = crop_right_image;
processed_crop_right_image(1:50,:) = processed_crop_right_image(1:50, :)*0.75;
processed_crop_right_image(51:100,:) = processed_crop_right_image(51:100, :)*0.72;
processed_crop_right_image(101:150,:) = processed_crop_right_image(101:150, :)*0.72;
processed_crop_right_image(151:200,:) = processed_crop_right_image(151:200, :)*0.805;
processed_crop_right_image(201:300,:) = processed_crop_right_image(201:300, :)*0.805;
processed_crop_right_image(301:320,:) = processed_crop_right_image(301:320, :)*0.805;
processed_crop_right_image(321:340,:) = processed_crop_right_image(321:340, :)*0.78;
processed_crop_right_image(341:360,:) = processed_crop_right_image(341:360, :)*0.775;
processed_crop_right_image(361:384,:) = processed_crop_right_image(361:384, :)*0.775;

% Gaussian blur at the seam and brightness control at the stitched RHS
processed_stitch_image = [uint8(new_image(:, 1:512)), processed_crop_right_image(:,5:end)];
processed_stitch_image(221:end, 470:520) = imgaussfilt(double(processed_stitch_image(221:end, 470:520)), 'FilterSize', [21 21]);
processed_stitch_image(361:370, 470:520) = imgaussfilt(double(processed_stitch_image(361:370, 470:520)), 'FilterSize', [5 5]);
processed_stitch_image(361:370, 470:520) = imgaussfilt(double(processed_stitch_image(361:370, 470:520)), 'FilterSize', [5 5]);
processed_stitch_image(321:340, 470:520) = imgaussfilt(double(processed_stitch_image(321:340, 470:520)), 'FilterSize', [5 5]);

% Displaying the newly formed stitched and processed image
figure(5);
imshow(processed_stitch_image, [0 255], 'InitialMagnification', 'fit');
title("Full Image (Stitched & Processed)");
xlabel("x");
ylabel("y");

figure(6);
imshow(processed_stitch_image, [0 255], 'InitialMagnification', 'fit');
axis on;
title("Full Image (Stitched & Processed)");
xlabel("x");
ylabel("y");