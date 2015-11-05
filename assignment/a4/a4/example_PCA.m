load animals.mat

[n,d] = size(X);
X = standardizeCols(X);

figure(1);
imagesc(X);
figure(2);
plot(X(:,1),X(:,2),'.');
gname(animals);

%applying PCA
% sigma = X'*X;
% [U,S,V] = svd(sigma);
% W = V(:,1:2)';
% Z = X*W';
% imagesc(Z);
% gname(animals);

