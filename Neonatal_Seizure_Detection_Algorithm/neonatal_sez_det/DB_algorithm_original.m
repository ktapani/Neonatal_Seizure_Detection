% DB algorithm
function bb=DB_algorithm_original(filename,format)

dur_min = 8; 

if format==1

[data_mont, sc, fs] = read_data_montage(filename);    % Load EEG data
anew1 = zeros(length(data_mont), length(data_mont{1})/fs(1));
anew2 = anew1;
% DB algorithm
for ii = 1:length(data_mont)
    dat = preprocess(double(data_mont{ii}).*sc); % Preprocessing
    anew1(ii,:) = oscillatory_type(dat, fs(ii));          % Detect oscillatory type activity
    anew2(ii,:) = spike_detection_deburch(dat, fs(ii));   % Detect of spike trains
end
aa = sum([anew1 ; anew2]);  % combine detections (any detection in either detector is a detection)
aa(aa>1)=1; 
bb = check_s_len(aa, dur_min); % remove detections less than 8s in length

elseif format==2
    
elseif format==3
    
else
    disp('Format should be 1, 2 or 3')
    
end
end
