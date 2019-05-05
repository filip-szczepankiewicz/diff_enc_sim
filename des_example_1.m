% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

clear

np = 50;  % number of particles
nt = 300;  % number of time points

do_clamp = 1 ; % Prevent walkers to go outside of r0 interval. Pretty, but not physical!

[gwf, rf, dt] = des_gwf_example_spfgse(nt);
D             = 1e-9; % Apparent diffusion coefficient [m2/s]

switch 2
    case 1 % Voxel scale (r is 0 to 1 mm)
        r0   = linspace(0, 1e-3, np)'; % initial positions [m]
        
    case 2 % Zoomed and informative (r is 0 to 0.06 mm)
        r0   = linspace(0, .06e-3, np)'; % initial positions [m]
        
end


% Calculate positions
gwf  = gwf .* rf; rf = 1; % switch to effective gradient and ignore spin direction

r    = des_adc_to_position(D, dt, nt, r0);

if do_clamp
    r(r > max(r0)) = max(r0);
    r(r < min(r0)) = min(r0);
end

%% PLOT ANIMATION
clf
set(gcf, 'color', 'w')
v = des_anim_mk2(gwf, rf, dt, r);



%% Estimated ADC
s = norm(mean(v));
b = des_gwf_to_bval(gwf, rf, dt);
d = -log(s)/b*1e9;
clc
disp(['The signal was attenuated from 1 to ' num2str(s, 3) '.'])
disp(['The b-value was ' num2str(b/1e9, 3) ' ms/um^2.'])
disp(['Estimated ADC was ' num2str(d, 3) ' um^2/ms.'])


