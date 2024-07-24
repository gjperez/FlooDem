function [Percentil]= Percentile_Grupo_Celda(A)
A=A(:);
Valor=A(floor(size(A,1)/2)+1);
if sum(isnan(A))==size(A,1)
   Percentil=NaN; 
else % Calcule el percentil  
    A(isnan(A)==1)=nanmean(A);
    A(isnan(A)==1)=[];
    nc=size(A,1);
    A(A>Valor)=[]; conteo=size(A,1);
    Percentil=conteo./nc;
end
end