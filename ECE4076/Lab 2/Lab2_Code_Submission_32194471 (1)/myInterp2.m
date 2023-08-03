% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: myInterp2.m
% Function of the file: Take the transformed pixel coordinate and the
% intensity values of its four neighbours as input arguments and output the
% interpolated intensity values


function intensity = myInterp2(x_target, y_target, image)

    % Determine the nearest integer pixel coordinates
    x1 = floor(x_target); 
    x2 = ceil(x_target);
    y1 = floor(y_target);
    y2 = ceil(y_target); 
    
    % Convert the pixel values to floating-point numbers for the bilinear interpolation computation
    % image = double(image);

    % Initialising the variables for efficiency allocation purpose
    intensity = zeros(1,length(x1));

    % Using a for loop to calculate the interpolated intensity value
    for i = 1:length(intensity)

        % A, B, C, D are the intensity of the neighboring pixels
        A = (image(y1(i), x1(i)));
        B = (image(y1(i), x2(i)));
        C = (image(y2(i), x1(i)));
        D = (image(y2(i), x2(i)));
        
        % interpolating in the X direction
        R1 = (x2(i) - x_target(i)) / (x2(i) - x1(i)) * A + (x_target(i) - x1(i)) / (x2(i) - x1(i)) * B;
        R2 = (x2(i) - x_target(i)) / (x2(i) - x1(i)) * C + (x_target(i) - x1(i)) / (x2(i) - x1(i)) * D;
        
        % interpolating in the Y direction
        intensity(i) = (y2(i) - y_target(i)) / (y2(i) - y1(i)) * R1 + (y_target(i) - y1(i)) / (y2(i) - y1(i)) * R2;
    end
end