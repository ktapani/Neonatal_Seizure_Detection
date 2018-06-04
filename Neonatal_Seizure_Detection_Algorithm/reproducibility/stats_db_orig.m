function [sens,spec,ppv,npv] = stats_db_orig(dec, annotat_new, cn,num)

% CHANGE THE SVM OUTPUT INTO A BINARY DECISION
% AUC per patient
d4= cell(1,79); % automated annotation
sens=zeros(1,79);spec=sens;ppv=sens;npv=sens;
for ii = 1:79
    a = annotat_new{ii};
    a = sum(a); 
    if length(find(a==3))>0
        xx = linspace(0,1,num);
        M1 = length(find(a==3));
        M2 = length(find(a==0));
        % extend automated annotations with collar cn     
        d3 = dec{ii};

        r1 = find(diff([0 d3 0]) == 1);
        r2 = find(diff([0 d3 0]) == -1);
        r2 = r2+cn; r2(r2>length(d3)) = length(d3);
        for z3 = 1:length(r2)
           d3(r1(z3):r2(z3)) = 1;
        end
        d4{ii}=d3;
        % compute statistical measures
        if isempty(find(d3==1 & a==3))
            sens(ii)=0;ppv(ii)=0;
        else
        sens(ii) = length(find(d3==1 & a==3))/M1; %sensitivity
        ppv(ii) = length(find(d3==1 & a==3))/length(find(d3==1)); %precision 
        end
        spec(ii) = length(find(d3==0 & a==0))/M2; %specificity           
        npv(ii) = length(find(d3==0 & a==0))/length(find(d3==0)); %negative predictive value
       
    end
end






