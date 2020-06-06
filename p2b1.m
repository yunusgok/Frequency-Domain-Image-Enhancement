function p2b1()
RGB=imread('B1.jpg');
I=rgb2gray(RGB); % RGB image to Gray
A = fft2(double(I));%Fourier Transform of The Image
A1=fftshift(A); % Shifted FT to center


[M ,N]=size(A); % image size

Lo1=laplacianFilter(M,N); %Gradient 


%imshow(log(1+Lo2),[]);

J  = A1.*Lo1;
%imshow(log(1+J),[]);
r =100;
Lo1 = gaussianFilter(M,N,r); %Making edges blur reduce noise like sudden changes 
J  = J.*Lo1;

%imshow(log(1+J),[]);


%imshow(log(1+J),[]);
J1=ifftshift(J);
Image=ifft2(J1);
Image=Image-min(Image(:)); % scaling intensity values from 0 to 255
Image=Image/max(Image(:));
%imshow(imbinarize(real(Image),0.15));

imwrite(imbinarize(real(Image),0.15),'B1_output.jpg');

end

