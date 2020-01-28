clc;
clear all;

data = csvread('cleaned_CNT.csv'); 
training_data_x = data(1:9650,1:5);
training_data_y = data(1:9650,6);

sizeOf_Training_x = size(training_data_x);
sizeOf_Training_y = size(training_data_y);

X = training_data_x;
max_x1 = max(X(:,1));
norm_x1 = X(:,1)/max_x1;
max_x2 = max(X(:,2));
norm_x2 = X(:,2)/max_x2;
max_x3 = max(X(:,3));
norm_x3 = X(:,3)/max_x3;
max_x4 = max(X(:,4));
norm_x4 = X(:,4)/max_x4;
max_x5 = max(X(:,5));
norm_x5 = X(:,5)/max_x5;

normA = [norm_x1,norm_x2,norm_x3,norm_x4,norm_x5];


A = [ones(sizeOf_Training_x(1),1) normA];
A_Hat = (inv((A'*A))*A'*training_data_y); %Thetas

y_hat = A*A_Hat;


for i=1:size(training_data_y,1)
  ratio_y= training_data_y(i) - y_hat(i);
  if ratio_y <= 0.001
    correct_pred(i) = 1;
    end  
end

%Y Actual - Y Predicted
percen_of_correct_guess = (size(training_data_y,1)- sum(correct_pred == 1))/size(training_data_y,1);

 


