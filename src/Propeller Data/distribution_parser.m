function [radial_edges_in, chord_distribution_in, twist_distribution_deg] = distribution_parser(peo_path)
    lines = readlines(peo_path);
    
    start_idx = find(contains(lines, "STATION"), 1, 'first') + 3; % Jump straight to first data row
    end_idx   = find(contains(lines, "RADIUS:"), 1, 'first') - 1;  % Stop before bottom metadata
    
    data_lines = lines(start_idx:end_idx);
    data_lines = data_lines(strtrim(data_lines) ~= ""); % Remove any trailing blank lines
    
    % 1. Split into a 2D string array and convert to a numeric matrix
    data_matrix = str2double(split(strtrim(data_lines)));

    % 2. Convert the numeric matrix into a 13-column table
    col_names = ["STATION", "CHORD", "PITCH_QUOTED", "PITCH_LETE", "PITCH_PRATHER", ...
        "SWEEP", "THICKNESS_RATIO", "TWIST", "MAX_THICK", ...
        "CROSS_SECTION", "ZHIGH", "CGY", "CGZ"];

    dt = array2table(data_matrix, 'VariableNames', col_names);

    radial_edges_in = dt.STATION;
    chord_distribution_in = dt.CHORD;
    twist_distribution_deg = dt.TWIST;
end