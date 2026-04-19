# RECO — On-Demand Recharging and Data Collection Protocol

> Implementation of the RECO protocol for Wireless Rechargeable Sensor Networks (WRSN)
> Based on research published in IEEE Transactions on Green Communications & Networking

---

## 📌 Overview

RECO (On-Demand Recharging and Data Collection) is a protocol designed for **Wireless Rechargeable Sensor Networks (WRSN)**. It uses a Mobile Charger (MC) that intelligently travels through the network to both recharge sensor nodes and collect sensed data in a single trip — eliminating the need for two separate robots.

This repository contains a Python-based implementation that simulates the RECO protocol including network clustering, recharge scheduling, charger path planning, and data collection.

---

## 🎯 Objectives

- Extend overall network lifetime by preventing node energy depletion
- Minimize travel distance of the Mobile Charger
- Improve energy efficiency across the sensor network
- Collect sensor data while recharging nodes (integrated operation)

---

## 🏗️ System Architecture

The network consists of three main components:

| Component | Role |
|---|---|
| **Sensor Nodes** | Distributed across the sensing field; collect data and send recharge requests when energy drops below threshold |
| **Base Station (BS)** | Controls the network; receives and schedules recharge requests |
| **Mobile Charger (MC)** | Travels across the network to recharge nodes and collect data |

---

## ⚙️ Key Features Implemented

### 1. Network Clustering
The network is divided into clusters to reduce scheduling complexity and charger travel distance. Each cluster contains:
- **T-Lane (Travel Lane):** Path taken by MC while charging nodes going in
- **R-Lane (Return Lane):** Path taken by MC on the return trip

### 2. Recharge Request Mechanism
When a sensor's energy drops below a defined threshold, it sends a recharge request to the Base Station. The BS schedules requests based on:
- Data flow rate of the node
- Distance from the charger
- Directional angle (to minimize zig-zag movement)

This ensures that the most critical nodes are always charged first.

### 3. Adapted Graham Scan Algorithm (Path Planning)
RECO uses an adapted version of the Graham Scan algorithm to plan the charger's route.

- Avoids zig-zag movement
- Creates a smooth, convex-hull-based charging route
- **Time Complexity: O(n²)**

### 4. Energy Consumption Model
This implementation uses the **First Order Radio Model**:

**Transmission Energy:**
```
E_tx = l * E_elec + l * ε_fs * d²    (short distance)
E_tx = l * E_elec + l * ε_mp * d⁴   (long distance)
```

**Reception Energy:**
```
E_rx = l * E_elec
```

Where `l` = packet length, `d` = distance between nodes.

### 5. Data Collection via Anchor Nodes
The MC acts as a data collector during its charging tour:
- The node currently being charged acts as an **Anchor Node**
- Nearby sensors route their data to the Anchor Node
- When the MC arrives, the data is transferred directly — no back-and-forth communication needed
- This significantly reduces routing energy and delay

---

## 📊 Performance Metrics

### Travel Distance
Measures total distance covered by the Mobile Charger per tour. RECO minimizes this compared to baseline methods like **K-Means** and **M2C**.

### Charging Efficiency
Measures total energy transferred to sensor nodes. RECO delivers more energy per trip due to optimized path planning and on-demand scheduling.

---

## 🆚 Comparison with Existing Methods

| Method | Travel Distance | Charging Efficiency | Data Collection |
|---|---|---|---|
| K-Means | High | Moderate | Separate trip |
| M2C | Moderate | Moderate | Separate trip |
| **RECO (Ours)** | **Low** | **High** | **Integrated** |

---

## 🚀 Getting Started

### Prerequisites
```bash
pip install numpy matplotlib scipy
```

### Run the Simulation
```bash
python main.py
```

### Configuration
You can modify simulation parameters in `config.py`:
```python
NUM_NODES = 100          # Number of sensor nodes
FIELD_SIZE = 100         # Sensing field size (m x m)
INITIAL_ENERGY = 0.5     # Initial node energy (J)
THRESHOLD_ENERGY = 0.1   # Recharge request threshold (J)
MC_SPEED = 5             # Mobile Charger speed (m/s)
```

---

## 📁 Project Structure

```
RECO/
├── main.py               # Entry point — runs the simulation
├── config.py             # Simulation parameters
├── network.py            # Network setup, node placement, clustering
├── scheduler.py          # Recharge request scheduling (A-GSA)
├── charger.py            # Mobile Charger movement and path planning
├── energy_model.py       # First Order Radio energy model
├── data_collection.py    # Anchor node and data routing logic
├── metrics.py            # Travel distance and charging efficiency
├── plots/                # Output graphs and visualizations
└── README.md
```

---

## 📈 Results

The simulation produces graphs comparing RECO against K-Means and M2C on:
- Charger travel distance vs. number of nodes
- Total energy transferred per charging tour
- Network lifetime across simulation rounds
- Data routing energy consumption

---

## 📚 Reference

> Fisseha Teju Wedaj, Ammar Hawbani, Xingfu Wang, Muhammad U. F. Qaisar et al.
> *"RECO: On-Demand Recharging and Data Collection for Wireless Rechargeable Sensor Networks"*
> IEEE Transactions on Green Communications & Networking, Vol. 7, No. 4, Dec 2023

---

## 👩‍💻 Author

>**Aditi Kashyap**
>Roll No: 2301EC03
>Subject: Wireless Communication
