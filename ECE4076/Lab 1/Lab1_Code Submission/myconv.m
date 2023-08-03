% Written by Nigel Tan Jin Chun
% Last Modified: 15/3/2023
% Name of the file: myconv
% Purpose of the file: Implementing the function of the myconv function
% Returns the convolution of the image with the kernel
% Used in Task 1

function B = myconv(Im, kernel)

    % Declaring and initialising all of the variables required to loop through
    % the kernel and the image itself
    % Declaring and initialising the kernel first
    size_kernel = size(kernel);
    row_kernel = size_kernel(1);
    col_kernel = size_kernel(2);

    % Convert image to double percision
    Im_double = im2double(Im);

    % Ensuring that the output image will have the same size as the input
    % image by padding the double precision values with zeros on all sides
    % using the padarray function
    Im_p = padarray(Im_double, [floor(row_kernel/2), floor(col_kernel/2)], 'replicate', 'both');
    
    % Getting the row and column of the image
    size_Im = size(Im_double);
    row_Im = size_Im(1);
    col_Im = size_Im(2);
    
    % Preallocating the variable for efficiency allocation purposes
    % B is basically the output image
    B = zeros(size_Im);

    % Using 4 loops to loop through the kernel and the image in order to
    % perform the convolution operation
    % Looping through the pixels in the image
    for x = 1:row_Im
        for y = 1:col_Im

            % Looping through the pixels in the kernel
            for j = 1:row_kernel
                for k = 1:col_kernel
                    
                    % For each pixel in the input image, the corresponding pixel in the output image is computed by multiplying the values in the kernel with the corresponding pixels in the padded input image and summing the result.
                    B(x, y) = B(x, y) + (kernel(j,k) * Im_p(x + j - 1, y + k - 1));
                    
                end
            end
        end
    end

end
