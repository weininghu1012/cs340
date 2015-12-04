load cities.mat
X = ratings;
[N,D] = size(X);

Dist = sqrt(X.^2*ones(D,N) + ones(N,D)*(X').^2 - 2*X*X');

K = 3;
avg = zeros(N,1);
for t = 1:N
    test = Dist(:,t);
    [sortDist,sortIndex] = sort(test,'ascend');
    % because the minimum would be the point itself, we start from 2
    minIndex = sortIndex(2:K+1);
    avg(t) = sum(Dist(minIndex,t))/K;
end    

% Then calculate the outlierness
outlierness = zeros(N,1);
for t = 1:N
    test = Dist(:,t);
    [sortDist,sortIndex] = sort(test,'ascend');
    minIndex = sortIndex(2:K+1);
    outlierness(t) = avg(t)/(sum(avg(minIndex))/3);
end

[sortOutlierness,sortOutindex] = sort(outlierness,'descend');
    maxoutindex = sortOutindex(1:10);
    names(maxoutindex,:)
    sortOutlierness(1:10)
    

