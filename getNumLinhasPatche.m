function [ linhas ] = getNumLinhasPatche( path )
%GETNUMLINHASPATCHE Summary of this function goes here
%   calcula o numero de linhas de um patches, usado na função
%   retirarMedia()
     pastas = dir(path);
     
     [ rfSize, Pyramid ] = config();
    
    
        
     nome_pasta = pastas(4).name;
     nome_pasta_completo = [path, nome_pasta, '/'];
     nome_fotos = dir([nome_pasta_completo, '/*jpg']);
     
     
     x = imread([nome_pasta_completo, nome_fotos(1).name]);
     %x = rgb2gray(x);
     x = double(x);
     
     % --------- patches
     patches =  im2col(x, [rfSize rfSize])';
     
     % contrast normalization
     patches = bsxfun(@rdivide, bsxfun(@minus, patches, mean(patches, 2)), ...
         sqrt(var(patches, [], 2)+10));
     % ---------
    
    
    [linhas, colunas] = size(patches);
    
 end

