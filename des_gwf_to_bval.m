function b = des_gwf_to_bval(gwf, rf, dt, gamma)
% function b = des_gwf_to_bval(gwf, rf, dt, gamma)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

if nargin < 4
    gamma = des_gamma('H');
end

g_eff = gwf .* rf;

q = gamma * cumsum( g_eff ) * dt;

b = sum(q.^2) * dt;