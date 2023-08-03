% testing
% Generate some random RGB color values
rgb_vals = rand(100, 3);

% Compute the centroid RGB values
centroid_rgb = mean(rgb_vals);

% Create a 3D scatter plot
fig = figure;
scatter3(rgb_vals(:,1), rgb_vals(:,2), rgb_vals(:,3), 10, rgb_vals, 'filled')
hold on
scatter3(centroid_rgb(1), centroid_rgb(2), centroid_rgb(3), 100, 'rx', 'LineWidth', 2)
hold off
xlabel('Red')
ylabel('Green')
zlabel('Blue')
