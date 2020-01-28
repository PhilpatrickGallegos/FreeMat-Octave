function [count1 count2] = parent(index,data)
  count1 = 0;
  count2 = 0;
  
  for i=1:size(data)
  a = data(i,1);
  if data(i,9) == 1
    count1 = count1 + 1;
  elseif 
      count2 = count2 + 1;
  endif
endfor

endfunction
