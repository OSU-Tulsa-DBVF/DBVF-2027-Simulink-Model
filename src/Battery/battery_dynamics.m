function [V_batt,I_batt_out,P_batt,SOC_dot] = battery_dynamics(I_batt_in, eta_ESC, V_OC, R_batt, Ah)
    I_batt_out = I_batt_in ./ eta_ESC;
    V_batt = max(V_OC - I_batt_out .* R_batt, 0);
    P_batt = I_batt_out .* V_batt;
    SOC_dot = -I_batt_out ./ (3600 * Ah);
    SOC_dot = 0;
end