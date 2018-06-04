function dec = seizure_detection_db(fn);
% This function applies a version of the seizure detection algorithm
% outlined in Deburchgraeve et al. 2008 (Deburchgraeve W, Cherian PJ, 
% De Vos M, Swarte RM, Blok JH, Visser GH, Govaert P, Van Huffel S. 
% Automated neonatal seizure detection mimicking a human observer reading EEG.
% Clinical Neurophysiology. 2008 Nov 1;119(11):2447-54.)
%
% Input: fn - filename of the EDf file to be analysed
%
% Output: dec - a binary vector containing a decision as to the presence
%               (=1) or absence (=0) of seizure sampled at 1Hz/1s.
%
% subfunction - red_data_montage, preprocess, oscillaory_type,
%               spike_detection_duburch
%
% Nathan Stevenson
% University of Helsinki
% 4 May 2018

dur_min = 8; 
[data_mont, sc, fs] = read_data_montage(fn);    % Load EEG data
anew1 = zeros(length(data_mont), length(data_mont{1})/fs(1));
anew2 = anew1; A = size(data_mont);
% Analyse per channel
for ii = 1:A(2);
    dat = preprocess(double(data_mont{ii}).*sc, fs(ii)); % Preprocessing
    anew1(ii,:) = oscillatory_type(dat, fs(ii));          % Detect oscillatory type activity
    anew2(ii,:) = spike_detection_deburch(dat, fs(ii));   % Detect of spike trains
end
aa = sum([anew1 ; anew2]);  % combine detections (any detection in either detector is a detection)
aa(aa>1)=1; 
dec = check_s_len(aa, dur_min); % remove detections less than 8s in length
  

