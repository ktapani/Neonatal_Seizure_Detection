function [dec, dec_raw, feat] = seizure_detection(filename, format, detector,varargin)
 
% A function that implements several seizure detection algorithms on the EEG
%

% Optional inputs
% varargin{1}: model_file_path - Path to mat-file containing the trained SVM (mdlSVM),
% normalization values (norm) and detection threshold (thr)
% varargin{2}: fs - Sampling frequency with format 3

addpath(genpath('neonatal_sez_det'))

% try
if isequal(detector,'SDA_DB')
    
    dec=DB_algorithm_original(filename,format);

elseif isequal(detector,'SDA') || isequal(detector,'SDA_T') || isequal(detector,'SDA_DB_mod')
    % compute features
    load('notch_filter');
    load('hp');
    if format==3 && length(varargin)==2
        feat=compute_features(format,detector,filename,hp,Num,Den,varargin{2});
    elseif format==1 || format==2
        feat=compute_features(format,detector,filename,hp,Num,Den);
    else
        disp('Invalid format or variable "fs" missing')
    end
    % compute binary annotation (dec) and raw decision values (dec_raw)
    load(varargin{1})
    [dec,dec_raw]=compute_decision_values(detector,feat,mdlSVM,norm_val,thr);
    
else
    disp('Invalid detector')
end

% catch ME
%     disp(ME)
% end
    
    