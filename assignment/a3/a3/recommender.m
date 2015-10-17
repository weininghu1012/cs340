function [model] = recommender(X,K)
X = double(X);
[N,D] = size(X);
% create a matrix cos to store all cosine similarity between i and j
cos = zeros(D,D);
for i = 1:D
    for j = 1:D
        n = (X(:,i))'*X(:,j);
        d = (norm(X(:,i))*norm(X(:,j)));
        cos(i,j) = n/d;
    end
end    
        
model.predict = @predict;
model.K = K;
model.cos = cos;

end


function [wordNumbers] = predict(model,j)
cos = model.cos;
K = model.K;
all = cos(j,:);
[sortedValues,sortIndex] = sort(all,'descend');  
wordNumbers = sortIndex(1:(K+1));

end