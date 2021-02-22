function des_dir2gif(in_dir, o_dir, o_nam, src_str)
% function des_dir2gif(in_dir, o_dir, o_nam, src_str)
% By Filip Szczepankiewicz

if nargin < 2
    o_dir = in_dir;
end

if nargin < 3
    o_nam = 'Animation.gif';
end

if nargin < 4
    src_str = '*.png';
end

d_info  = dir( fullfile(in_dir, src_str));
fnl     = fullfile(in_dir, {d_info.name} );

des_imgl2gif(fnl, [o_dir filesep o_nam], inf, 60, .5, 3)