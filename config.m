function [ rfSize, eigvector, Pyramid ] = config()
%CONFIG Summary of this function goes here
%   Detailed explanation goes here

%     CAMINHO_BASE = './treino/';
%     pastas = dir(CAMINHO_BASE);
%     image_dims = [100, 100];
% 
%     for i = 1 : length(pastas)
%        
%        nome_pasta = pastas(i).name;
%        nome_pasta_completo = [CAMINHO_BASE, nome_pasta, '/'];
%        nome_fotos = dir([nome_pasta_completo, '/*jpg']);
%       
%        for j=1 : length(nome_fotos)
%            % imshow([nome_pasta_completo, nome_fotos(j).name]);
%            % tratando a imagem
%            x = imread([nome_pasta_completo, nome_fotos(j).name]);
%             %x = rgb2gray(x);
%            x = double(x);
%            
%             if j == 1
%                 images = zeros(prod(image_dims), length(nome_fotos));
%             end
%     
%             images(:, j) = x(:);
%                  
%        end    
%       
%     end
% 
%     % steps 3 and 4: calculate the ordered eigenvectors and eigenvalues
%     [evectors, score, evalues] = pca(images');
%     
%     % step 5: only retain the top 'num_eigenfaces' eigenvectors (i.e. the principal components)
%     num_eigenfaces = 16;
%     evectors = evectors(:, 1:num_eigenfaces);


    % ---------------------
    rfSize = 4;
     eigvector = eye(rfSize^2);
    %eigvector = evectors;
    Pyramid = [ 1 1; 2 2; 4 4; 6 6; 8 8; 10 10];
end

