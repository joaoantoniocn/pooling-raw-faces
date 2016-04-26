function [ file_label ] = classificarNeural( file_name, legenda )
%CLASSIFICARNEURAL Summary of this function goes here
%   Detailed explanation goes here

    [ rfSize, eigvector, Pyramid ] = config();
            
    testImg = imread(file_name);
    testImg = double(testImg);
    testFeatures = fea_pooling(testImg, rfSize, eigvector, Pyramid);
    testFeatures = testFeatures';
    
    result = neural(testFeatures);
    result = vec2ind(result);
    
    file_label = legenda(result);

end

