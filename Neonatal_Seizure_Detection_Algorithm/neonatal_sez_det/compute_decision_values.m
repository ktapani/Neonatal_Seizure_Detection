function [dec,dec_raw]=compute_decision_values(detector,feat,SVM,norm_val,thr)

% SDA
if isequal(detector,'SDA')
    cn=23;
% SDA_T
elseif isequal(detector,'SDA_T')
    cn=7;
% SDA_DB_mod
elseif isequal(detector,'SDA_DB_mod')
    cn=28;    
end

% Raw decision values
dec_raw=compute_raw_dec(norm_val,feat,SVM);
% Binary output annotation
dec=compute_dec(dec_raw, cn, thr);


end