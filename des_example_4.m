clear
clf

x = linspace(0, 4*2*pi, 4*60)'/1;

f1 = 1;
f2 = 1.25;

v1 = [sin(f1*x) cos(f1*x) ones(size(x))*0.4];
v2 = [sin(f2*x) cos(f2*x) ones(size(x))*0.6];

col = [0 0 0; 1 0 0];

h1 = [];
h2 = [];
for i = 1:size(v1,1)
    
    f = [0 0 0.4; 0 0 0.6];
    t = [v1(i,:); v2(i,:)];
    
    % LABORATORY
    if i == 1
        subplot(1,2,1)
        axis([-1 1 -1 1 0 1])
        axis vis3d
        axis off
        view(15, 30)
        hold on
        des_plot_cube([], [-1 1], [-1 1], [0 1])
    end
    
    h1 = des_plot_vectors(h1, f, t, col, 2, '-');
    
    
    % ROTATING
    if i == 1
        subplot(1,2,2)
        axis([-1 1 -1 1 0 1])
        axis vis3d
        axis off
        hold on
        des_plot_cube([], [-1 1], [-1 1], [0 1])
    end
    
    h2 = des_plot_vectors(h2, f, t, col, 2, '-');
    view(15-x(i)*180/pi, 30)
    
    drawnow
    des_show_fps(60);
end





