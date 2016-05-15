function [ rfSize, Pyramid ] = config()
%CONFIG Summary of this function goes here
%   Detailed explanation goes here

    % ---------------------
    rfSize = 4;
    %eigvector = eye(rfSize^2);
    %eigvector = evectors;
    Pyramid = [ 1 1; 2 2; 4 4; 6 6; 8 8; 10 10];
end

