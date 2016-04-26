function resultado = estatisticaClasseKNN( folder, lfwInputs, legenda2 )
%ESTATISTICACLASSE Summary of this function goes here
%   Detailed explanation goes here
    
    nome_classe = folder.name;
    caminho = ['./test/', nome_classe, '/'];
   
    nome_fotos = dir([caminho, '/*jpg']);
    
    resultado = 0;
    
    for i=1 : length(nome_fotos)
       
       result = classificarKNN([caminho,nome_fotos(i).name], lfwInputs, legenda2);  
       
       if strcmp(nome_classe(1, :), result(1, :))          
           resultado = resultado + 1;     
       end
        
    end
   
    resultado = resultado/length(nome_fotos);
    
end

