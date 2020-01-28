clc;
clear;
x1 = 1.7*(2*float((rand(10,1)))-1);
x2 = 2.5*(2*float((rand(10,1)))-1);
x3 = 1.2*(2*float((rand(10,1)))-1);
x_new = [x1 x2 x3]';
%x = [1.7;2.5;1.2];
w = [0.5;0.5;0.3];

% dot product method summation Part 1
%h = w'*x
N = size(x_new);
for j=1:N(2);
% Summation method summation Part 1

  hsum = 0.0;
  for i=1:N(1)
    hsum = hsum + w(i)*x_new (i);
  end
  h = hsum;

% Part II, acticvation function
z(j) =1/(1+exp(-h));
end