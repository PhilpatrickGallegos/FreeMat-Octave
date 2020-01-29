clc,
clear;

pima = load('pima.dat');

x1 = pima(:,1);
x2 = pima(:,2);
x3 = pima(:,3);
x4 = pima(:,4);
x5 = pima(:,5);
x6 = pima(:,6);
x7 = pima(:,7);
x8 = pima(:,8);

x = [ones(size(x1,1),1) x2 x6];

m = size(x1,1);
n = size(x,2);
mean_x = mean(x);
stds_x = std(x);

for i = 1:m
  for j = 1:n
    if x(i,j)==0
        x(i,j) = mean_x(j);
    end
  end
  x(i,2:end) = (x(i,2:end) - mean_x(2:end))/stds_x(2:end);
end

x_train = x(1:650,:);
y_train = pima(1:650,9);

x_test = x(650:end,:);
y_test = pima(650:end,9);

parameters = [0; 0; 0];
learningRate = 1e-3;
reduce = 500;
epochs = 2000;
costHistory = zeros(epochs,1);
m = size(x_train,1);

for i=1:epochs
  
  h = (sigmoid(x_train*parameters) - y_train)';
  
  for k = 1:size(parameters,1)
    parameters(k) = parameters(k) - learningRate*h*x_train(:,k);
  end
  
  if (i~=0 && mod(i,reduce)==0)
    learningRate = learningRate/2;
  end  

  costHistory(i) = logCost(x_train,y_train,parameters);
  costHistory(i)
end  

parameters

figure;
plot(1:epochs,costHistory,'b');

printf('TEST CLASSIFICATIONS:');

testPredictions = sigmoid(x_test*parameters);
for i =- 1:size(test,1)
  
  if testPredictions(i) >= 0.5
    testPredictions(i) = 1;
  else
    testPredictions(i) = 0;
  end
end  

[y_test real(testPredictions)]

count = 0

for i = 1:size(x_test,1)
    if y_test(i)==testPredictions(i)
        count = count + 1;
    end
end
count/size(x_test,1)























