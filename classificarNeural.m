function [ file_label ] = classificarNeural( file_name, legenda, net, eigvector )
%CLASSIFICARNEURAL Summary of this function goes here
%   Detailed explanation goes here

    [ rfSize, Pyramid ] = config();
            
    testImg = imread(file_name);
    testImg = double(testImg);
    %testImg = rgb2gray(testImg);
    testFeatures = fea_pooling(testImg, rfSize, eigvector, Pyramid);
    testFeatures = testFeatures';
    
    result = net(testFeatures);
    result = vec2ind(result);
    
    file_label = legenda(result);

end

