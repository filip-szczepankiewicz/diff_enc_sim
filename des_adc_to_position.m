function r = des_adc_to_position(D, dt, nt, r0)
% function r = des_adc_to_position(D, dt, nt, r0)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

if nargin < 4
    r0 = 0;
end

rmsd = sqrt( 2 * D * dt);

r = r0 + cumsum(randn(length(r0), nt)*rmsd, 2);