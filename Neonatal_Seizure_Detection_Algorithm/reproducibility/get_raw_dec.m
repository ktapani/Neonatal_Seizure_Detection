function dec=get_raw_dec(norm_val,feats,SVMs,p)
% labels from annotation (consensus)
ff_ind=[1:length(feats{p}{1})]';
dec=cell(length(feats{p}),1);

for i=1:length(feats{p})   
    ff=[];
    for ii=1:length(ff_ind)
        ff=[ff;feats{p}{i}{ii}];
    end
    % normalize features
    ss=size(ff,2);
    mu=norm_val{p}(1:ss);
    sig=norm_val{p}((ss)+1:end);
    val=bsxfun(@rdivide,bsxfun(@minus,ff,mu),sig);
    [ ~,dec{i}] = predict(SVMs{p},val);
    dec{i}=dec{i}(:,2);
end

