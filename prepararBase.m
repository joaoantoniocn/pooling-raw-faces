function [  ] = prepararBase( file_name  )
%PREPARARBASE Summary of this function goes here
%   Detailed explanation goes here
    file_name = [file_name, '/'];
    pastas = dir(file_name);
    
    for i = 3 : length(pastas)
        
       nome_pasta = pastas(i).name;
       nome_pasta_completo = [file_name, nome_pasta, '/'];
       nome_fotos = dir([nome_pasta_completo, '/*jpg']);
      
       if length(nome_fotos) < 10
          % apagando todas as pastas com menos de n fotos
          rmdir( nome_pasta_completo, 's')
       end 
        
    end    

end

