function [ acertos ] = estatisticaGeral( folder_name, lfwInputs, legenda2 )
%ESTATISTICAGERAL Summary of this function goes here
%   Detailed explanation goes here

    pasta = dir(folder_name);
    acertos = [];
    valorTotal = 0;
    
    for i=3 : length(pasta)
        %acertos(i-2,1) = legenda(i-2);
        %acertos(i-2, 2) = estatisticaClasse(pasta(i), lfwInputs, legenda2);
        valor = estatisticaClasse(pasta(i), lfwInputs, legenda2);
        valorTotal = valorTotal + valor;
        acertos = [acertos; [cellstr(pasta(i).name), valor]]; 
    end 
    %valorTotal = (valorTotal/(length(pasta)-2));
    
    %acertos(1, 3) = cellstr('acertos:');
    %acertos(1, 4) = valorTotal;

end

