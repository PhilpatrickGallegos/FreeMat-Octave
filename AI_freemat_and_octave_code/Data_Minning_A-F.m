clc;
clear all;

%Data
data = csvread('iris.csv'); 

%size of data (minus labels)
sizeofData = size(data); 

%Mean for all 8 columns
for i=1:sizeofData(2)
  f_mean(i) = mean(data(:,i));
endfor
figure;
plot(f_mean(i));
%Standard Deviation for all 8 columns
for i=1:sizeofData(2)
  f_std(i) = std(data(:,i));
endfor

%Covariance
covMatrix = cov(data);
%cov is an automated function in Octave

%Heatmap of covMatrix
%colormap('hot')
imagesc(covMatrix)
colorbar

%Eigenvalues & Eigenvectors
[eigenValues eigenVector ] = eig(covMatrix);

%Singular Value Decomp
svd_F = svd(data);

%PCA
v = diag(eigenVector);
[junk rindices] = sort(-1-v);
PCA_eigenValues = eigenValues(:,rindices);


