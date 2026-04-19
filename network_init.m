function nodes = network_init(numNodes,fieldSize,initialEnergy)

for i=1:numNodes

    nodes(i).id = i;

    nodes(i).pos = [rand*fieldSize rand*fieldSize];

    nodes(i).energy = initialEnergy;

    nodes(i).dataRate = randi([5 20]);

end

end