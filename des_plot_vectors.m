function h = des_plot_vectors(h, f, t, col, lw, ls)
% function h = des_plot_vectors(h, f, t, col, lw, ls)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html
%
% h = handle list to line objects
% f = from vector (starting point), nx3
% t = to vector (ending point), nx3
% lw = line width
% ls = line style

if nargin < 5
    lw = 1;
end

if nargin < 6
    ls = '-';
end


if isempty(h)
    
    for i = 1:size(f,1)
        
        h(i) = plot3(...
            [f(i,1) t(i,1)], [f(i,2) t(i,2)], [f(i,3) t(i,3)], ...
            ls, 'linewidth', lw, 'color', col(i,:), 'markersize', lw);
        
        if i == 1
            hold on
        end
        
    end
    
else
    
    xd = num2cell([f(:,1) t(:,1)], 2);
    yd = num2cell([f(:,2) t(:,2)], 2);
    zd = num2cell([f(:,3) t(:,3)], 2);
    co = num2cell(col, 2);
    
    set(h, {'XData'}, xd, {'YData'}, yd, {'ZData'}, zd, {'color'}, co)
    
end