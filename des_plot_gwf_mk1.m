function fnl = des_plot_gwf_mk1(gwf, odir)
% function fnl = des_plot_gwf_mk1(gwf, odir)

if nargin < 1
    [a, b] = hc_wf_v2;
    gwf = [a; zeros(8,3); -b];
    clf
end

if nargin < 2
    odir = [];
    fnl  = [];
end

if ~isempty(odir)
    mkdir(odir);
end


gwf = gwf./max(my_norm(gwf,2));
q   = cumsum(gwf, 1);
q   = q./max(my_norm(q,2));

BT  = q'*q;

h1 = [];
h2 = [];
h3 = [];
h4 = [];
h5 = [];
h6 = [];

for i = 1:length(gwf)
    
    
    % PLOT 1 - 2D GWF
    if i == 1
        a1 = axes('position', [.01 .01 .25 0.9]);
        axis off
        hold on
    else
        axes(a1);
    end
    
    h1 = des_plot_gwf_2d(h1, gwf, i);
    
    
    
    % PLOT 2 - 3D GWF
    if i == 1
        a2 = axes('position', [.27 .01 .25 0.9]);
        axis off
        hold on
        
        axis vis3d
        
        plot3([-1 1], [0 0],  [0 0], '-', 'color', 'r', 'linewidth', .8)
        plot3([0 0], [-1 1],  [0 0], '-', 'color', 'g', 'linewidth', .8)
        plot3([0 0], [0 0],  [-1 1], '-', 'color', 'b', 'linewidth', .8)
        
        set(gca, 'CameraPosition', [-9   10   10])
        axis off
        
        set_p6_tensor_light
    else
        axes(a2);
    end
    
    h2 = des_plot_gwf_3d(h2, gwf, i);
    
    if ~isempty(h3)
        delete(h3)
    end
    
    h3 = mArrow3([0 0 0], gwf(i,:), 'color', sqrt(abs(gwf(i,:))), 'stemWidth', .03);
    
    
    
    
    % PLOT 3
    if i == 1
        a3 = axes('position', [.51 .01 .25 0.9]);
        axis off
        hold on
        
        axis vis3d
        
        plot3([-1 1], [0 0],  [0 0], '-', 'color', 'r', 'linewidth', .8)
        plot3([0 0], [-1 1],  [0 0], '-', 'color', 'g', 'linewidth', .8)
        plot3([0 0], [0 0],  [-1 1], '-', 'color', 'b', 'linewidth', .8)
        
        set(gca, 'CameraPosition', [-9   10   10])
        axis off
        
        set_p6_tensor_light
    else
        axes(a3);
    end
    
    h4 = des_plot_gwf_3d(h4, q, i);

    
    if ~isempty(h5)
        delete(h5)
    end
    
    h5 = mArrow3([0 0 0], q(i,:), 'color', sqrt(abs(q(i,:))), 'stemWidth', .03);
    
    
    
    % PLOT 4
    if i == 1
        a4 = axes('position', [.75 .01 .25 0.9]);
        axis off
        hold on
        
        axis vis3d
        
        plot3([-1 1], [0 0],  [0 0], '-', 'color', 'r', 'linewidth', .8)
        plot3([0 0], [-1 1],  [0 0], '-', 'color', 'g', 'linewidth', .8)
        plot3([0 0], [0 0],  [-1 1], '-', 'color', 'b', 'linewidth', .8)
        
        set(gca, 'CameraPosition', [-9   10   10])
        axis off
        
        set_p6_tensor_light
        
        axis([-1 1 -1 1 -1 1]*1.1)
        light
        lighting phong
        axis vis3d
        set(gca, 'CameraPosition', [-9   10   10])
    else
        axes(a4);
    end
    
    
    
    B = q(1:i, :)'*q(1:i, :)/trace(BT);
    [e, l] = eig(B);
    L = abs(diag(l));
    
    L(L == 0) = max(L)/300;
    
    [x, y, z] = tensor_glyph(sort(L)', [0 0 1], 100);
    
    if ~isempty(h6)
        delete(h6);
    end
    
    h6 = plot_tensor_glyph(x, y, z, [1 1 1]*0.5, 0.7);
    
    
    
    drawnow
    
    if ~isempty(odir)
        fnl{i} = save_current_fig_to_file(['frame_' num2str(i, '%04.0f')], of, [6 1.5], [600 1/3]);
    end
    
end


















