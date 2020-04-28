%Created by: Josh Kruzan
%Created on: 4/1/2020
%Purpose: Run analysis on whole image given provided file location and
% image name

function result = wholelunganalysis(dir, filename)
    file = strcat(dir, filename);
    RGB = imread(file);
    %Get information on lung boundary
    [bwlung, lungarea] = lungboundaryID(RGB);
    %Get information on tumors
    [bwtumors, tumorarea,tumorcount] = lungtumorID(RGB);
    lungoutlined =drawlungboundary(RGB, bwlung);
    result = lungtumorfill(lungoutlined, bwtumors);
    disp(strcat('Percentage of lung covered in tumors: ', num2str(tumorarea*100/lungarea)));
    disp(strcat('Count of Tumors: ', num2str(tumorcount)));
    figure, imshow([RGB,result]);
    txt = ['Percent Tumourous Area: ', num2str(tumorarea*100/lungarea), ' Tumor Count: ', num2str(tumorcount)];
    title(txt);
end