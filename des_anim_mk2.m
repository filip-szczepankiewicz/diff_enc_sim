function v = des_anim_mk2(gwf, rf, dt, r)
% function v = des_anim_mk2(gwf, rf, dt, r)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

p    = des_gwf_pos_to_phase(gwf, rf, dt, r);

nt   = size(gwf, 1);
np   = size(r, 1);

col  = jet(np);

hx = linspace(-8, 8, 50);



h  = [];
h1 = [];
h2 = [];
for i = 1:nt
    tic;
    
    v = [sin(p(:,i)) cos(p(:,i))];
    f = [zeros(np,2) r(:,i)];
    t = [v           r(:,i)];
    
    
    % PLOT GRADIENT WAVEFORM
    if i == 1
        subplot(2,1,1);
        axis off
        hold on
    end
    
    h = des_plot_gwf(h, gwf, i);
    
    
    % PLOT phase vectors in 3D
    if i == 1
        subplot(2,2,3);
        axis([-1 1 -1 1 min(r(:)) max(r(:))])
        axis vis3d
        axis off
        hold on
    end
    
    h1 = des_plot_vectors(h1, f, t, col);
    
    
    % PLOT phase vectors in 2D
    if i == 1
        hh = subplot(2,2,4);
        axis([-1 1 -1 1 min(r(:)) max(r(:))])
        axis vis3d
        axis off
        view(0, 90)
        hold on
    end
    
    h2 = des_plot_vectors(h2, f, t, abs(t(:, [3 2 1])).^2);
    
    drawnow
    des_show_fps;
end




