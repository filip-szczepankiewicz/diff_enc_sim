function h = des_plot_points(h, r, col, ms, msiz)
% function h = des_plot_points(h, r, col, ms, msiz)
% By Filip Szczepankiewicz
%
% h = handle list to line objects
% r = position vectors, nx3
% col = marker color
% ms = marker style

if nargin < 4
    col = [0 0 0];
end

if nargin < 5
    ms = '.';
end


if isempty(h)

    h = plot3(...
        r(:,1), r(:,2), r(:,3), ms, 'color', col, 'MarkerSize', msiz);

    hold on

else

    set(h, 'XData', r(:,1), 'YData', r(:,2), 'ZData', r(:,3), 'color', col, 'MarkerSize', msiz)
end