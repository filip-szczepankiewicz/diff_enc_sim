clear
clf

set(gcf, 'color', 'w')

t = linspace(0, 4*2*pi, 4*60)'/1;

f1 = 1;
f2 = 1.25;

v1 = [sin(f1*t) cos(f1*t) zeros(size(t))];
v2 = [sin(f2*t) cos(f2*t) zeros(size(t))];

col = [0 0 0; 1 0 0];

f = zeros(size(v1,1),1);
h1 = [];
h2 = [];
for i = 1:size(v1,1)

    if i == 1
        subplot(1,2,1)
        axis([-1 1 -1 1 0 1])
        axis vis3d
        axis off
        view(0, 90)
        hold on
    end
    
    h1 = des_plot_vectors(h1, [0 0 0], v1(i,:), col(1,:), 2, '-');
    
    
    if i == 1
        subplot(1,2,2)
        axis([-1 1 -1 1 0 1])
        axis vis3d
        axis off
        view(0, 90)
        hold on
    end
    
    h2 = des_plot_vectors(h2, [0 0 0], v2(i,:), col(2,:), 2, '-');
    
    
    drawnow
    des_show_fps(60);
end



















