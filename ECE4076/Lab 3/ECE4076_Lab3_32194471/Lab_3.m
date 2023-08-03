%% Task 1 and 2
clearvars -except img k;
close all; clc;
img = imread('mandrill.jpg');
k = 4;
max_iter = 200;
verbose = 0; % set to 1 to see pausing key effect
[segmented_img, final_centroid, total_iteration] = imagesegkmeans(img, k, max_iter, verbose);

figure(1);
montage({img, segmented_img});
ti = sprintf('Before K-means (left) and after K-means (right) with k = %d', k);
title(ti);

figure(2);
imshow(segmented_img);
ti = sprintf('K-means clustering Image with k = %d', k);
title(ti);

%% Task 3
clearvars -except img k;
close all; clc;
img = imread('mandrill.jpg');
k = 4;
max_iter = 200;
verbose = 0;
show_scatter = 1;
[segmented_img, centroids, total_iter] = imagesegkmeans(img, k, max_iter, ...
    verbose, show_scatter);

Rc = centroids(:,1);
Gc = centroids(:,2);
Bc = centroids(:,3);
R = reshape(img(:, 100:100:512, 1), [1, length(100:100:512)*512]);
G = reshape(img(:, 100:100:512, 2), [1, length(100:100:512)*512]);
B = reshape(img(:, 100:100:512, 3), [1, length(100:100:512)*512]);
R_color = reshape(segmented_img(:, 100:100:512, 1), [1, length(100:100:512)*512]);
G_color = reshape(segmented_img(:, 100:100:512, 2), [1, length(100:100:512)*512]);
B_color = reshape(segmented_img(:, 100:100:512, 3), [1, length(100:100:512)*512]);

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
title('Dispersion of Color in mandrill.jpg: every 100th pixel in every row');
hold off;

%% Task 4 and 5
clearvars -except img k;
close all; clc;
img = imread('mandrill.jpg');
k = 4;
max_iter = 200;
verbose = 0;
show_scatter = 1;

[segmented_img, centroids, total_iter] = imagesegkmeansplus(img, k, max_iter, ...
    verbose, show_scatter);

figure(1);
montage({img, segmented_img});
ti = sprintf('Before K-means++ (left) and after K-means++ (right) with k = %d', k);
title(ti);

Rc = centroids(:,1);
Gc = centroids(:,2);
Bc = centroids(:,3);
R = reshape(img(:, 100:100:512, 1), [1, length(100:100:512)*512]);
G = reshape(img(:, 100:100:512, 2), [1, length(100:100:512)*512]);
B = reshape(img(:, 100:100:512, 3), [1, length(100:100:512)*512]);
R_color = reshape(segmented_img(:, 100:100:512, 1), [1, length(100:100:512)*512]);
G_color = reshape(segmented_img(:, 100:100:512, 2), [1, length(100:100:512)*512]);
B_color = reshape(segmented_img(:, 100:100:512, 3), [1, length(100:100:512)*512]);

figure(2);
imshow(segmented_img);
ti = sprintf('K-means++ clustering Image with k = %d', k);
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
title('Dispersion of Color in mandrill.jpg: every 100th pixel in every row');
hold off;

%% Comparing k-means and kmeans++

clearvars -except img k;
close all; clc;
img = imread('mandrill.jpg');
k = 4;
max_iter = 200;
verbose = 0;
show_scatter = 0;
kpp_iter = 0;
k_iter = 0;
for j = 1:300
    [~, ~, total_iteration_kpp] = imagesegkmeansplus(img, k, max_iter, ...
        verbose, show_scatter);

    [~, ~, total_iteration_k] = imagesegkmeans(img, k, max_iter, verbose);
    kpp_iter = kpp_iter + total_iteration_kpp;
    k_iter = k_iter + total_iteration_k;
    
end

fprintf("The average number of iteration for k-means++ is %.2f\n", kpp_iter/300);
fprintf("The average number of iteration for k-means is %.2f", k_iter/300);