


function p1a3()
RGB=imread('A3.png');
B1 = RGB;
I1=(RGB(:,:,1)); % Red Channel
I2=(RGB(:,:,2)); % Green Channel
I3=(RGB(:,:,3)); % Blue Channel 

%Fourier Transform of The RGB channels
A1 = fft2(double(I1)); 
A2 = fft2(double(I2));
A3 = fft2(double(I3));

%Shifted FT to center
A1k=fftshift(A1); 
A2k=fftshift(A2); 
A3k=fftshift(A3);

[M ,N]=size(A1); % image size


Lo1=linearFilter(M,N); 

%Filtering every channel
J1  = A1k.*Lo1; 
J2  = A2k.*Lo1;
J3  = A3k.*Lo1;

%Inverse Shifted FT to uncenter
J1k=ifftshift(J1);
J2k=ifftshift(J2);
J3k=ifftshift(J3);

%Inverse Fourier Transform of t
B1(:,:,1)=real(ifft2(J1k));
B1(:,:,2)=real(ifft2(J2k));
B1(:,:,3)=real(ifft2(J3k));

imwrite(real(B1),'A3_denoised.png');


end