function p1a2()
I=imread('A2.png');
A = fft2(double(I)); %Fourier Transform of The Image
A1=fftshift(A); % Shifted FT to center

[M ,N]=size(A); % image size
R1=67; %Lower Radius of inner circle 
R2 = 90; %Higher Radius of inner circle 
R3 = 280; %Lower Radius of outer circle 
R4 = 320; %Lower Radius of outer circle 

Lo1=bandrejectFilter(M,N,R1,R2); % Inner Circle Band Reject Filter

J  = A1.*Lo1; % F(u,v)*H_0(u,v)
%imshow(log(1+A1),[]);
Lo2=bandrejectFilter(M,N,R3,R4);  % Outer Circle Band Reject Filter
J  = J.*Lo2;  % F(u,v)*H_0(u,v)*H_1()
imshow(log(1+J),[]);
J1=ifftshift(J);  % Inverse shift of  FT to uncenter 
Image=ifft2(J1);  %Inverse Fourier Transform of The Image
Image=Image-min(Image(:)); %Scaling intensity from 0 to 255
Image=Image/max(Image(:)); 
imwrite(Image,'A2_denoised.png');

end
