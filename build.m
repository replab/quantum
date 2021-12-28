function result = build
% Builds the documentation website

    replab_init;

    % Define and create required paths
    [basePath, name, extension] = fileparts(mfilename('fullpath'));
    basePath = strrep(basePath, '\', '/'); % we normalize to Unix style filesep, as it is compatible with all
    sphinxRoot = fullfile(basePath, 'sphinx');
    preprocessedFolder = fullfile(basePath, 'generated');
    replab.infra.mkCleanDir(basePath, 'generated');
    sphinxTarget = fullfile(basePath, 'docs');
    
    % Builds the documentation only
    replab_sphinx('ppdoc', 'sphinxRoot', sphinxRoot, 'preprocessedFolder', preprocessedFolder, 'sphinxTarget', sphinxTarget);
    result = replab_sphinx('build', 'sphinxRoot', sphinxRoot, 'preprocessedFolder', preprocessedFolder, 'sphinxTarget', sphinxTarget);
end