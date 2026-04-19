function clusterID = cluster_RECO(nodePos,fieldSize)

mid = fieldSize/2;

x = nodePos(1);
y = nodePos(2);

if x < mid && y >= mid
    clusterID = 1;
elseif x >= mid && y >= mid
    clusterID = 2;
elseif x < mid && y < mid
    clusterID = 3;
else
    clusterID = 4;
end

end