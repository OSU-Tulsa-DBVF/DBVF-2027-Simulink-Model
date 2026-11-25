peo_path = fullfile('src/Propeller Data/19x10E-PERF.PE0');

[radial_edges_in, chord_distribution_in, twist_distribution_deg] = distribution_parser(peo_path);

[radius_in, n_blades, moi_kgm2] = propeller_parameter_parser(peo_path);