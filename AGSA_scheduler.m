function order = AGSA_scheduler(nodes,req,MCpos)

alpha = 0.5;

N = length(req);

priority = zeros(1,N);

for i=1:N

    nodeID = req(i);

    pos = nodes(nodeID).pos;

    d = norm(pos - MCpos);

    angle = atan2(pos(2)-MCpos(2),pos(1)-MCpos(1));

    priority(i) = alpha*abs(angle) + (1-alpha)*(1/(d+0.001));

end

[~,idx] = sort(priority,'descend');

order = req(idx);

end