function [original,dict] = compress(input,output)
I = imread(input); %original image
[~,~,map ]= size(I); %original size


if map==3 %C4 is rgb image- translated it to gray level
    I=rgb2gray(I);
end
original = I; 

[C,~,~,~] = dwt2(I,'haar'); %haar wavelet function
%Upper left corner of the haar transform that reduced from its details
%horizantally vertically and diagonally

[m,n] =size(C);  
im=C/255; 
q= uint8(round(im*31)); 

prob = imhist(q)/(m*n); %probability density function
colors= ( 0:255); %Gray level Values
qvec= q(:); %Vector of image


dict = huffmandict(colors,prob);  %huffman dictinoary for coding and decoding
imcode = huffmanenco(qvec,dict); %huffman coded vector 

save(output,'dict','imcode','m','n');

end


