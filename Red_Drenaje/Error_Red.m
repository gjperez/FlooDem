%% Script que compara la red de drenaje real con la derivada, en función de diferentes
% buffer, realizando un análisis de coincidencias de N celdas de buffer.
% Para esto se necesita la Red "real" y la red "derivada" y el mapa de
% Buffer de la red " real"

function[Coincidencia_Porcentual]=Error_Red(Red_Real,Red_Derivada,Red_Real_Buffer,Distancia_Analisis,Tamano_celda)
% Coincidencia exacta
Coincidencia_Exacta=Red_Real+Red_Derivada; Coincidencia_Exacta(Coincidencia_Exacta==2)=1;
Suma_Red=nansum(nansum(Red_Real));
Suma_Coincidencia_Exacta=nansum(nansum(Coincidencia_Exacta));
% Se calcula el Error Porcentual de coincidencia Exacta
Coincidencia_Porcentual(1)=Suma_Coincidencia_Exacta*100/Suma_Red;

% Coincidencia para la distancia que se quiera definir, se realiza en
% intervalos de analisis de la distancia de multiplos del tamano de celda
Auxiliar=Distancia_Analisis/Tamano_celda;
Auxiliar=ceil(Auxiliar);
for i=1:Auxiliar
    Red_aux=Red_Real_Buffer;
    Distancia=Tamano_celda*(i);
    Red_aux(Red_aux<=Distancia)=1;Red_aux(Red_aux~=1)=NaN;
    Coincidencia=Red_aux+Red_Derivada; Coincidencia(Coincidencia==2)=1;
    Suma_Coincidencia=nansum(nansum(Coincidencia));
    % Se calcula el Error Porcentual de coincidencia Exacta
    Coincidencia_Porcentual(i+1)=Suma_Coincidencia*100/Suma_Red;
end


end