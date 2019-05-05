function v = des_anim_mk1(gwf, rf, dt, r)
% function v = des_anim_mk1(gwf, rf, dt, r)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html

p    = des_gwf_pos_to_phase(gwf, rf, dt, r);

nt   = size(gwf, 1);
np   = size(r, 1);

col  = jet(np);


h = [];
for i = 1:nt
    tic;
    
    v = [sin(p(:,i)) cos(p(:,i))];
    f = [zeros(np,2) r(:,i)];
    t = [v           r(:,i)];
    

    % PLOT phase vectors in 3D
    if i == 1
        axis([-1 1 -1 1 min(r(:)) max(r(:))])
        axis vis3d
        axis off
        hold on
    end
    
    h = des_plot_vectors(h, f, t, col);
    
    drawnow
    des_show_fps;
end




