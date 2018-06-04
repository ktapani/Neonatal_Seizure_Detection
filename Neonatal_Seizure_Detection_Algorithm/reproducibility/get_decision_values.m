function [dec_raw,dec]=get_decision_values(group,annotat_new,feats,n,varargin)

% SDA
if isequal(group,'SDA')
    cn=23;
% SDA_T
elseif isequal(group,'SDA_T')
    cn=7;
% SDA_DB_mod
elseif isequal(group,'SDA_DB_mod')
    cn=28;    
end

load(varargin{1})

dec_raw=cell(length(feats),1);

if n~=0
    parpool(n)
    parfor p=1:length(feats)
    dec_raw{p}=get_raw_dec(norm_val,feats,SVMs,p);
    disp(p)
    end
    dec=get_dec(dec_raw, annotat_new, cn);
else
    for p=1:length(feats)
        dec_raw{p}=get_raw_dec(norm_val,feats,SVMs,p);
        disp(p)
    end
    dec=get_dec(dec_raw, annotat_new, cn);
end

end