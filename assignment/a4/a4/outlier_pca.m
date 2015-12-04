load cities.mat

[n,d] = size(ratings);
X=ratings;
X = standardizeCols(X);
[U,S,V]=svd(X);
W=V(:,1:2)';
Z=X*W';

plot(Z(:,1),Z(:,2),'.');
gname(names);


