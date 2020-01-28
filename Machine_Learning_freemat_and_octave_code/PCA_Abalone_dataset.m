clc;
clear all;

%Data
data = csvread('abaloneCorrected.csv'); 

%size of data (minus labels)
sizeofData = size(data); 

%Mean for all 8 columns
for i=1:sizeofData(2)
  f_mean(i) = mean(data(:,i));
endfor

%Standard Deviation for all 8 columns
for i=1:sizeofData(2)
  f_std(i) = std(data(:,i));
endfor

%PCA
C = cov(data);
[U, D, pc] = svd(C);
sv = diag(D);
n_sv = 100*sv/sum(sv);

