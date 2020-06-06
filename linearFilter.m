function lo = linearFilter(row,col)

lo = ones(row,col);
 for i=1:row
     for j = 1:col
            if(i<row/2-30 && i>row/2-40) %horizontal line
                lo(i,j)=0;
            end
            if(i>row/2+30 && i<row/2+40) %horizontal line
                lo(i,j)=0;
            end
            if(j<col/2-35 && j>col/2-50)  %vertical line
                lo(i,j)=0;
            end
            if(j>col/2+35 && j<col/2+50) %vertical line
                lo(i,j)=0;
            end
            if(i>row/2-5 && i<row/2+5 )  %horizontal line
                lo(i,j)=0;
            end
            if(j>col/2-5 && j<col/2+5 )  %vertical line
                lo(i,j)=0;
            end
            if(j < col*i/row+10 && j > col*i/row-10) %diagonal line 
                lo(i,j)=0;
            end
            if(j < -col*i/row+10+col && j> -col*i/row-10+col) %vertical line
                lo(i,j)=0;
            end
            if(i> row/2-30 && i< row/2 +40 && j<col/2+45 && j> col/2-35) %center of the shifted FT
                lo(i,j)=1;
            end
         
     end
 end
 
   
       

end