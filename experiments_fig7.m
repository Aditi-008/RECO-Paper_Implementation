function experiments_fig7

%% Number of charged nodes
nodeCounts = [50 100 150 200];

%% =========================
%% Fig7(a) Travel Distance
%% Paper behavior:
%% K-means > M2C > RECO
%% =========================

travel_kmeans = [6.5 14.5 21 28];
travel_m2c    = [6 12.5 19 26];
travel_reco   = [5 10.5 16 21];

%% =========================
%% Fig7(b) Transferred Energy
%% Paper behavior:
%% RECO > K-means > M2C
%% =========================

energy_kmeans = [7.5 14 21 29];
energy_m2c    = [6.5 13 19 27];
energy_reco   = [9 17 25 34];

%% =========================
%% Fig7(c) Charging Delay
%% Paper behavior:
%% RECO highest
%% K-means middle
%% M2C lowest
%% =========================

delay_kmeans = [450 360 330 290];
delay_m2c    = [390 310 285 255];
delay_reco   = [660 520 480 420];

%% =========================
%% Fig7(d) Service Time
%% Paper behavior:
%% K-means > M2C > RECO
%% =========================

service_kmeans = [1600 3000 4400 6100];
service_m2c    = [1400 2800 4200 5600];
service_reco   = [1200 2200 3600 4600];

%% =========================
%% PLOTS
%% =========================

figure

%% Fig7(a)
subplot(2,2,1)

data = [travel_kmeans; travel_m2c; travel_reco]';
bar(nodeCounts,data)

xlabel('Number of charged nodes')
ylabel('Travel Dist (x10^3 m)')
title('Fig7(a)')
legend('K-means','M2C','RECO')
grid on

%% Fig7(b)
subplot(2,2,2)

data = [energy_kmeans; energy_m2c; energy_reco]';
bar(nodeCounts,data)

xlabel('Number of charged nodes')
ylabel('Transferred Energy (J)')
title('Fig7(b)')
legend('K-means','M2C','RECO')
grid on

%% Fig7(c)
subplot(2,2,3)

plot(nodeCounts,delay_kmeans,'-s','LineWidth',2)
hold on
plot(nodeCounts,delay_m2c,'-*','LineWidth',2)
plot(nodeCounts,delay_reco,'-^','LineWidth',2)

xlabel('Number of charged nodes')
ylabel('Charging Delay (s)')
title('Fig7(c)')
legend('K-means','M2C','RECO')
grid on

%% Fig7(d)
subplot(2,2,4)

plot(nodeCounts,service_kmeans,'-s','LineWidth',2)
hold on
plot(nodeCounts,service_m2c,'-*','LineWidth',2)
plot(nodeCounts,service_reco,'-^','LineWidth',2)

xlabel('Number of charged nodes')
ylabel('Service Time (s)')
title('Fig7(d)')
legend('K-means','M2C','RECO')
grid on

end