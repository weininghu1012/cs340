
% W=V(:,1:2)';
% Z=X*W';
% plot(Z(:,1),Z(:,2),'.');
% gname(animals);


% X = standardizeCols(X);
% 
% figure(1);
% imagesc(X);
% figure(2);
% plot(X(:,1),X(:,2),'.');
% gname(animals);

%applying PCA
%sigma = X'*X;
% [n,d] = size(X);
% X = standardizeCols(X);
% [U,S,V] = svd(X);
% W = V(:,1:2)';
% Z = X*W';
% imagesc(Z*W);
% figure;
%     plot(Z(:,1),Z(:,2),'.');
%     hold on;
%     for i = 1:n
%         text(Z(i,1),Z(i,2),names(i,:));
%     end
% compare the ratio from k = 1 to 3
load animals.mat
[n,d] = size(X);
X = standardizeCols(X);
[U,S,V]=svd(X);
for k = [1,2,3]
    W = V(:,1:k)';
    Z = X*W';
    ratio = norm((X-Z*W),'fro')^2/norm(X,'fro')^2
end


for k = [1:d]
    [U,S,V] = svd(X);
    W = V(:,1:k)';
    Z = X*W';
    ratio = norm((X-Z*W),'fro')^2/norm(X,'fro')^2
    if (ratio <=0.2)
        k
        ratio
        break
    end    
end     
    
