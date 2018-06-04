%% Seizure detection algorithm

% This is the main script of the seizure detection algorithm. The user can
% choose from four different algorithms: SDA, SDA_T, SDA_DB and SDA_DB_mod.
% With this script, features can be extracted on new data and then tested
% with the trained SVM to aquire the decision values and binary annotation.
% Finally, performance measures can be estimated comparing the SVM output
% to the human annotation of three experts, that is, the gold standard.

% For more information, please refer to (reference of the paper).


% model_file_path
% MUST BE DEFINED if detector is: SDA, SDA_DB_mod or SDA_T
% is the path to a matlab variable including 1) the model file used to implement the SVM, 
% 2) the normalization values for the features and 3) the threshold for the decision
%% Select algorithm 
% Proposed SDA: group='SDA'
% SDA Temko: group='SDA_T'
% Version of the original Deburchgraeve SDA: group='SDA_DB'
% Modified version of the original Deburchgraeve SDA: group='SDA_DB_mod'

%% Path to edfs, annotation file and number of parallel pools

% Path to edf files
path='...';
% Load annotation file
load annotations
% Choose a number of parallel pools, n
% If no parallel computation wanted, select: n=0
n=0;
%% Reproduce SDA features, decision and results
%Example:
%group='SDA_DB';
%path='data/'
%n=0;
%[dec,results]=reproduce_SDA(group,path,annotat,n);

model_file_path='neonatal_sez_det/SVMs/svm_SDA';
[dec,results,dec_raw,feats]=reproduce_SDA(group,path,annotat,n,model_file_path);
