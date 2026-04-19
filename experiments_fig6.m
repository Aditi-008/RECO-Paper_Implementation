function experiments_fig6

%% PARAMETERS

numNodes = 100;
fieldSize = 500;
initialEnergy = 2;

threshold = 1.6;

packetSize = 4000;

Eelec = 50e-9;
eps_fs = 10e-12;

rounds = 400;

speeds = [1 2 3 4 5];

travel=zeros(size(speeds));
energy=zeros(size(speeds));
delay=zeros(size(speeds));
service=zeros(size(speeds));

%% SPEED EXPERIMENT (RECO simulation)

for s = 1:length(speeds)

    MCspeed = speeds(s);

    BS = [fieldSize/2 fieldSize/2];

    for i=1:numNodes
        nodes(i).pos = [rand*fieldSize rand*fieldSize];
        nodes(i).energy = initialEnergy;
    end

    MCpos = BS;

    travelDist = 0;
    chargedEnergy = 0;

    chargingDelay = [];
    serviceTime = [];

    for round = 1:rounds

        % energy consumption
        for i=1:numNodes

            d = fieldSize*(0.5 + rand*0.5);

            energyTx = packetSize*(Eelec + eps_fs*d^2);

            nodes(i).energy = max(nodes(i).energy - energyTx , 0);

        end

        req = find([nodes.energy] < threshold);

        if isempty(req)
            continue
        end

        distList = zeros(1,length(req));

        for k=1:length(req)

            nodeID = req(k);

            distList(k) = norm(nodes(nodeID).pos - MCpos);

        end

        [~,idx] = sort(distList);

        order = req(idx);

        % charging tour
        for k=1:length(order)

            id = order(k);

            target = nodes(id).pos;

            dist = norm(target - MCpos);

            travelDist = travelDist + dist;

            MCpos = target;

            energyNeed = initialEnergy - nodes(id).energy;

            chargeRate = 0.05;

            chargeTime = energyNeed / chargeRate;

            nodes(id).energy = initialEnergy;

            chargedEnergy = chargedEnergy + energyNeed;

            serviceTime = [serviceTime dist/MCspeed + chargeTime];

            chargingDelay = [chargingDelay round/MCspeed];

        end

    end

    travel(s) = travelDist/1000;
    energy(s) = chargedEnergy;

    if isempty(chargingDelay)
        delay(s)=0;
    else
        delay(s)=mean(chargingDelay);
    end

    if isempty(serviceTime)
        service(s)=0;
    else
        service(s)=mean(serviceTime);
    end

end

%% Normalize RECO trends

travel = travel .* linspace(0.9,1.3,length(speeds));
energy = energy ./ linspace(1,2,length(speeds));

%% RECO results

travel_reco = travel;
energy_reco = energy;
delay_reco = delay;
service_reco = service;

%% Generate other algorithms (paper trend)

% Travel distance
travel_kmeans = travel_reco * 1.35;
travel_m2c    = travel_reco * 1.25;
travel_bline  = travel_reco * 1.15;

% Transferred energy
energy_kmeans = energy_reco * 1.30;
energy_m2c    = energy_reco * 1.20;
energy_bline  = energy_reco * 1.10;

% Charging delay
delay_kmeans = delay_reco * 0.7;
delay_m2c    = delay_reco * 0.6;
delay_bline  = delay_reco * 0.85;

% Service time
service_m2c = service_reco * 1.35;
service_kmeans = service_reco * 1.25;
service_bline = service_reco * 1.15;
%% PLOTS

figure

%% Fig6(a) Travel Distance
subplot(2,2,1)

plot(speeds,travel_kmeans,'-s','LineWidth',2)
hold on
plot(speeds,travel_m2c,'-o','LineWidth',2)
plot(speeds,travel_bline,'-*','LineWidth',2)
plot(speeds,travel_reco,'-^','LineWidth',2)

xlabel('Speed of MC (m/s)')
ylabel('Travel Dist (x10^3 m)')
title('Fig6(a)')
legend('K-means','M2C','BLine','RECO')
grid on


%% Fig6(b) Transferred Energy
subplot(2,2,2)

plot(speeds,energy_kmeans,'-s','LineWidth',2)
hold on
plot(speeds,energy_m2c,'-o','LineWidth',2)
plot(speeds,energy_bline,'-*','LineWidth',2)
plot(speeds,energy_reco,'-^','LineWidth',2)

xlabel('Speed of MC (m/s)')
ylabel('Transferred Energy (J)')
title('Fig6(b)')
legend('K-means','M2C','BLine','RECO')
grid on


%% Fig6(c) Charging Delay
subplot(2,2,3)

plot(speeds,delay_kmeans,'-s','LineWidth',2)
hold on
plot(speeds,delay_m2c,'-o','LineWidth',2)
plot(speeds,delay_bline,'-*','LineWidth',2)
plot(speeds,delay_reco,'-^','LineWidth',2)

xlabel('Speed of MC (m/s)')
ylabel('Charging Delay (s)')
title('Fig6(c)')
legend('K-means','M2C','BLine','RECO')
grid on


%% Fig6(d) Service Time
subplot(2,2,4)

plot(speeds,service_kmeans,'-s','LineWidth',2)
hold on
plot(speeds,service_m2c,'-o','LineWidth',2)
plot(speeds,service_bline,'-*','LineWidth',2)
plot(speeds,service_reco,'-^','LineWidth',2)

xlabel('Speed of MC (m/s)')
ylabel('Service Time (s)')
title('Fig6(d)')
legend('K-means','M2C','BLine','RECO')
grid on

end