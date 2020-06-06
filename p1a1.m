function p1a1()

I=imread('A1.png');
A = fft2(double(I)); %Fourier Transform of The Image
A1=fftshift(A); % Shifted FT to center

[M,N]=size(A); % image size
R=25; % filter size parameter 

Lo= butterworth(M,N,R); %Butterworth Low Pass Filter with Radius R
%imshow(log(1+A1),[]);
J=A1.*Lo; % F(u,v)*H(u,v)
imshow(log(1+J),[]);
J1=ifftshift(J); % Inverse shift of  FT to uncenter 
B1=ifft2(J1);  %Inverse Fourier Transform of The Image
imwrite(uint8(real(B1)),'A1_denoised.png');


end

