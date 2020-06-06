function part3(filename)

[original , dict] = compress(strcat(filename,'.png'),strcat(filename,'_coded.mat'));
decoded_image = decompress(strcat(filename,'_coded.mat'),strcat(filename,'_decoded.bmp'),dict);
imwrite(original,strcat(filename,'.jpeg'));
imgjpeg = imread(strcat(filename,'.jpeg'));

%fileID = fopen(strcat(filename,'.txt'),'w');



[m,n,~]= size(original);
decoded = uint8(255 * mat2gray(decoded_image));
mseValue1= immse(original , decoded(1:m,1:n));
mse1 = ['Mean Square Error between ', filename,' and decomppressed ',filename ,' is: '  ,num2str(mseValue1)];
disp(mse1);
%fprintf(fileID,mse1);
%fprintf(fileID,'\n');

mseValue2= immse(original , imgjpeg);
mse2 = ['Mean Square Error between ', filename,' and JPEG ',filename ,' is: '  ,num2str(mseValue2)];
disp(mse2);
%fprintf(fileID,mse2);
%fprintf(fileID,'\n');

codedfile=dir(strcat(filename,'_coded.mat')); 
coded_size=codedfile.bytes/8;

jpegfile=dir(strcat(filename,'.jpeg'));
jpeg_size=jpegfile.bytes;

bmpfile=dir(strcat(filename,'_decoded.bmp'));
bmp_size=bmpfile.bytes;

%bmpstr = ['Bitmap(.bmp) Format (No compression) Size:', num2str(bmp_size)];
%jpegstr = ['JPEG  Size:', num2str(jpeg_size)];
%codedstr = ['Coded Image Size: ', num2str(coded_size)];

%disp(bmpstr);
%disp(jpegstr);
%disp(codedstr);


ratio1 = ['Bitmap/Coded ', num2str(bmp_size/coded_size)];
ratio2 = ['Bitmap/Jpeg ', num2str(bmp_size/jpeg_size)];

disp(ratio1);
disp(ratio2);
%fprintf(fileID,ratio1);
%fprintf(fileID,'\n');
%fprintf(fileID,ratio2);
%fprintf(fileID,'\n');

%fclose(fileID);
end

