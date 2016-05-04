function [ file_label ] = classificarKNN( file_name, lfwInputs, legenda2 )
%CLASSIFICARKNN Summary of this function goes here
%   Detailed explanation goes here

    [ rfSize, eigvector, Pyramid ] = config();
    
        
    testImg = imread(file_name);
    testImg = double(testImg);
    %testImg = rgb2gray(testImg);
    testFeatures = fea_pooling(testImg, rfSize, eigvector, Pyramid);


    result = knnclassify(testFeatures, lfwInputs, legenda2);
    file_label = result(1, 1);
    %display(file_label);
end

