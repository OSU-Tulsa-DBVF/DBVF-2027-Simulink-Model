clear;clc;

peo_path = fullfile('src/Propeller Data/19x10E-PERF.PE0');

n4412_path = fullfile('src/Propeller Data/xf-naca4412-il-50000.csv');
e63_path = fullfile('src/Propeller Data/xf-e63-il-50000.csv');

[radius_m, n_blades, prop_moi_kgm2, radial_edges, chord_distribution, twist_distribution_deg, APC_19x10E_airfoil] = load_propeller_data(peo_path, n4412_path, e63_path);
APC_alpha_deg = APC_19x10E_airfoil.alpha;
APC_Cl = APC_19x10E_airfoil.Cl;
APC_Cd = APC_19x10E_airfoil.Cd;
APC_Cm = APC_19x10E_airfoil.Cm;