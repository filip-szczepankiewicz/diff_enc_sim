function [gwf, rf, dt] = des_gwf_example_narrowgp(n)
% function [gwf, rf, dt] = des_gwf_example_narrowgp(n)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

if nargin < 1
    n = 100;
end

gwf = [0; ones(2,1); zeros(200,1); ones(2,1); 0] * 1; % Defined in gradient amplifier system. Max gradient is 80 mT/m

rf  = ones(length(gwf), 1);
rf(round(length(rf)/2):end) = -1;

ttot = .048;

dt  = ttot/length(gwf);

[gwf, rf, dt] = des_gwf_interpolate(gwf, rf, dt, n);