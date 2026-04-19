function energyTx = energy_radio_model(packetSize,d)

Eelec = 50e-9;
eps_fs = 10e-12;

energyTx = packetSize*(Eelec + eps_fs*d^2);

end