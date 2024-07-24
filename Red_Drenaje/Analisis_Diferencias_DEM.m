%% Función que realiza el analisis de las diferencias entre el DEM original y los Dems modificados
function [Resultado_Diferencias]=Analisis_Diferencias_DEM(Dem,Dem_Burn,Dem_Burn_Buffer,Red_hidro,Matriz_chequeo)
Dem_Burn(Red_hidro~=1)=NaN;
Dem_Burn_Buffer(Matriz_chequeo==0)=NaN;

% Se calcula la diferencia para la Red de drenaje
Dif_Dem_Red=abs(Dem-Dem_Burn);
Dif_Dem_Red=Dif_Dem_Red(:);
Resultado_Diferencias(1,1)=nanmean(Dif_Dem_Red);
Resultado_Diferencias(2,1)=nanstd(Dif_Dem_Red);
Resultado_Diferencias(3,1)=nanmax(Dif_Dem_Red);
Resultado_Diferencias(4,1)=nanmin(Dif_Dem_Red);

% Se calcula la diferencia para la Red de drenaje y el Buffer
Dif_Dem_Red_Buffer=abs(Dem-Dem_Burn_Buffer);
Dif_Dem_Red_Buffer=Dif_Dem_Red_Buffer(:);
Resultado_Diferencias(1,2)=nanmean(Dif_Dem_Red_Buffer);
Resultado_Diferencias(2,2)=nanstd(Dif_Dem_Red_Buffer);
Resultado_Diferencias(3,2)=nanmax(Dif_Dem_Red_Buffer);
Resultado_Diferencias(4,2)=nanmin(Dif_Dem_Red_Buffer);

end
