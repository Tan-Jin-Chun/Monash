% Written by Nigel Tan Jin Chun
% Last Modified: 15/3/2023
% Name of the file: myedge
% Purpose of the file: Implementing the function of the canny edge
% detector
% Returns a binary image with the edges
% Used in Task 5

function binary_Image = myedge(Im, G, theta, low_threshold, high_threshold)
    
G_magnitude = padarray(G, [1, 1], 'replicate', 'both');
    G_direction = padarray(theta, [1, 1], 'replicate', 'both');
    
    [row, col] = size(G_magnitude);
    
    new_Im = zeros(size(G_magnitude));
    upper_pixel = 0;
    lower_pixel = 0;
    
    for i = 2:row-1
        for j = 2:col-1
            upper_pixel = 255;
            lower_pixel = 255;
            if ((G_direction(i, j) == 0) || (G_direction(i, j) == 180) || (G_direction(i, j) == -180))
                upper_pixel = G_magnitude(i, j+1);
                lower_pixel = G_magnitude(i, j-1);
                
            elseif ((G_direction(i, j) == 45) || (G_direction(i, j) == -135))
                upper_pixel = G_magnitude(i-1, j+1);
                lower_pixel = G_magnitude(i+1, j-1);
           
            elseif ((G_direction(i, j) == 90) || (G_direction(i, j) == -90))
                upper_pixel = G_magnitude(i+1, j);
                lower_pixel = G_magnitude(i-1, j);
           
            elseif ((G_direction(i, j) == 135) || (G_direction(i, j) == -45))
                upper_pixel = G_magnitude(i+1, j+1);
                lower_pixel = G_magnitude(i-1, j-1);
           
            end
            
            if ((G_magnitude(i,j) >= upper_pixel) && (G_magnitude(i,j) >= lower_pixel))
                new_Im(i,j) = G_magnitude(i,j);
            end
        end
    end
    
    high_T = max(max(new_Im)) * high_threshold;
    low_T = low_threshold * high_T;
    
    cannied_img = zeros(size(G_direction));
    idx_strong = new_Im >= high_T;
    idx_irrelevant = new_Im < low_T;
    idx_weak = (new_Im >= low_T) & (new_Im < high_T);
    
    cannied_img(idx_strong) = 255;
    cannied_img(idx_weak) = 128;
    cannied_img(idx_irrelevant) = 0;
    
    binary_Image = imbinarize(cannied_img, 127);
end
