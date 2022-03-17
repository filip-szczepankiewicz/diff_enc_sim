function des_imgl2gif(img_list, o_file, loop_count, fps, delay_start, delay_end)
% function des_imgl2gif(img_list, o_file, loop_count, fps, delay_start, delay_end)
% By Filip Sz
%
% img_list can be list of paths to images or a cell array of images

if loop_count > 65535
    loop_count = 65535;
end

delay_time = 1/fps;

if nargin < 5
    delay_start = delay_time;
end

if nargin < 6
    delay_end = delay_time;
end


for i = 1:numel(img_list)

    if isstr(img_list{i}) && exist(img_list{i}, 'file')
        I = imread(img_list{i});
    else
        I = img_list{i};
    end

    [X, map]= rgb2ind(I,256);

    if i == 1
        imwrite(X, map, o_file, 'gif', 'LoopCount', loop_count, 'DelayTime', delay_start)

    elseif i == numel(img_list)
        imwrite(X, map, o_file, 'gif', 'WriteMode', 'append', 'DelayTime', delay_end)

    else
        imwrite(X, map, o_file, 'gif', 'WriteMode', 'append', 'DelayTime', delay_time)

    end

    disp(['Processing image ' num2str(i) '/' num2str(numel(img_list))])
end

disp('Finished .gif creation!')
disp(o_file)


