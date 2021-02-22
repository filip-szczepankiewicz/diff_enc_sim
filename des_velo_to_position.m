function r = des_velo_to_position(V, dt, nt, r0)
% function r = des_velo_to_position(V, dt, nt, r0)
% By Filip Szczepankiewicz
% Prepared for clinical MRI lecture

if nargin < 4
    r0 = 0;
end

r = r0 + V*dt * (1:nt);