function [radius_m, n_blades, moi_kgm2, radial_edges, chord_distribution, twist_distribution_deg, average_airfoil] = load_propeller_data(peo_path, airfoil1_path, airfoil2_path)
    %% blade
    [radial_edges_in, chord_distribution_in, twist_distribution_deg] = distribution_parser(peo_path);
    
    [radius_in, n_blades, moi_kgm2, airfoil_transition] = propeller_parameter_parser(peo_path);
    
    in_to_m = 0.0254;

    radius_m = in_to_m * radius_in;
    
    radial_edges = radial_edges_in' / radius_in;
    
    chord_distribution = chord_distribution_in' / radius_in;

    twist_distribution_deg = twist_distribution_deg';
    
    %% airfoil
    
    [alpha1, Cl1, Cd1, Cm1] = airfoil_parser(airfoil1_path);
    
    af1.alpha = alpha1;
    af1.Cl = Cl1;
    af1.Cd = Cd1;
    af1.Cm = Cm1;
    
    [alpha_e63, Cl_e63, Cd_e63, Cm_e63] = airfoil_parser(airfoil2_path);
    
    af2.alpha = alpha_e63;
    af2.Cl = Cl_e63;
    af2.Cd = Cd_e63;
    af2.Cm = Cm_e63;
    
    average_airfoil = airfoil_averager(af1, af2);
end