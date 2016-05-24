function [ media ] = retirarMedia( path )
    pastas = dir(path);
    
    [ rfSize, Pyramid ] = config();
    
    acumulado = zeros(getNumLinhasPatche(path), 16);
    quantidade_imagens = 0;
    
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
           
           acumulado = (acumulado + patches);           
       end    
        quantidade_imagens =  quantidade_imagens + length(nome_fotos);
    end
    
    result = sum(acumulado);
    
    
    
    [linhas, colunas] = size(acumulado);
    
    media = result / (linhas * quantidade_imagens);

end

