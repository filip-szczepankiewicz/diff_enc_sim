function h = des_plot_cube(c_p, rx, ry, rz)

if isempty(c_p) || nargin < 1
    c_p = des_cube_points();
end

c_p(c_p(:,1)==-1, 1) = rx(1);
c_p(c_p(:,1)== 1, 1) = rx(2);
c_p(c_p(:,2)==-1, 2) = ry(1);
c_p(c_p(:,2)== 1, 2) = ry(2);
c_p(c_p(:,3)==-1, 3) = rz(1);
c_p(c_p(:,3)== 1, 3) = rz(2);

plot3(c_p(:,1), c_p(:,2), c_p(:,3), 'color', 'k', 'linewidth', 1, 'linestyle', '-')