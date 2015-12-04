load animals.mat
[n,d] = size(X);

% Figure 1 shows raw data
figure(1);
imagesc(X);

% Figure 2 shows PCA visualization
figure(2);clf;
[U,S,V] = svd(X);
W = V(:,1:2)';
Z = X*W';
figure(2);
plot(Z(:,1),Z(:,2),'.');
hold on;
for i = 1:n
    text(Z(i,1),Z(i,2),animals(i,:));
end

% Figure 3 shows MDS visualization
%z = visualizeMDS(X,2,animals);
%z = visualizeSammon(X,2,animals);
figure(3);
z = visualizeISOMAP(X,3,animals);