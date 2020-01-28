function [count1 count2] = child1(index,data)
  count1 = 0;
  count2 = 0;
  
  for i=1:size(data)
  a = data(i,index);
  if a == 0 && data(i,9) == 0
    count1 = count1 + 1;
  elseif a == 0 && data(i,9) == 1
      count2 = count2 + 1;
  endif
endfor

endfunction
