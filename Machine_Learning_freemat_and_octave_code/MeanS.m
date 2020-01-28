function [count1 count2 Amatrix] = MeanS(index,data, mean_D)
  count1 = 0;
  count2 = 0;
  
  for i=1:size(data(:,index))
  a = data(i,index);
  if a >= mean_D 
    count1 = count1 + 1;
    Amatrix(i) = 1;
  else 
      count2 = count2 + 1;
      Amatrix(i) = 0;
  endif
endfor

endfunction
