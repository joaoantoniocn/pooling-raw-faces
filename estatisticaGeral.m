function [ acertos ] = estatisticaGeral( folder_name, lfwInputs, legenda, legenda2, net )
%ESTATISTICAGERAL Summary of this function goes here
%   Detailed explanation goes here

    pasta = dir(folder_name);
    acertos = [];
    acertos = [acertos, cellstr(''), cellstr('KNN')];
    acertos = [acertos, cellstr('Neural')];
    
    
    for i=3 : length(pasta)
       
        valorKNN = estatisticaClasseKNN(pasta(i), lfwInputs, legenda2);
        valorNeural = estatisticaClasseNeural(pasta(i), legenda, net);
        
        acertos = [acertos; [cellstr(pasta(i).name), valorKNN, valorNeural]]; 
    end 


end

