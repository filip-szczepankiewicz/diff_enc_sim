function [gwf, rf, dt] = des_gwf_example_venc(n)
% function [gwf, rf, dt] = des_gwf_example_venc(n)
% By Filip Szczepankiewicz

if nargin < 1
    n = 100;
end

gwf = [0; ones(3,1); zeros(2,1); ones(3,1); 0] * 0.001; % Defined in gradient amplifier system. Max gradient is 80 mT/m

rf  = ones(length(gwf), 1);
rf(round(length(rf)/2+1):end) = -1;

ttot = .010;

dt  = ttot/length(gwf);

[gwf, rf, dt] = des_gwf_interpolate(gwf, rf, dt, n);