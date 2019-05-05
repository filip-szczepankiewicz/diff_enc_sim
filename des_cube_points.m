function c_p = des_cube_points
% function c_p = des_cube_points
% This function generates the vector list of a cube where no diagonal
% lines are present. It can be used to plot a cube in 3D space.
% Output is: [x1 y1 y2; x2 y2 y3; ...]

c_p =[  -1 -1 -1
        -1 -1  1
         1 -1  1
         1 -1 -1
        -1 -1 -1
        -1  1 -1
        -1  1  1
         1  1  1
         1  1 -1
        -1  1 -1
         1  1 -1
         1 -1 -1
         1 -1  1 
         1  1  1
        -1  1  1
        -1 -1  1];
