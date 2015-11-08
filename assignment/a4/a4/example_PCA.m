load animals.mat

% [n,d] = size(X);
% X = standardizeCols(X);
% 
% figure(1);
% imagesc(X);
% figure(2);
% plot(X(:,1),X(:,2),'.');
% gname(animals);

%applying PCA
%sigma = X'*X;
[U,S,V] = svd(X);
W = V(:,1:2)';
Z = X*W';
imagesc(Z*W);
figure;
    plot(Z(:,1),Z(:,2),'.');
    hold on;
    for i = 1:n
        text(Z(i,1),Z(i,2),names(i,:));
    end

