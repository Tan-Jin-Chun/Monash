function [segmented_img, final_centroids, total_iter] = imagesegkmeans(img, k, max_iter, ...
    verbose, show_scatter)
 % img: input img
 % k: number of centroids/ means
 % max_iter: number of iterations to force stop the algorithm
 % verbose: Enable to show the output images, and the scatterplot
 % show_scatter: Enable to show the scatterplot, must be enabled with
 % verbose
 
 % segmented_img: color coded img
 % final_centroids: final centroid/means position
 % total_iter: total number of iterations to convergence
 
 % random seed
    rng('shuffle');
    
    img = cast(img, 'single');
    if verbose == 1
       display('Image has been casted into single type'); 
    end
    
    if ~exist('verbose', 'var')
       verbose = 0;
    end
    if ~exist('show_scatter', 'var')
       show_scatter = 0;
    end
    [width, height, channel] = size(img);
    flatten_img = reshape(img, [width*height,3]);
    
    r = randi([1, length(flatten_img)],1,k);
    
    % random centroid initialization
    init_centroid = flatten_img(r, :);
    centroid = init_centroid;
    new_centroid = init_centroid;
    if verbose == 1
       for c = 1:k
           fprintf("init centroid %d: %d %d %d\n",c, init_centroid(c,1),...
               init_centroid(c,2), init_centroid(c,3));
       end
    end
    euclid_dist = zeros(width*height, k);
    temp_ed = 0;
    temp_norm = 0;
    cluster_assignment = zeros(width*height, 1);
    diff = 50;
    counter = 0;
    
    % while there is still a difference in between iterations
    % and the maximum iteration is not reached yet
    while diff > 1 && counter < max_iter
        % recomputation of euclidean distance
        centroid = new_centroid;
        for c = 1:k
           temp_norm = (flatten_img - repmat(centroid(c,:), width*height, 1)).^2;
           temp_ed = sqrt(sum(temp_norm, 2));
           euclid_dist(:, c) = temp_ed;
        end
        % assigning to closest centroid
        [~, min_idx] = min(euclid_dist, [], 2);
        cluster_assignment = min_idx;

        %new_centroid = zeros(size(init_centroid));
        % recomputation of centroids position
        diff_centroid = zeros(1,k);
        for c = 1:k
            new_centroid(c, :) = round(mean(flatten_img(cluster_assignment == c,:), 1));
            diff_centroid(c) = (new_centroid(c,:) - centroid(c, :))*(new_centroid(c,:) - centroid(c, :))';
        end

        diff = sum(diff_centroid);
        counter = counter + 1;
        

        if verbose == 1
            quantization_img = zeros(size(flatten_img));
            for c = 1:k
                quantization_img(cluster_assignment == c, :) = ...
                    repmat(new_centroid(c,:), length(quantization_img(cluster_assignment == c, :)), 1);
            end

            segmented_img = reshape(quantization_img, height, width, 3);
            segmented_img = cast(segmented_img, 'uint8');
            figure(1);
            montage({cast(img, 'uint8'), segmented_img});
            ti = sprintf('Before K-means (left) and after K-means (right) with k = %d and iteration = %d', k, counter);
            title(ti);

            if show_scatter == 1
                Rc = new_centroid(:,1);
                Gc = new_centroid(:,2);
                Bc = new_centroid(:,3);
                temp_img = cast(img, 'uint8');
                R = reshape(img(:, 100:100:512, 1), [1, length(100:100:512)*512]);
                G = reshape(img(:, 100:100:512, 2), [1, length(100:100:512)*512]);
                B = reshape(img(:, 100:100:512, 3), [1, length(100:100:512)*512]);
                R_color = reshape(segmented_img(:, 100:100:512, 1), [1, length(100:100:512)*512]);
                G_color = reshape(segmented_img(:, 100:100:512, 2), [1, length(100:100:512)*512]);
                B_color = reshape(segmented_img(:, 100:100:512, 3), [1, length(100:100:512)*512]);
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
                ti = sprintf('Dispersion of Color in iteration %d', counter);
                title(ti);
                hold off;
            end

            disp("Press any key to continue");
            pause;
        end
        
    end
    total_iter = counter;
    final_centroids = new_centroid;
    quantization_img = zeros(size(flatten_img));
    
    % assigning to color code and reshape the matrix
    for c = 1:k
        quantization_img(cluster_assignment == c, :) = repmat(new_centroid(c,:), length(quantization_img(cluster_assignment == c, :)), 1);
    end
    segmented_img = reshape(quantization_img, height, width, 3);

    segmented_img = cast(segmented_img, 'uint8');
    
end

