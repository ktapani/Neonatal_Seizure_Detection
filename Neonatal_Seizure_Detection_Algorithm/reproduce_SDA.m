function [dec,results,dec_raw,feats]=reproduce_SDA(group,path,annotat,n,varargin)

%% Compute decision values, binary output and performance measures
addpath(genpath('reproducibility'))
% Original Deburchgraeve algorithm
if isequal(group,'SDA_DB')
    addpath(genpath('neonatal_sez_det'))
    disp('Binary decision computed for patients:')
    dec=db_algorithm(path,n);
    
% Other algorithms
else
    fs_orig=256;
    % load filters
    load hp; load notch_filter
    feats=get_features(group,path,hp,Num,Den,fs_orig,n);
    [dec_raw,dec]=get_decision_values(group,annotat,feats,n,varargin{1});
end
% Compute post-processed results
if isequal(group,'SDA_DB')
    results=get_results(group,annotat,dec);
else
    results=get_results(group,annotat,dec_raw);
end

delete(gcp('nocreate'))
