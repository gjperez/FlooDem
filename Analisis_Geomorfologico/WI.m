% Script que calcula el Topographic Index de un MDT, tambien se conoce como
% el wetnnes index

% Se realiza lectura del MDT


function [Wetness_Index]= WI(Dem,As) % La vairbale tipo define si se clacula la pendiente en porcentaje o en grados, 1 Grados, 2 en porcentaje


%Se calcula el mapa de pendiente y el de acumulación, el de acumulación
%debe estar en m2
slope= Slope(Dem.Z,Dem.cellsize,1); % 1 es en grados, se debe pasar a Radianes
slope=slope*pi/180;
 %FD = FLOWobj(Dem,'preprocess','fill');
 %As = flowacc(FD); 
 As=Dem.cellsize*Dem.cellsize*As; % Para pasar de numero de celdas a m2, el mapa debe estar en m
% Se calcula el WI
slope(slope==0)=0.0001; % una centecima de grado la pendiente minima
 Wetness_Index=double(log(As./tan(slope)));



end