% Script que calcula la pendiente de una MDT, empleando el algoritmo de
% Burrough, P. A., and McDonell, R. A., 1998.

% Se realiza lectura del MDT


function [Slope_MDT]= Pendiente_Grupo_Celda(MDT,Cellsize,Tipo) % La vairbale tipo define si se clacula la pendiente en porcentaje o en grados, 1 Grados, 2 en porcentaje
if isnan(sum(MDT(:)))==9
   Slope_MDT=NaN; 
else
   MDT(isnan(MDT)==1)=nanmean(MDT);
  % Se calcula la pendiente en Grados
   dz_dx=((MDT(7)+2*MDT(8)+MDT(9))-(MDT(1)+2*MDT(2)+MDT(3)))/(8*Cellsize);
   dz_dy=((MDT(3)+2*MDT(6)+MDT(9))-(MDT(1)+2*MDT(4)+MDT(7)))/(8*Cellsize);
   Slope_degrees=atan((((dz_dx)^2)+((dz_dy)^2))^0.5)*57.29578;
end

if isnan(sum(MDT))==1
   Slope_MDT=NaN; 
elseif Tipo==1
   Slope_MDT=Slope_degrees; 
else % Es tipo 2 en porcentaje
   Slope_MDT=100*(((dz_dx)^2)+((dz_dy)^2))^0.5;  
end

end