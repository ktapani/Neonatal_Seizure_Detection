function dec=compute_raw_dec(norm_val,feat,SVM)

ss=length(feat{1}{1});
mu=norm_val(1:ss);
sig=norm_val((ss)+1:end);
dec=cell(length(feat),1);
for i=1:length(feat)   
    ff=[];
    for ii=1:length(feat{1})
        ff=[ff;feat{i}{ii}];
    end
    % normalize features
    val=bsxfun(@rdivide,bsxfun(@minus,ff,mu),sig);
    [ ~,dec{i}] = predict(SVM,val);
    dec{i}=dec{i}(:,2);
end

