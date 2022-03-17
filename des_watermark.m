function fileout = des_watermark(filein, fileout, textstr, textpos, loop_count, fps, delay_start, delay_end)
% function fileout = des_watermark(filein, fileout, textstr, textpos, loop_count, fps, delay_start, delay_end)

[I, M] = imread(filein, 'frames', 'all');

if nargin < 2
    [a, b, c] = fileparts(filein);
    fileout = [a filesep b '_watermark' c];
end

if nargin < 3
    textstr = 'github.com/filip-szczepankiewicz/diff_enc_sim';
end

if nargin < 4
    textpos = round([.5 .5] .* size(I, [1 2]));
end

if nargin < 5
    loop_count = inf;
end

if nargin < 6
    fps = 60;
end

if nargin < 7
    delay_start = 1;
end

if nargin < 8
    delay_end = delay_start;
end


for i = 1:size(I,4)

    II = ind2rgb(I(:,:,:,i), M);
    II = insertText(II, textpos, textstr, 'BoxOpacity', 0, 'TextColor', [1 1 1]*0.8, 'FontSize', 14);

    if i == 1
        clf
        imshow(II)
        1;
    end

    IO{i} = II;
end

des_imgl2gif(IO, fileout, loop_count, fps, delay_start, delay_end);


