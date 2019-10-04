function obj = cost(x, b, l, conc_rate, steel_rate)
    obj = (conc_rate * ((b * x(1)) - x(2)) * 10^-6) + (steel_rate * (x(2)) * 10^-6) + (1600 * (b + (2 * x(1))) * 10^-3);
end
