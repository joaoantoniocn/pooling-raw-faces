input_dir = '/Users/eduardotavares/Dropbox/UFRPE/2014.1/Biometria/Projeto 2/yale/teste';
image_dims = [112, 92];
 
filenames = dir(fullfile(input_dir, '*.png'));
num_images = numel(filenames);

images = [];

for n = 1:num_images
    filename = fullfile(input_dir, filenames(n).name)
    img = imread(filename);
    img = im2double(img);
    
    if n == 1
        images = zeros(prod(image_dims), num_images);
    end
    
    images(:, n) = img(:);
end

% steps 1 and 2: find the mean image and the mean-shifted input images
mean_face = mean(images, 2);
shifted_images = images - repmat(mean_face, 1, num_images);
 
% steps 3 and 4: calculate the ordered eigenvectors and eigenvalues
[evectors, score, evalues] = princomp(images');
 
% step 5: only retain the top 'num_eigenfaces' eigenvectors (i.e. the principal components)
num_eigenfaces = 10;
evectors = evectors(:, 1:num_eigenfaces);
 
% step 6: project the images into the subspace to generate the feature vectors
features = evectors' * shifted_images;

input_image = imread('/Users/eduardotavares/Dropbox/UFRPE/2014.1/Biometria/Projeto 2/yale/class_02/sample_10.png');
input_image = im2double(input_image);



% calculate the similarity of the input to each training image
feature_vec = evectors' * (input_image(:) - mean_face);
similarity_score = arrayfun(@(n) 1 / (1 + norm(features(:,n) - feature_vec)), 1:num_images);
 



% find the image with the highest similarity
[match_score, match_ix] = max(similarity_score);
 
%display the result
figure, imshow([input_image reshape(images(:,match_ix), image_dims)]);
title(sprintf('matches %s, score %f', filenames(match_ix).name, match_score));

%figure;
%for n = 1:num_eigenfaces
%    subplot(2, ceil(num_eigenfaces/2), n);
%    evector = reshape(evectors(:,n), image_dims);
%    imshow(evector);
%end