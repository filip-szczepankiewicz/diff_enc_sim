function fps = des_show_fps(targ_fps)
% function fps = des_show_fps(targ_fps)
% By Filip Szczepankiewicz
% Prepared for the ISMRM 2019 diffusion MRI Educational session:
% https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html
%
% targ_fps is the target refresh rate in frames per second. This is used
% when animation must be slowed down.

global g_drawtime

if isempty(g_drawtime)
    g_drawtime = tic;
end

if nargin < 1
    targ_fps = inf;
end

t = toc(g_drawtime);

if t < 1/targ_fps
    delay_time = (1/targ_fps - t);
    pause(delay_time);
    t = toc(g_drawtime);
end

fps = 1/t;

if nargout < 1
    clc
    disp(['FPS = ' num2str(fps, 3)])
end


g_drawtime = tic;