%% Animals with attributes data
load animals.mat

%% K-Means clustering
%K = 5;
%model = clusterKmeans(X,K);

%% DBScan
eps = 16;
minPts = 3;
model = clusterDBcluster(X,eps,minPts);
for k = 0:max(model.clusters)
    fprintf('Cluster %d: ',k);
    fprintf('%s ',animals{model.clusters==k});
    fprintf('\n');
end 