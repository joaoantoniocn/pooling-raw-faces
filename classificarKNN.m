function [ file_label ] = classificarKNN( file_name, lfwInputs, legenda2 )
%CLASSIFICARKNN Summary of this function goes here
%   Detailed explanation goes here

    rfSize = 4;
    eigvector = eye(rfSize^2);
    Pyramid = [ 1 1; 2 2; 4 4; 6 6; 8 8; 10 10];
    
        
    testImg = imread(file_name);
    testImg = double(testImg);
    testFeatures = fea_pooling(testImg, rfSize, eigvector, Pyramid);


    result = knnclassify(testFeatures, lfwInputs, legenda2);
    file_label = result(1, 1);
    %display(file_label);
end

