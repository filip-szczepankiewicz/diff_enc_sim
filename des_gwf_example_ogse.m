function [gwf, rf, dt] = des_gwf_example_ogse(n)
% function [gwf, rf, dt] = des_gwf_example_ogse(n)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

if nargin < 1
    n = 100;
end

gwf = sin(linspace(0, 8*pi, n))'*0.04;

rf  = ones(size(gwf));

dt  = .05/n;