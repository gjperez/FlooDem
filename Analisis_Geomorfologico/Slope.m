% Script que calcula la pendiente de una MDT, empleando el algoritmo de
% Burrough, P. A., and McDonell, R. A., 1998.

% Se realiza lectura del MDT


function [Slope_MDT]= Slope(Dem,Cellsize,Tipo) % La vairbale tipo define si se clacula la pendiente en porcentaje o en grados, 1 Grados, 2 en porcentaje

% Se calcula la pendiente
fun = @(x) Pendiente_Grupo_Celda(x(:),Cellsize,Tipo);
Slope_MDT=nlfilter(Dem, [3 3], fun);



end