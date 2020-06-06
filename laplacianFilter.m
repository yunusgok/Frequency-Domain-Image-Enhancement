function lo = laplacianFilter(row,col )

lo = zeros(row,col);
 for i=1:row
     for j = 1:col

            lo(i,j)=-4*(pi^2)*((i-row/2).^2+(j-col/2).^2);
            

         
     end
 end
 
   
       

end

