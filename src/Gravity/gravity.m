function [F_tot__b, M_tot__b] = gravity(m, DCM_be)
    F_grav_e = [0;0;1 * m * 9.81];
    F_grav_b = DCM_be * F_grav_e;
    F_tot__b = F_grav_b;
    M_tot__b = zeros(3,1);
end