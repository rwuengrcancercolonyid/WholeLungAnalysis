% Created by Josh Kruzan 11/27/2019
% Given an RGB image, an array where:
%   index 1 is black-white image with identified tumors in white
%   index 2 is the area of the identified tumors in pixels
%   index 3 is a count of the individual tumors
function [bwTumors,tumorArea,tumorCount] = lungtumorID(RGB)
    %Convert to grayscale
    gray = rgb2gray(RGB);
    %Adjust contrast
    edgethresh = 0.2;
    amount = 0.15;
    contrasted = localcontrast(gray, edgethresh,amount);
    %Convert to binary image, invert
    bw = imbinarize(contrasted,'adaptive', 'ForegroundPolarity', 'dark', 'Sensitivity', 0.41);
    complement = imcomplement(bw);
    bwTumors = complement;
    %Get area of tumors
    tumorArea = bwarea(bwTumors);
    %Get count of tumors
    cc = bwconncomp(bwTumors,4);
    tumorCount  = cc.NumObjects;
end