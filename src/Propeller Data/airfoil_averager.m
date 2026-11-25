function interpolated_airfoil = airfoil_averager(airfoil1, airfoil2)

    arguments
        airfoil1 (1,1) struct {must_be_airfoil}
        airfoil2 (1,1) struct {must_be_airfoil}
    end
    
    smaller_min = max(min(airfoil1.alpha), min(airfoil2.alpha));

    smaller_max = min(max(airfoil1.alpha), max(airfoil2.alpha));

    working_len = min(length(airfoil1.alpha), length(airfoil2.alpha));
   
    alpha_subset = linspace(smaller_min, smaller_max, working_len);

    Cl1_interpolated = interp1(airfoil1.alpha, airfoil1.Cl, alpha_subset);
    Cd1_interpolated = interp1(airfoil1.alpha, airfoil1.Cd, alpha_subset);
    Cm1_interpolated = interp1(airfoil1.alpha, airfoil1.Cm, alpha_subset);

    Cl2_interpolated = interp1(airfoil2.alpha, airfoil2.Cl, alpha_subset);
    Cd2_interpolated = interp1(airfoil2.alpha, airfoil2.Cd, alpha_subset);
    Cm2_interpolated = interp1(airfoil2.alpha, airfoil2.Cm, alpha_subset);

    interpolated_airfoil.alpha = alpha_subset;
    interpolated_airfoil.Cl = (Cl1_interpolated + Cl2_interpolated) ./ 2;
    interpolated_airfoil.Cd = (Cd1_interpolated + Cd2_interpolated) ./ 2;
    interpolated_airfoil.Cm = (Cm1_interpolated + Cm2_interpolated) ./ 2;
end

function must_be_airfoil(af)
    required = {'alpha', 'Cl', 'Cd', 'Cm'};
    
    if ~all(isfield(af, required))
        error('Airfoil:MissingFields', ...
            'Input must contain alpha, Cl, Cd, Cm.');
    end
    
    for k = 1:numel(required)
        name = required{k};
    
        validateattributes(af.(name), {'numeric'}, ...
            {'vector', 'nonempty', 'real', 'finite'}, ...
            mfilename, ['af.' name]);
    end
end