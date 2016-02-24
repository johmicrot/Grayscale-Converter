figure
clear all
clc
img = input('enter the image file name you wish to load\n including the .jpg extension \n','s');
I = double(imread(img))/100;

%just for informational purposes; it's not nessisary I seperate the r,g,and
%b into seperate channels
rChan = I(:,:,1);
gChan = I(:,:,2);
bChan = I(:,:,3);
[length,width,~] = size(I);
Ic = zeros(length,width);
sat = zeros(length,width);
hue = sat;
int =(rChan + gChan + bChan)/3;
choice = input('which conversion method do you want type \n"ntsc" "luminosity" "lightness" "averaging" or "all" \n','s');

if strcmp('ntsc',choice)
    Ic = rChan*0.299 + gChan*0.587 + bChan*0.114;
elseif strcmp('luminosity',choice)
    Ic = rChan*0.21 + gChan*0.72 + bChan*0.07 ;
elseif strcmp('lightness',choice)
    for x = 1:size(I,1)
        for y = 1:size(I,2)
            Ic(x,y) = (max([rChan(x,y),gChan(x,y),bChan(x,y)]) + min([rChan(x,y),gChan(x,y),bChan(x,y)]))/2;
        end
    end
elseif strcmp('averaging',choice)
    Ic = (rChan+ gChan+ bChan)/3;
elseif strcmp('all',choice)
    Intsc = rChan*0.299 + gChan*0.587 + bChan*0.114;
    Ilum = rChan*0.21 + gChan*0.72 + bChan*0.07 ;
        for x = 1:size(I,1)
         for y = 1:size(I,2)
            Ilight(x,y) = (max([rChan(x,y),gChan(x,y),bChan(x,y)]) + min([rChan(x,y),gChan(x,y),bChan(x,y)]))/2;
         end
        end
    Iavg = (rChan+ gChan+ bChan)/3;
    subplot(2,2,1)
    imshow(Intsc)
    xlabel('ntsc')
        subplot(2,2,2)
    imshow(Ilum)
    xlabel('luminosity')
        subplot(2,2,3)
    imshow(Ilight)
    xlabel('lightness')
    subplot(2,2,4)
    imshow(Iavg)
    xlabel('average')
else
    error ('incorrect input, start over');
end
if strcmp('all',choice)
else
imshow(Ic);
end   