timestep = 0.01;

reference_location = [36.2071  -96.0102  221.3415];

test = 14;

rho_kgpm3 = 1.225;

N_to_mG = 101.97162129779284;

Pa_to_hPa = 0.01;

UINT16_MAX = 65535;

all_written = 8191;

degE7 = 1.0E+7;

deg_to_cdeg = 100;

m_to_cm = 100;

m_to_mm = 1000;

mps2_to_mG = 101.97;

s_to_us = 1.0E+6;

uT_to_gauss = 0.01;

%% Actuator

K_u = 1;
R_m = 0.17;
I_max = 22;
I_0 = 0.31;
K_v = 310;
K_t = pi / (30 * K_v);
K_e = K_t; 
J_m = 0.000862 * 1.5;

%% Propulsion