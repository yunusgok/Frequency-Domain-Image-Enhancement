function filter = butterworth(row,col,R )

filter = zeros(row,col); %filter matrix 
 for i=1:row
     for j = 1:col
            
            filter(i,j)= 1/(1+(((i-row/2)^2+(j-col/2)^2)*(1/R^2))); %Butterworth equation
     end
 end
 
       

end
