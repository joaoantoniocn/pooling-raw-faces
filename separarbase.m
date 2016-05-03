function [ ] = separarbase( file_name  )

 file_name = [file_name, '/'];
    pastas = dir(file_name);
    
    for i = 3 : length(pastas)
        
       nome_pasta = pastas(i).name;
       nome_pasta_completo = [file_name, nome_pasta, '/'];
       nome_fotos = dir([nome_pasta_completo, '/*jpg']);
       
       mkdir(['./treino/', nome_pasta]);
       for j = 0 : length(nome_fotos)
           
            if j <= (length(nome_fotos)/2)
             
              movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
            end            
       end               
    end    
end

