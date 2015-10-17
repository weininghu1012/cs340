function [model] = knn(X,y,K)
% [model] = knn(X,y,k)
%
% Implementation of k-nearest neighbour classifer

model.X = X;
model.y = y;
model.K = K;
model.C = max(y);
model.predict = @predict;
end

function [yhat] = predict(model,Xtest)
%first create a matrix containing the squared Euclidean distances between
%all training and test points
X = model.X;
[N,D] = size(X);
[T,D] = size(Xtest);

% Dist will be the matrix (N*T)
Dist = X.^2*ones(D,T) + ones(N,D)*(Xtest').^2 - 2*X*Xtest';

%now iterate through the whole matrix to find the K smallest point with
%minimum distance, we just pick one column everytime and sort it

% create a matrix K_min(K*T) to store the index of traning data for k minimum
% distance
K = model.K;
K_min = zeros(K,T);
y = model.y;
C = model.C;
yhat = ones(T,1);
for t = 1:T
    test = Dist(:,t);
    [sortDist,sortIndex] = sort(test,'ascend');
    minIndex = sortIndex(1:K);
    % fill in the y values corrsponds to K smallest index a
    K_min(:,t) = y(minIndex);
    
    % Vote for different y values
    count = zeros(C,1);
    for c = 1:C
        count(c) = sum(y(minIndex)==c);
    end
    
    % The y with the maximum vote is our predicted value
    [M,I] = max(count);
    yhat(t) = I;
end


end