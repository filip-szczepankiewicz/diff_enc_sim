function  des_anim_mk3(gwf, rf, dt, r, odir)

if nargin < 5
    odir = [];
end

set(gcf, 'color', 'w')

p    = des_gwf_pos_to_phase(gwf, rf, dt, r);

nt   = size(gwf, 1);
np   = size(r, 1);

col  = jet(np);

hx = linspace(-8, 8, 50);


h  = [];
h1 = [];
h2 = [];
ha = [];
for i = 1:nt
    
    v = [sin(p(:,i)) cos(p(:,i))];
    f = [zeros(np,2) r(:,i)];
    t = [v           r(:,i)];
    
    
    % PLOT GRADIENT WAVEFORM
    if i == 1
        axes('position', [.0 .6 .95 .35]);
        axis off
        hold on
    end
    
    h = des_plot_gwf(h, gwf, i);
    
    
    % PLOT phase vectors in 3D
    if i == 1
        axes('position', [.05 -.1 .5 .7]);
        axis([-1 1 -1 1 min(r(:)) max(r(:))])
        axis vis3d
        axis off
        hold on
    end
    
    h1 = des_plot_vectors(h1, f, t, col);
    
    
    % PLOT phase vectors in 2D
    if i == 1
        axes('position', [.45 -.05 .5 .6]);
        axis([-1 1 -1 1 0 1]*1.2)
        axis vis3d
        axis off
        view(0, 90)
        hold on
        set_p6_tensor_light
    end
    
    h2 = des_plot_vectors(h2, f, t, col);
    
    if ~isempty(ha)
        delete(ha)
        ha = mArrow3([0 0 .5], [mean(v,1)*1.2 .5], 'stemWidth', .03, 'tipWidth', .06);
    else
        ha = mArrow3([0 0 .5], [mean(v,1)*1.2 .5], 'stemWidth', .03, 'tipWidth', .06);
    end
    
    drawnow
    des_show_fps;
    
    
    if ~isempty(odir)
        % This function is not supported generally, and requires some code that
        % saves a nice images. I may put my save_current funciton on git some
        % day.
        
        if ~exist(odir, 'file')
            mkdir(odir)
        end
        save_current_fig_to_file(['Ainimation_frame_' num2str(i, '%04.0f')], odir, [4 4], 200)
    end
    
end
