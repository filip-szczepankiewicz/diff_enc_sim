function gamma = des_gamma(nucleus)
% function gamma = des_gamma(nucleus)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

if nargin < 1
    nucleus = 'H';
end


switch nucleus
    case 'H'
        gamma = 42.576e6 * 2 * pi; % rad/Tesla
        
    otherwise
        error('Unknown nucleus!')
end

