%% Función que realiza el analisis de componentes principales, el proposito es realizar el PCA de mapas, para ello se necesitan ingresar 
% los mapas como vectores http://matlabdatamining.blogspot.com.br/2010/02/principal-components-analysis.html

function [Componentes_Principales,COEFF,Componentes_Principales_Vectores,latent,Varianza]= PCA_mapas(Matriz_Mapas_Geomorfologia,Dem,Coor_X,Coor_Y)

[COEFF,Componentes_Principales_Vectores,latent] = princomp(Matriz_Mapas_Geomorfologia);
Varianza=cumsum(latent)./sum(latent)
%Se guardan las componentes principales en una matriz con un numero de
%bandas iguales al de componentes principales.
Componentes_Principales=NaN(size(Dem,1),size(Dem,2),size(Componentes_Principales_Vectores,2));
for jj=1:size(Componentes_Principales_Vectores,2)
    for i=1:size(Coor_X,1)
        Componentes_Principales(Coor_Y(i,1),Coor_X(i,1),jj)=Componentes_Principales_Vectores(i,jj);
    end  
end


end