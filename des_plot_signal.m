function h = des_plot_signal(h, s, x, i)
% function h = des_plot_gwf(h, gwf, i)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

if isempty(h)
    
    h(1) = semilogy(x, s, '-', 'linewidth', 2, 'color', [1 1 1]*0.8);
    h(2) = semilogy(x(1:i), s(1:i), '-', 'linewidth', 2, 'color', [.7 .3 .3]);
%     h(3) = plot(linspace(-5, length(s)+5, length(s)+2), zeros(length(s)+2, 1), 'k', 'linewidth', 2);
    h(4) = semilogy(x(i), s(i), 'ko', 'MarkerFaceColor', 'w');
    
else

    set(h(2), 'XData', x(1:i), 'YData', s(1:i))
    set(h(4), 'XData', x(i), 'YData', s(i))

end