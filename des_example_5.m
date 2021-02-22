% By Filip Szczepankiewicz

clear

odir = 'C:\Users\filip\Desktop\anim\';

np = 20;  % number of particles
nt = 300;  % number of time points

do_clamp = 0 ; % Prevent walkers to go outside of r0 interval. Pretty, but not physical!

[gwf, rf, dt] = des_gwf_example_venc(nt);
dt = dt/3;
V             = 5*ones(np, 1) ; % Velocity [m/s]

r0 = linspace(0,1,np)' * 0.01;


% Calculate positions
gwf  = gwf .* rf; rf = 1; % switch to effective gradient and ignore spin direction

r    = des_velo_to_position	(V, dt, nt, r0);

if do_clamp
    r(r > max(r0)) = max(r0);
    r(r < min(r0)) = min(r0);
end

%% PLOT ANIMATION
clf
set(gcf, 'color', 'w')
des_anim_mk3(gwf, rf, dt, r, odir);


