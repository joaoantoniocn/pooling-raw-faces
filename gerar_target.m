function target = gerar_target( numeroClasses, posicao)
%GERAR_TARGET Summary of this function goes here
%   Detailed explanation goes here
    
    target = zeros(1, numeroClasses); % targer � o retorno da rede neural
                 % legenda � o que traduz uma target em um label

    target(posicao) = 1;  

end

