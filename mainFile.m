function projectFile(image_file,k)

A = double(imread(image_file));

A = A / 255; % Divide by 255 so that all values are in the range 0 - 1
img_size = size(A); % Size of the image

X = reshape(A, img_size(1) * img_size(2), 3);

K = k; max_iters = 10;
initial_centroids = kMeansInitCentroids(X, K);

[centroids, idx] = runkMeans(X, initial_centroids, max_iters); % Run K-Means

idx = findClosestCentroids(X, centroids);

X_recovered = centroids(idx,:);

X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

subplot(1, 2, 1);
imagesc(A); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));

end
