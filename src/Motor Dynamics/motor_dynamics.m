function [omega_dot, i_motor, i_batt] = motor_dynamics(mu, omega, V_batt, Q_prop, K_u, J, K_t, K_e, R_m, I_0, I_max)
   mu = min(max(mu, 0), 1);

   V_motor = mu .* V_batt .* K_u;

   I_motor = (V_motor - K_e * omega) / R_m;

   I_motor = min(max(I_motor), 0, 1);

   I_batt = sum(I_motor ./ mu);

   Q_drive = K_t * (I_motor - I_0);

   omega_dot = (Q_drive - Q_prop) ./ J;
end