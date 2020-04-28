% Created By Josh Kruzan, 3/30/2020
% Purpose: Given an RGB image and a same sized binary image, will return
% the same RGB image with white objects in the binary image filled in
% yellow onto it.
function I = lungtumorfill(RGB, binarized)
    I = RGB;
    dims = size(binarized);
    for i = 1:dims(1)
        for j = 1:dims(2)
            if binarized(i,j) == 1
               I(i,j,1)=255;
               I(i,j,2)=255;
               I(i,j,3)=0;
            end
        end
    end
end