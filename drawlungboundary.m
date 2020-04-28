% Created By Josh Kruzan, 3/30/2020
% Purpose: Given an RGB image and a same sized binary image, will return
% the RGB image with white objects in the binary image outlined in cyan onto it

function I = drawlungboundary(RGB, binarized)
    I = RGB;
    dims = size(binarized);
    for i = 1:dims(1)
        for j = 1:dims(2)
            if binarized(i,j) == 1 
                if( i == 1 || j ==1 || i == dims(1) ||j == dims(2) )
                    I(i,j,1)=0;
                    I(i,j,2)=255;
                    I(i,j,3)=255;
                else
                    if binarized(i+1,j) ~= 1 
                        I(i,j,1)=0;
                        I(i,j,2)=255;
                        I(i,j,3)=255;
                        I(i+1,j,1)=0;
                        I(i+1,j,2)=255;
                        I(i+1,j,3)=255;
                    end
                    if binarized(i+1,j+1) ~= 1 
                        I(i,j,1)=0;
                        I(i,j,2)=255;
                        I(i,j,3)=255;
                        I(i+1,j+1,1)=0;
                        I(i+1,j+1,2)=255;
                        I(i+1,j+1,3)=255;                    
                    end
                    if binarized(i,j+1) ~= 1 
                        I(i,j,1)=0;
                        I(i,j,2)=255;
                        I(i,j,3)=255;
                        I(i,j+1,1)=0;
                        I(i,j+1,2)=255;
                        I(i,j+1,3)=255;
                    end
                    if binarized(i-1,j+1) ~= 1 
                        I(i,j,1)=0;
                        I(i,j,2)=255;
                        I(i,j,3)=255;
                        I(i-1,j+1,1)=0;
                        I(i-1,j+1,2)=255;
                        I(i-1,j+1,3)=255;
                    end
                    if binarized(i-1,j) ~= 1 
                        I(i,j,1)=0;
                        I(i,j,2)=255;
                        I(i,j,3)=255;
                        I(i-1,j,1)=0;
                        I(i-1,j,2)=255;
                        I(i-1,j,3)=255;
                    end
                    if binarized(i-1,j-1) ~= 1 
                        I(i,j,1)=0;
                        I(i,j,2)=255;
                        I(i,j,3)=255;
                        I(i-1,j-1,1)=0;
                        I(i-1,j-1,2)=255;
                        I(i-1,j-1,3)=255;
                    end
                    if binarized(i,j-1) ~= 1
                        I(i,j,1)=0;
                        I(i,j,2)=255;
                        I(i,j,3)=255;
                        I(i,j-1,1)=0;
                        I(i,j-1,2)=255;
                        I(i,j-1,3)=255;  
                    end
                    if binarized(i+1,j-1) ~= 1
                        I(i,j,1)=0;
                        I(i,j,2)=255;
                        I(i,j,3)=255;
                        I(i+1,j-1,1)=0;
                        I(i+1,j-1,2)=255;
                        I(i+1,j-1,3)=255;
                    end
                end
            end
        end
    end
end