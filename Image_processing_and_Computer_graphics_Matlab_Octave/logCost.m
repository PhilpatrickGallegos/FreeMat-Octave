function [costfcn] = logCost(x,y,params)
    numSamples = size(1,x);
  
    temp = 0.0;
  
    for m = 1:numSamples
      h = sigmoid(x*params);
      if y(m)==1
        temp = temp + log(h);
      else
        temp = temp + log(1-h);
      end
    end
    costfcn = -temp;
