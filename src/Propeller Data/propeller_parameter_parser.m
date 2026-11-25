function [radius_in, n_blades, moi_kgm2] = propeller_parameter_parser(peo_path)
    lines = readlines(peo_path);

    radius_idx = find(contains(lines, 'RADIUS'), 1, 'last');
    n_blades_idx = find(contains(lines, 'NUMBER OF BLADES'), 1, 'last');
    moi_idx = find(contains(lines, 'MOMENT OF INERTIA'), 1, 'last');

    vals = str2double(split(lines(radius_idx)));
    radius_in = vals(~isnan(vals));

    vals = str2double(split(lines(n_blades_idx)));
    n_blades = vals(~isnan(vals));

    vals = str2double(split(lines(moi_idx)));
    moi_kgm2 = vals(~isnan(vals));
end
