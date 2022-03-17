clear

odir = 'C:\Users\filip\Desktop\anim\';

D = 1/20;
ntime = 500;
npart = 5000;
mode = 3;


clf
set(gcf, 'color', 'w')
h = [];

for i = 1:ntime

    if i == 1
        r = randn(npart,3)*0.01;
    else
        r = r + randn(size(r))*D;
    end

    switch mode
        case 1 % free
            onam = 'points_free.gif';

        case 2 % sphere
            onam = 'points_sphere.gif';
            rad = 2;
            ind = my_norm(r,2)>rad;
            r(ind,:) = 2*r(ind,:)./my_norm(r(ind,:),2)-r(ind,:);

        case 3 % stick
            onam = 'points_stick.gif';
            rad = 1;
            ind = my_norm(r(:,[1 2]),2)>rad;
            r(ind,[1 2]) = 2*r(ind,[1 2])./my_norm(r(ind,[1 2]),2) - r(ind,[1 2]);
    end

    h = des_plot_points(h, r, [0 0 0], '.', 1);

    axis off
    axis equal vis3d
    axis([-1 1 -1 1 -1 1]*4)
    set(gca, 'CameraPosition', [41   33   12])

    if i == 1
        text(0, 0, -4, 'github.com/filip-szczepankiewicz/diff_enc_sim', 'interpreter', 'none', 'color', [1 1 1]*0.8, 'HorizontalAlignment', 'center')
    end
    drawnow

    II = getframe();
    I{i} = II.cdata;

end

img_list = find_files_under_folder([odir '*.png'], 0, 'detail');
mkdir(odir)
o_file = [odir filesep onam];
loop_count = inf;
fps = 60;
delay_start = 0;
delay_end = 4;
des_imgl2gif(I, o_file, loop_count, fps, delay_start, delay_end)




