%% Función que calcula la distancia euclidiana de la red de drenaje

function [Distancia]=Distancia_Red(Red,NoData,Cellsize)

% Se definen todos los valores de la Red como 1

Red(Red~=NoData)=1;
Red(Red~=1)=0;
Distancia=double(bwdist(Red))*Cellsize;



end