function [k, C] = gear_parameterization(m, n_gear, omega_n, zeta)
    k = m/n_gear * omega_n^2;
    C = m/n_gear * 2 * zeta * omega_n;
end