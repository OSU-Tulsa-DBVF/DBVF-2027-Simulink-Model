function [F_tot__b, M_tot__b] = landing_gear(r_cg__AGL, V_cg__b, omega_cg__b, DCM_be, r_g_cg__b, k, C)
    r_cg_g__e = inv(DCM_be) * r_g_cg__b; 
    d_z__e = r_cg__AGL(3) + r_cg_g__e(3);
    V_g__e = inv(DCM_be) * (V_cg__b + cross(omega_cg__b, r_g_cg__b));
    dd_z__e = V_g__e(3);
    
    if (d_z__e < 0) % above ground, do nothing
        d_z__e = 0;
        dd_z__e = 0;
    end

    F_spring__e = [0;0;-k * d_z__e];
    F_damper__e = [0;0;-C * dd_z__e];

    F_tot__e = F_spring__e + F_damper__e;
    F_tot__e(3) = min(F_tot__e(3), 0); % never pull towards the earth
    
    F_tot__b = DCM_be * F_tot__e;
    M_tot__b = cross(r_g_cg__b, F_tot__b); 
end