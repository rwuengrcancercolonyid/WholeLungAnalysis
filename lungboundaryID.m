% Created by: Joshua Kruzan on 11/27/2019
%Given an RGB image, returns an RGB image with the lung outlined 
% and the %area of the lung with respect to the whole image

function [bwLung, lungArea] = lungboundaryID(RGB)
    % Convert Into Grayscale using hue
    HSV = rgb2hsv(RGB);
    hue = HSV(:,:,1);
    hue = imsharpen(hue);
    % Use hue to determine which pixels are part of the lung
    dims = size(hue);
    binarized = zeros(dims(1),dims(2));
    for i = 1: dims(1)
        for j = 1: dims(2)
            if hue(i,j) < 0.2
                binarized(i,j) = 1;
            end
        end 
    end
    bwLung = binarized;
    % get area of lung
    lungArea = bwarea(bwLung);
end