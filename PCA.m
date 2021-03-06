function [ pca, acumulado ] = PCA( path )
%PCA Summary of this function goes here
%   Detailed explanation goes here
    
    pastas = dir(path);
    
    [ rfSize, Pyramid ] = config();
    
    acumulado = zeros(16, 16);
    media = retirarMedia(path);
    
    for i = 3 : length(pastas)
        
       nome_pasta = pastas(i).name;
       nome_pasta_completo = [path, nome_pasta, '/'];
       nome_fotos = dir([nome_pasta_completo, '/*jpg']);
      
       for j=1 : length(nome_fotos)
           x = imread([nome_pasta_completo, nome_fotos(j).name]);
           %x = rgb2gray(x);
           x = double(x);
           
           % --------- patches
           patches =  im2col(x, [rfSize rfSize])';
           
           % contrast normalization
           patches = bsxfun(@rdivide, bsxfun(@minus, patches, mean(patches, 2)), ...
					  sqrt(var(patches, [], 2)+10));
           % --------- 
           
           % retirando media
           sumPatches = sum(patches);
           patchesMenosMedia = sumPatches - media;
           
           
           acumulado = (acumulado + (patchesMenosMedia' * patchesMenosMedia));
       end    
        
    end
    
    pca = pcacov(acumulado);
    
end

