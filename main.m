disp('Welcome to Beam Design');

%%cost of concrete
conc_cost = [4550 4750 4900];
%%cost of steel
steel_cost = [37 49] * 7850;

prompt = 'Grade of Concrete : [20/25/35]';
fck = input(prompt);
if fck == 25
    conc_rate = conc_cost(2);
    disp(['You have chosen M25 grade concrete at the rate of ', num2str(conc_cost(2)), 'Rs/m^3']);
elseif fck == 35
    conc_rate = conc_cost(3);
    disp(['You have chosen M35 grade concrete at the rate of ', num2str(conc_cost(3)), 'Rs/m^3']);
elseif fck == 20
    conc_rate = conc_cost(1);
    disp(['You have chosen M20 grade concrete at the rate of ', num2str(conc_cost(1)), 'Rs/m^3']);
else
    disp('Please choose from the given options!');
    return;
end

prompt = 'Grade of Steel [415/500] :';
fy = input(prompt);
if fy == 415
    steel_rate = steel_cost(1);
    disp(['You have chosen Fe415 grade Steel at the rate of ', num2str(steel_cost(1)), 'Rs/m^3']);
elseif fy == 500
    steel_rate = steel_cost(2);
    disp(['You have chosen Fe500 grade Steel at the rate of ', num2str(steel_cost(1)), 'Rs/m^3']);
else
    disp('Please chose from the given options!');
    return;
end
%{
prompt = 'Live Load: ';
LL = input(prompt);
disp(['Applied Live load of ', num2str(LL), 'kN/m']);
prompt = 'Span (m): ';
l = input(prompt);
disp(['You have chosen a span of ', num2str(l), 'm']);
prompt = 'Width of beam (mm): ';
b = input(prompt);
disp(['You have chosen a width of ', num2str(b), 'mm']);
prompt = 'Effective Cover (mm): ';
ec = input(prompt);
disp(['You have chosen an effective cover of ', num2str(ec), 'mm']);
%}

LL = 10;
l = 12;
b = 250;
ec = 50;

%initial guesses
x = [(2*b)-100 1000];

options = optimoptions(@fmincon,'Display','iter','Algorithm','interior-point');

xopt = fmincon(@(x)cost(x, b, l, conc_rate, steel_rate), x, [], [], [], [], [b 0], [], @(x)constraints(x,b,l,ec,fck,fy,LL), options)

cost_opt = cost(xopt, b, l, conc_rate, steel_rate)

disp(['Area of steel required(mm^2) : ', num2str(xopt(2)), 'mm^2']);
disp(['Depth of Rectangular Beam(mm) : ', num2str(xopt(1)), 'mm']);
disp(['Minimized cost : ', num2str(cost_opt*l)]);