function bp = bandrejectFilter(row,col,r1,r2 )

bp = ones(row,col);
 for i=1:row
     for j = 1:col
            
            if(((i-row/2)^2 + (j-col/2)^2)>r1^2 &&((i-row/2)^2 + (j-col/2)^2)<r2^2)
                bp(i,j) = 0;
            end

         
     end
 end
 
   
       

end
