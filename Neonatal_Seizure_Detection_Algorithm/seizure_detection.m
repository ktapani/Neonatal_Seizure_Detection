%% Seizure detection funtion
function [dec, dec_raw, feat] = seizure_detection(filename, format, detector,varargin)

% A function that implements several seizure detection algorithms on the EEG
% 
% Run the algorithm
% [dec, dec_raw, feat] = seizure_detection(filename, format, detector);

% INPUTS:

% filename is either:
%   1) the filename of an 18 channel bipolar montage (identical to that used in the EEG database)

%   2) the filename of an EDF file containing only EEG channels (arbitrary montage and channel number)

%   3) a matlab variable containing only EEG data (channel x time).

% format
% is a scalar denoting the type of data input 1, 2, 3 corresponding to the above possible filenames
% if 3 is selected then an additional sampling frequency parameter is required

% detector 
% is a string containing 4 potential values - SDA, SDA_DB_mod, SDA_T, SDA_DB

% OPTIONAL INPUTS:

% fs - MUST be defined with format 3

% OUTPUTS:

% dec is the final decision/binary output annotation sampled at 1Hz

% dec_raw is the raw SVM output for each EEG channel (for SDA, SDA_DB_mod, SDA_T only)
% feat is the feature values (for SDA, SDA_DB_mod, SDA_T only)

% EXAMPLES OF USE:

% When filename is class 1: 
% filename='/path_to/eeg1.edf'
% [dec, dec_raw, feat] = seizure_detection(filename, 1, 'SDA');

% When filename is class 2:
% filename='/path_to/eeg_data_file1001.edf';
% [dec, dec_raw, feat] = seizure_detection(filename, 2, 'SDA_T');

% When filename is class 3:
% filename='/path_to/eeg.mat';
% dec = seizure_detection(filename, 3, 'SDA_DB', fs);
% Define inputs here:
% required input variables:
%   filename
%   format
%   detector
% optional input variables:
%   fs
%
% Karoliina Tapani and Nathan Stevenson
% Aalto University and University of Helsinki, Finland
% June 2018


addpath(genpath('neonatal_sez_det'))

if isequal(detector,'SDA_DB')
    
    dec=DB_algorithm_original(filename,format);

elseif isequal(detector,'SDA') || isequal(detector,'SDA_T') || isequal(detector,'SDA_DB_mod')
    % compute features
    load('notch_filter');
    load('hp');
    if format==3 && length(varargin)==1
        feat=compute_features(format,detector,filename,hp,Num,Den,varargin{1});
    elseif format==1 || format==2
        feat=compute_features(format,detector,filename,hp,Num,Den);
    else
        disp('Invalid format or variable "fs" missing')
    end
    % compute binary annotation (dec) and raw decision values (dec_raw)
    load(['fullSVM_',detector])
    [dec,dec_raw]=compute_decision_values(detector,feat,mdlSVM,norm_val,thr);
    
else
    disp('Invalid detector')
end

end

    
    
