function feats=features_per_ch(sig,sc,len, fs_orig,fs,hpf,Num,Den,olap,detector)
if isequal(detector,'SDA')==1
    feats=cell(length(sig),1);
    for i=1:length(sig)
        feats{i}=ch_sda(sig,sc,len, fs_orig,fs,Num,Den,olap,i,hpf);
        disp(i)
    end
elseif isequal(detector,'SDA_T')==1 
    feats=cell(length(sig),1);
    for i=1:length(sig)
        feats{i}=ch_temko(sig,sc,len, fs_orig,fs,Num,Den,olap,i);
    end
elseif isequal(detector,'SDA_DB_mod')==1 
    feats=cell(length(sig),1);
    for i=1:length(sig)
        feats{i}=ch_db(sig,sc,len, fs_orig,fs,Num,Den,olap,i);
    end
end

end