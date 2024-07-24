% Script que calcula el Sediment transport index

% Se realiza lectura del MDT


function [Sediment_transport_Index]= STI(Dem,As) % La vairbale tipo define si se clacula la pendiente en porcentaje o en grados, 1 Grados, 2 en porcentaje

%Se calcula el mapa de pendiente y el de acumulación, el de acumulación
%debe estar en m2
slope= Slope(Dem.Z,Dem.cellsize,1); % 1 es en grados, se debe pasar a Radianes
slope=slope*pi/180;
 %FD = FLOWobj(Dem,'preprocess','fill');
 %As = flowacc(FD); 
 As=Dem.cellsize*Dem.cellsize*As; % Para pasar de numero de celdas a m2, el mapa debe estar en m
 
% Se calcula el WI STI = (m + 1) × (As / 22.13)m × sin(B / 0.0896)n
m=0.4;
n=1.4;
slope(slope==0)=0.0001; % una centecima de grado la pendiente minima, se pone abs para tener soo la magnitud
Sediment_transport_Index = (m+1).*((As./22.13).^m).*abs(((sin(slope./0.0896)).^n));

end