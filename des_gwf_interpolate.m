function [gwf_out, rf_out, dt_out] = des_gwf_interpolate(gwf, rf, dt, n)
% function [gwf_out, rf_out, dt_out] = des_gwf_interpolate(gwf, rf, dt, n)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

x = 1:size(gwf,1);
q = linspace(min(x), max(x), n);

% Resample gwf
gwf_out = interp1(x, gwf, q)';

if ~isempty(rf)
    % Resampe rf and set proper sign values
    rf_out  = interp1(x,  rf(:), q)';
    rf_out(rf_out >= 0) =  1;
    rf_out(rf_out <  0) = -1;
else
    rf_out = [];
end

if ~isempty(dt)
    % Scale dt, assuming constant total time
    % Note that this is not exactly how it works on the scanner.
    ttot = dt*size(gwf,1);
    dt_out = ttot / size(gwf_out,1);
else
    dt_out = [];
end