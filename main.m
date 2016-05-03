%clear;

% TRAINING

% Varre a pasta training, utiliza o fea_pooling para extrair características
% Gera os modelos de cada classe

% lfwInputs  = Resultado de fea_pooling 
% lfwTargets = modelos (usado para Rede Neural)
% legenda    = legenda para cada linha do lfwTargets
% legenda2   = usado para o KNN
[lfwInputs, lfwTargets, legenda, legenda2, net] = treinar();

% -----------------------------------------------------------------


% TEST

% classe = classificarKNN('./test/joao/joao-1.jpg', lfwInputs, legenda2);
resultados = estatisticaGeral('./test/', lfwInputs, legenda, legenda2, net);
