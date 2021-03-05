function h = des_plot_gwf_3d(h, gwf, i)
% function h = des_plot_gwf_2d(h, gwf, i)
% By Filip Szczepankiewicz

if isempty(h)
    
    h{1} = plot3(gwf(1:i,1), gwf(1:i,2), gwf(1:i,2), '-k', 'linewidth', 1);
    
else
    
    set(h{1}, 'XData', gwf(1:i,1), 'YData', gwf(1:i,2), 'ZData', gwf(1:i,3));
    
end