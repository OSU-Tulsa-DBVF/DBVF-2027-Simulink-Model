function [alpha, Cl, Cd, Cm] = airfoil_parser(airfoil_path)
    % Read airfoil data and return alpha, lift, drag, and pitching moment

    arguments
        airfoil_path (1,1) string
    end

    airfoil_path = airfoil_path;

    dt = readtable(airfoil_path);

    alpha = dt.Alpha;
    Cl = dt.Cl;
    Cd = dt.Cd;
    Cm = dt.Cm;
end