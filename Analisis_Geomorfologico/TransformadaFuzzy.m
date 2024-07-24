function [N]= TransformadaFuzzy(x,t,p)
if isnan(x)==1
N=NaN;
else
N=1./(1+((x./t).^p));
end
end