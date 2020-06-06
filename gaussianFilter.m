function lo = gaussianFilter(row,col,R )

lo = zeros(row,col);
 for i=1:row
     for j = 1:col

            lo(i,j)=exp(-((i-row/2)^2+(j-col/2)^2)./R^2);
            

         
     end
 end
 
   
       

end

