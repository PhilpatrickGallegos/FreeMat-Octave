clc;
clear;

% Number of centroids
K = 3;

% Generate cluster data
Data = load('iris.dat');

X = Data(:,1:5); %all features from data
% generate some random cluster data

% normilize Data

X = Data;
max_x1 = max(X(:,1));
norm_x1 = X(:,1)/max_x1
max_x2 = max(X(:,2));
norm_x2 = X(:,2)/max_x2
max_x3 = max(X(:,3));
norm_x3 = X(:,3)/max_x3
max_x4 = max(X(:,4));
norm_x4 = X(:,4)/max_x4
max_x5 = max(X(:,5));
norm_x5 = X(:,5)/max_x5
norm_x = [norm_x1,norm_x2,norm_x3,norm_x4,norm_x5]
plot(norm_x(:,1),norm_x(:,2),'r*',norm_x(:,3),norm_x(:,4),'b*');

% Let m=rows n=cols
m = size(norm_x,1);
n = size(norm_x,2);

% Randomly init the centroids
randidx = randperm(m);
centroids = norm_x(randidx(1:K),:);



%%%%%%% START LOOP %%%%%%%

delta = 0.01;
break_err = 999;
while break_err > delta

  % Create the index map bin
  indices = zeros(m,1);

  for i=1:m
    
      % Initial min index guess
      k = 1;
    
      % Euclidean Distance for first K centroid
      min_dist = sqrt(sum((norm_x(i,:) - centroids(1,:)).^2));
    
      for j=2:K
        
          dist = sqrt(sum((norm_x(i,:) - centroids(j,:)).^2));
        
          if(dist < min_dist)
              min_dist = dist;
              k = j;
          end
          
      end 
      indices(i) = k;
  end

  % Storing the old centroids?
  old_centroids = centroids;

  % Updating the centroids?
  for i=1:K
  
      % Getting points closest to a centroid?
      temp_bin = norm_x(indices==i,:);
  
      % bin count
      count = size(temp_bin,1);
      
      % Updating centroids
       centroids(i,:) = sum(temp_bin) * 1/count;

  end    
      
  % Hn error to break at convergence?
  break_err = sum(sqrt(sum((old_centroids - centroids).^2))./K);
  break_err
  
%%%%%%% END LOOP %%%%%%%
end
plot(norm_x(:,1),norm_x(:,2),'r.',norm_x(:,3),norm_x(:,4),'b.',centroids(:,1),centroids(:,2),centroids(:,3),centroids(:,4),'k*');
