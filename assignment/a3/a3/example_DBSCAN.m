%% Clustering
load clusterData.mat

%% Density-Based Clustering
eps = 15;
minPts = 3;
model = clusterDBcluster(X,eps,minPts);
title('Densty-Based clustering');