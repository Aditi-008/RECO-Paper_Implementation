function [dataEnergy,controlEnergy] = routing_energy(packetSize,packets)

Eelec = 50e-9;

dataEnergy = packets * packetSize * Eelec;

controlPackets = 2;

controlEnergy = controlPackets * packetSize * Eelec;

end