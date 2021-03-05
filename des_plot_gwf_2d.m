function h = des_plot_gwf_2d(h, gwf, i)
% function h = des_plot_gwf_2d(h, gwf, i)
% By Filip Szczepankiewicz

col = {'r', 'g', 'b'};

if isempty(h)
    
    h{1} = plot(gwf, '-', 'linewidth', 2, 'color', [1 1 1]*0.8);
    
    for j = 1:size(gwf,2)
        h{2}(j) = plot(gwf(1:i,j), ['-' col{j}], 'linewidth', 2);
        h{3} = plot(linspace(-5, length(gwf)+5, length(gwf)+2), zeros(length(gwf)+2, 1), 'k', 'linewidth', 2);
        h{4}(j) = plot(i, gwf(i,j), 'ko', 'MarkerFaceColor', 'w');
    end
    
else
    
    for j = 1:size(gwf,2)
        set(h{2}(j), 'XData', 1:i, 'YData', gwf(1:i,j))
        set(h{4}(j), 'XData', i, 'YData', gwf(i,j))
    end
    
end