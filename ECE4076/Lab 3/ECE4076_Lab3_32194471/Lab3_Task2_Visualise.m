% Written by Nigel Tan Jin Chun
% Last Modified: 4/4/2023
% Name of the file: Lab3_Task2_Visualise

clearvars -except img k;
close all; clc;
img = imread('sharon.jpg');
k = 4;
max_iter = 200;
verbose = 0;
show_scatter = 1;
[segmented_img, centroids, total_iter] = imagesegkmeans(img, k, max_iter, ...
    verbose, show_scatter);

[img_rows1, img_cols1, ~] = size(img);
[img_rows2, img_cols2, ~] = size(img);
[img_rows3, img_cols3, ~] = size(img);
column_indices1 = 100:250:min(img_cols1, 512);
column_indices2 = 100:250:min(img_cols2, 512);
column_indices3 = 100:250:min(img_cols3, 512);

Rc = centroids(:,1);
Gc = centroids(:,2);
Bc = centroids(:,3);
R = reshape(img(:, column_indices1, 1), [1, length(column_indices1)*256]);
G = reshape(img(:, column_indices2, 2), [1, length(column_indices2)*256]);
B = reshape(img(:, column_indices3, 3), [1, length(column_indices3)*256]);
R_color = reshape(segmented_img(:, column_indices1, 1), [1, length(column_indices1)*256]);
G_color = reshape(segmented_img(:, column_indices2, 2), [1, length(column_indices2)*256]);
B_color = reshape(segmented_img(:, column_indices3, 3), [1, length(column_indices3)*256]);

figure(2);
imshow(segmented_img);
ti = sprintf('K-means clustering Image with k = %d', k);
title(ti);

figure(3);
for c = 1:k
    scatter3(Rc(c),Gc(c),Bc(c), 80, cast([Rc(c),Gc(c),Bc(c)], 'double')./255, ...
        'filled','MarkerEdgeColor','k');
    text(Rc(c),Gc(c),Bc(c)+25,sprintf('Centroid %d',c), ...
            'HorizontalAlignment','center', ...
            'Color', 'b', ...
            'EdgeColor', 'b', ...
            'BackgroundColor', 'w');
    hold on;
end

scatter3(R,G,B, 20, cast([R_color;G_color;B_color]', 'double')./255, '*');

box on;
xlabel('Red');
ylabel('Green');
zlabel('Blue');
title('Dispersion of Color in sharon.jpg: every 100th pixel in every row');
hold off;