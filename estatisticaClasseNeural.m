function resultado = estatisticaClasseNeural( folder, legenda, net, eigvector)
%ESTATISTICACLASSE Summary of this function goes here
%   Detailed explanation goes here
    
    nome_classe = folder.name;
    caminho = ['./test/', nome_classe, '/'];
   
    nome_fotos = dir([caminho, '/*jpg']);
    
    resultado = 0;
    
    for i=1 : length(nome_fotos)
       
       result = classificarNeural([caminho,nome_fotos(i).name], legenda, net, eigvector);  
       
       if strcmp(nome_classe(1, :), result(1, :))          
           resultado = resultado + 1;     
       end
        
    end
   
    resultado = resultado/length(nome_fotos);
    
end

