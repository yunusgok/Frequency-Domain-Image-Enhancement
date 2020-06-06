function Image= decompress(input,output,dict)

load(input,'dict','imcode','m','n');

 

imdeco = huffmandeco(imcode,dict); %Decoded Vector
matrix = reshape(imdeco, [m ,n]); %Decoded Matrix
padding = zeros(m,n); %padding for horizontal,vertical and diagonal matrix for haar inverse transformation

Image= idwt2(matrix,padding,padding,padding,'haar');  %haar inverse transformation




 Image=Image-min(Image(:)); % shift data such that the smallest element of A is 0
 Image=Image/max(Image(:));
 
imwrite(Image,output);

end