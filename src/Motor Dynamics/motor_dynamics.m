function [omega_dot, i_motor, i_batt] = motor_dynamics(mu, omega, V_batt, Q_prop, K_u, J, K_t, K_e, R_m, I_0, I_max)
   mu = min(max(mu, 0), 1);

   off = (mu==0);

   if all(off(:))
       omega_dot = zeros(size(omega));
       i_motor = zeros(size(omega));
       i_batt = 0;
       return
   end

   V_motor = mu .* V_batt .* K_u;

   i_motor = (V_motor - K_e .* omega) ./ R_m;

   i_motor = min(max(i_motor, 0), I_max);

   Q_drive = K_t .* (i_motor - I_0);

   omega_dot = (Q_drive - Q_prop) ./ J;

   reverse = (omega <= 0) & (omega_dot <= 0);
   omega_dot(reverse) = 0;
   i_motor(reverse) = 0;

   mu_safe = mu;
   mu_safe(off) = 1;

   i_batt = sum(i_motor ./ mu_safe);

end