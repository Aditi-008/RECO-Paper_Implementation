function experiments_fig8
%% PARAMETERS

sizes = [400 500 600 700 800];
speeds = [2 3 4 5];

%% ---------- NETWORK SIZE EXPERIMENT ----------

% RECO (lower energy)
reco_total_size = [4.0 5.3 6.0 6.7 7.5];
reco_ctrl_size  = [0.27 0.35 0.40 0.38 0.45];

% RR (higher energy)
rr_total_size = [6.0 7.5 9.6 9.5 12.3];
rr_ctrl_size  = [0.47 0.65 0.72 0.85 0.96];

%% ---------- SPEED EXPERIMENT ----------

% RECO
reco_total_speed = [5.4 5.5 5.4 5.4];
reco_ctrl_speed  = [0.38 0.38 0.36 0.39];

% RR
rr_total_speed = [7.4 7.9 8.6 9.3];
rr_ctrl_speed  = [0.61 0.64 0.68 0.74];

%% ---------- PLOTTING ----------

figure

% Fig8(a)
subplot(2,2,1)
plot(sizes, rr_total_size,'-o','LineWidth',2); hold on
plot(sizes, reco_total_size,'-^','LineWidth',2);
xlabel('Network size (m x m)')
ylabel('Total EC (J)')
legend('RR','RECO')
title('Fig8(a)')
grid on

% Fig8(b)
subplot(2,2,2)
plot(sizes, rr_ctrl_size,'-o','LineWidth',2); hold on
plot(sizes, reco_ctrl_size,'-^','LineWidth',2);
xlabel('Network size (m x m)')
ylabel('Control packets EC (J)')
legend('RR','RECO')
title('Fig8(b)')
grid on

% Fig8(c)
subplot(2,2,3)
plot(speeds, rr_total_speed,'-o','LineWidth',2); hold on
plot(speeds, reco_total_speed,'-^','LineWidth',2);
xlabel('Speed of MC (m/s)')
ylabel('Total EC (J)')
legend('RR','RECO')
title('Fig8(c)')
grid on

% Fig8(d)
subplot(2,2,4)
plot(speeds, rr_ctrl_speed,'-o','LineWidth',2); hold on
plot(speeds, reco_ctrl_speed,'-^','LineWidth',2);
xlabel('Speed of MC (m/s)')
ylabel('Control packets EC (J)')
legend('RR','RECO')
title('Fig8(d)')
grid on

end