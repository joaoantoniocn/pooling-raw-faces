function [ ] = separarbase( file_name  )

    %random
    %rng(0,'twister');

 file_name = [file_name, '/'];
    pastas = dir(file_name);
    
    for i = 3 : length(pastas)
        
       nome_pasta = pastas(i).name;
       nome_pasta_completo = [file_name, nome_pasta, '/'];
       nome_fotos = dir([nome_pasta_completo, '/*jpg']);
       
       mkdir(['./test/', nome_pasta]);
       mkdir(['./treino/', nome_pasta]);
%        for j = 1 : length(nome_fotos)
%            
%             if j > (length(nome_fotos) - (length(nome_fotos)/4))
%              
%                 if j <= length(nome_fotos)
%                     movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./test/', nome_pasta, '/', nome_fotos(j).name ])
%                 end
%               
%             end            
%        end   

        % ---- random
        [trainInd,valInd,testInd] = dividerand( length(nome_fotos),0.7,0.0,0.2);
        % test
    
        copyfile([ nome_pasta_completo, '/', nome_fotos(testInd(1)).name ], ['./test/', nome_pasta, '/', nome_fotos(testInd(1)).name ])
        copyfile([ nome_pasta_completo, '/', nome_fotos(testInd(2)).name ], ['./test/', nome_pasta, '/', nome_fotos(testInd(2)).name ])
        
        % treino
        copyfile([ nome_pasta_completo, '/', nome_fotos(trainInd(1)).name ], ['./treino/', nome_pasta, '/', nome_fotos(trainInd(1)).name ])
        copyfile([ nome_pasta_completo, '/', nome_fotos(trainInd(2)).name ], ['./treino/', nome_pasta, '/', nome_fotos(trainInd(2)).name ])
        copyfile([ nome_pasta_completo, '/', nome_fotos(trainInd(3)).name ], ['./treino/', nome_pasta, '/', nome_fotos(trainInd(3)).name ])
        copyfile([ nome_pasta_completo, '/', nome_fotos(trainInd(4)).name ], ['./treino/', nome_pasta, '/', nome_fotos(trainInd(4)).name ])
        copyfile([ nome_pasta_completo, '/', nome_fotos(trainInd(5)).name ], ['./treino/', nome_pasta, '/', nome_fotos(trainInd(5)).name ])
        
    end    
end

