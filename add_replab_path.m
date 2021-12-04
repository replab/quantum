function add_replab_path(varargin)
% function add_replab_path
%
% Adds to the path the subfolder 'external/replab'. This allows to run
% 'replab_init' from the current working directory.
%
% Note that no other version of replab should be in the path, otherwise the
% call to 'replab_init' will fail.
%
% Example:
%     >>> add_replab_path   % doctest: +SKIP

    % Get the path of the current
    [pathStr, name, extension] = fileparts(which(mfilename));

    % Add subfolder to the path
    replabPath = fullfile(pathStr, 'external', 'replab');
    addpath(replabPath);
