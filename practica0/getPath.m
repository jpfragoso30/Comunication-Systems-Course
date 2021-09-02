function [fullPath] = getPath()
% getPath doesn't receive arguments,
% it displays the file select UI to get the .mp3 audio
% and then returns its fullPath directory/fileName.mp3

[file, path] = uigetfile('*.mp3');

fullPath = strcat(path, file);

end

