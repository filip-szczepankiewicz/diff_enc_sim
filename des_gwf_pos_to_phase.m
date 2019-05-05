function p = des_gwf_pos_to_phase(gwf, rf, dt, r, gamma)
% function p = des_gwf_pos_to_phase(gwf, rf, dt, r, gamma)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

if nargin < 2 || isempty(rf)
    rf = 1;
end

if nargin < 5
    gamma = des_gamma('H');
end

p =  cumsum( gwf' .* rf' .* r , 2) * dt * gamma .* rf';