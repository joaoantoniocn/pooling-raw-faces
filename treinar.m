function [lfwInputs, lfwTargets, legenda, legenda2, net, eigvector] = treinar( )
    
    % lfwInputs = matriz com features de cada imagem
    % lfwTargets = matriz com codigo de retorno para cada imagem, codigo de
    %              retorno indica a que classe a imagem pertence
    % legenda = mapeia as targets em labels
    % 



    % returns the information in a structure array
    CAMINHO_BASE = './treino/';
%    base = dir([CAMINHO_BASE,'/*.jpg']);
    pastas = dir(CAMINHO_BASE);
    
    % ---------- opa
    [ rfSize, Pyramid ] = config();
    % ----------
    
    lfwInputs = [];
    lfwTargets = [];
    legenda = [];
    legenda2 = [];
    
    for i = 1 : length(pastas)
       
       nome_pasta = pastas(i).name;
       nome_pasta_completo = [CAMINHO_BASE, nome_pasta, '/'];
       nome_fotos = dir([nome_pasta_completo, '/*jpg']);
      
       for j=1 : length(nome_fotos)
           % imshow([nome_pasta_completo, nome_fotos(j).name]);
           % tratando a imagem
           x = imread([nome_pasta_completo, nome_fotos(j).name]);
            %x = rgb2gray(x);
           x = double(x);
           
           % display(nome_fotos(j).name);
           % pegando as features da imagem
          lfwInputs = [lfwInputs; fea_pooling(x,rfSize, eigvector, Pyramid)];
           % gerando as targets           
          lfwTargets =[lfwTargets; gerar_target(length(pastas), i)]; 
          legenda2 = [legenda2; cellstr(nome_pasta)];
                      
       end    
       % legenda pras targets
       legenda = [legenda; cellstr(nome_pasta)];
    end
    
    % formatando
    % lfwInputs = lfwInputs';
    % lfwInputs(1, :) = [];
    lfwTargets = lfwTargets';
    lfwTargets(1, :) = [];
    lfwTargets(1, :) = [];
    legenda(1) = [];
    legenda(1) = [];
    %legenda2(1, :) = [];
  
    % treinando rede neural
   
    x = lfwInputs;
    x = x';
    t = lfwTargets;

    % Create a Pattern Recognition Network
    hiddenLayerSize = 10;
    net = patternnet(hiddenLayerSize);


    % Setup Division of Data for Training, Validation, Testing
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 15/100;
    net.divideParam.testRatio = 15/100;
    
    [net,tr] = train(net,x,t);
    
end

