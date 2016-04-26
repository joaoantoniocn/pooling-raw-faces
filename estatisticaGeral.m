function [ acertos ] = estatisticaGeral( folder_name, lfwInputs, legenda, legenda2 )
%ESTATISTICAGERAL Summary of this function goes here
%   Detailed explanation goes here

    pasta = dir(folder_name);
    acertos = [];
    acertos = [acertos, cellstr('KNN'),cellstr('')];
    acertos = [acertos, cellstr('Neural')];
    
    
    for i=3 : length(pasta)
       
        valorKNN = estatisticaClasseKNN(pasta(i), lfwInputs, legenda2);
        valorNeural = estatisticaClasseNeural(pasta(i), legenda);
        
        acertos = [acertos; [cellstr(pasta(i).name), valorKNN, valorNeural]]; 
    end 


end

