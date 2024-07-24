% COdigo para correr el MrVBF, para observar cual es el error
% Se carga el MDE
'CARGANDO MAPAS DE ENTRADA'
Ruta_MDT='D:\Maestria_Ing_Recursos_Hidraulicos\Tesis_Inundaciones\Aplicación_Zonas_Estudio\Dem\Ascii_Dem_Planas\dem_30_mascara_plato.asc';
Ruta_Res='D:\Resultados_Mrvbf\';
'CARGANDO DEM'
[Dem,X_dem,Y_dem] = rasterread(Ruta_MDT);
Dem=GRIDobj(Ruta_MDT); % Se carga el DEM
[MRVBF2,MRVBF3]= Mrvbf(Dem);
 MRVBF2 = GRIDobj(X_dem,Y_dem,MRVBF2);
 GRIDobj2ascii(MRVBF2,[Ruta_Res 'MRVBF2.asc']);
MRVBF3 = GRIDobj(X_dem,Y_dem,MRVBF3);
 GRIDobj2ascii(MRVBF3,[Ruta_Res 'MRVBF3.asc']);

clear all