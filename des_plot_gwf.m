function h = des_plot_gwf(h, gwf, i)
% function h = des_plot_gwf(h, gwf, i)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

if isempty(h)
    
    h(1) = plot(gwf, '-', 'linewidth', 2, 'color', [1 1 1]*0.8);
    h(2) = plot(gwf(1:i), '-r', 'linewidth', 2);
    h(3) = plot(linspace(-5, length(gwf)+5, length(gwf)+2), zeros(length(gwf)+2, 1), 'k', 'linewidth', 2);
    h(4) = plot(i, gwf(i), 'ko', 'MarkerFaceColor', 'w');
    
else

    set(h(2), 'XData', 1:i, 'YData', gwf(1:i))
    set(h(4), 'XData', i, 'YData', gwf(i))

end