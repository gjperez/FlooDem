%% Función que calcula el Mrvbf (Multi resolution valley bottom flatness)
function [MRVBF3]= Mrvbf(Dem) % La vairbale tipo define si se clacula la pendiente en porcentaje o en grados, 1 Grados, 2 en porcentaje
% Se carga el modelo digital de elevación
%% El mapa de entrada no puede tener Nodata, se eliminan estos con el valor medio, proponer un codigo que utilice valor medio.
Media_MDE=nanmean(nanmean(Dem.Z));
Dem.Z(isnan(Dem.Z)==1)=Media_MDE;

'MRVBF2'
slope= Slope(Dem.Z,Dem.cellsize,2); % 2 en porcentaje, 1 en grados
slope(isnan(Dem.Z)==1)=NaN;

% Se empieza a calcular el Mrvbf
FS1=TransformadaFuzzy(slope,16,4);
% Se calcula el percentil del DEM de 3x3
fun = @(x) Percentile_Grupo_Celda(x);
FD1=TransformadaFuzzy(nlfilter(Dem.Z, [7 7], fun),0.4,3);
FD1(isnan(Dem.Z)==1)=NaN;


% Se calcula el primer indice valley flatness index
PVF1=FS1.*FD1;
VF1=1-TransformadaFuzzy(PVF1,0.3,4);

% Se calcula el segundo indice valley flatness index
FS2=TransformadaFuzzy(slope,8,4);
Dem_Chequeo=nlfilter(Dem.Z, [13 13], fun);
FD2=TransformadaFuzzy(nlfilter(Dem.Z, [13 13], fun),0.4,3);
FD2(isnan(Dem.Z)==1)=NaN;
PVF2=FS2.*FD2;
VF2=1-TransformadaFuzzy(PVF2,0.3,4); % valley flatness index 2

w2=1-TransformadaFuzzy(VF2,0.4,6.68);
MRVBF2=(w2.*(1+VF2))+((1-w2).*VF1); % multi resolution valley flatness index 1

CF2=FS1.*FS2;

% Se realiza un for para los demas pasos
[X_ori,Y_ori]=meshgrid(1:size(Dem.Z,2),1:size(Dem.Z,1));
Numero_Iteraciones=5;
Umbral_Pendiente=8;
for i=1:Numero_Iteraciones
    Diametro=(6*i)+1;
    Pos_Inicial=floor(Diametro/2)+1;
[XI,YI]=meshgrid(Pos_Inicial:Diametro:size(Dem.Z,2),Pos_Inicial:Diametro:size(Dem.Z,1));   
Filas=size(XI,1); Columnas=size(XI,2);  
DEM_Smooth2 = imresize(Dem.Z,[Filas Columnas],'bilinear');
Cellsize=Dem.cellsize*Diametro;
slope= Slope(DEM_Smooth2,Cellsize,2); % 2 en porcentaje, 1 en grados
%slope = interp2(XI,YI,slope,X_ori,Y_ori,'nearest');   
slope = imresize(slope,[size(X_ori,1) size(X_ori,2)],'bilinear');
FD3=TransformadaFuzzy(nlfilter(DEM_Smooth2, [13 13], fun),0.4,3);
%FD3 = interp2(XI,YI,FD3,X_ori,Y_ori);
FD3 = imresize(FD3,[size(X_ori,1) size(X_ori,2)],'bilinear');
Umbral_Pendiente=Umbral_Pendiente/2;
FS3=TransformadaFuzzy(slope,Umbral_Pendiente,4);
CF3=CF2.*FS3;
PVF3=CF3.*FD3;
VF3=1-TransformadaFuzzy(PVF3,0.3,4); % valley flatness index 3
pl=log((((2+i)-0.5)/0.1))/(log(1.5));
w3=1-TransformadaFuzzy(VF3,0.4,pl);
MRVBF3=(w3.*(3-1+VF3))+((1-w3).*MRVBF2); % multi resolution valley flatness index 2

% Para la siguiente iteración
CF2=CF3;
MRVBF2=MRVBF3;
end

% %% Aqui comienza la corrección
% % Se suaviza el DEM
% 
% % h = fspecial('gaussian', [3 3], 0.5);
% % DEM_Smooth= imfilter(Dem.Z,h,'replicate');
% 
% % Se suaviza el dem y se le cambia la resolución (numero de celda)
% [X_ori,Y_ori]=meshgrid(1:size(Dem.Z,2),1:size(Dem.Z,1));
% [XI,YI]=meshgrid(1:7:size(Dem.Z,2),1:7:size(Dem.Z,1));
% Filas=size(XI,1); Columnas=size(XI,2);
% DEM_Smooth2 = imresize(Dem.Z,[Filas Columnas],'bilinear');
% %DEM_Smooth2 = interp2(X_ori,Y_ori,Dem.Z,XI,YI);
% Cellsize=Dem.cellsize*7;
% slope= Slope(DEM_Smooth2,Cellsize,2); % 2 en porcentaje, 1 en grados
% slope = interp2(XI,YI,slope,X_ori,Y_ori);
% 
% FD3=TransformadaFuzzy(nlfilter(DEM_Smooth2, [13 13], fun),0.4,3);
% FD3 = interp2(XI,YI,FD3,X_ori,Y_ori);
% FS3=TransformadaFuzzy(slope,4,4);
% CF3=CF2.*FS3;
% PVF3=CF3.*FD3;
% VF3=1-TransformadaFuzzy(PVF3,0.3,4); % valley flatness index 3
% pl=log((3-0.5/0.1)/log(1.5));
% w3=1-TransformadaFuzzy(VF3,0.4,pl);
% MRVBF3=(w3.*(3-1+VF3))+((1-w3).*MRVBF2); % multi resolution valley flatness index 2
% 
% %% Aqui comienza la 2 corrección
% % Se suaviza el DEM
% 
% 
% % Se suaviza el dem y se le cambia la resolución (numero de celda)
% %[X,Y]=meshgrid(1:size(DEM_Smooth,2),1:size(DEM_Smooth,1));
% [XI,YI]=meshgrid(1:13:size(Dem.Z,2),1:13:size(Dem.Z,1));
% Filas=size(XI,1); Columnas=size(XI,2);
% DEM_Smooth3 = imresize(Dem.Z,[Filas Columnas],'bilinear');
% %DEM_Smooth3 = interp2(X,Y,DEM_Smooth,XI,YI);
% Cellsize=Dem.cellsize*13;
% slope= Slope(DEM_Smooth3,Cellsize,2); % 2 en porcentaje, 1 en grados
% slope = interp2(XI,YI,slope,X_ori,Y_ori);
% 
% FD4=TransformadaFuzzy(nlfilter(DEM_Smooth3, [13 13], fun),0.4,3);
% FD4 = interp2(XI,YI,FD4,X_ori,Y_ori);
% FS4=TransformadaFuzzy(slope,2,4);
% CF4=CF3.*FS4;
% PVF4=CF4.*FD4;
% VF4=1-TransformadaFuzzy(PVF4,0.3,4); % valley flatness index 3
% pl=log((4-0.5/0.1)/log(1.5));
% w4=1-TransformadaFuzzy(VF4,0.4,pl);
% MRVBF4=(w4.*(4-1+VF3))+((1-w4).*MRVBF3); % multi resolution valley flatness index 2
% 
% 




% 'MRVBF3'
% fun2 = @(x) nanmean(x(:));
% Dem_slope = nlfilter(Dem.Z,[12 12],fun2);
% slope= Slope(Dem_slope,Dem.cellsize,2);
% % Se calcula el tercer indice valley flatness index
% FS3=TransformadaFuzzy(slope,4,4);
% CF3=CF2.*FS3;
% FD3=TransformadaFuzzy(nlfilter(Dem.Z, [12 12], fun),0.4,3);
% PVF3=CF3.*FD3;
% VF3=1-TransformadaFuzzy(PVF3,0.3,4); % valley flatness index 3
% pl=log((3-0.5/0.1)/log(1.5));
% w3=1-TransformadaFuzzy(VF3,0.4,pl);
% MRVBF3=(w3.*(3-1+VF3))+((1-w3).*MRVBF2); % multi resolution valley flatness index 2
% 
% 'MRVBF4'
% fun2 = @(x) nanmean(x(:));
% Dem_slope = nlfilter(Dem.Z,[24 24],fun2);
% slope= Slope(Dem_slope,Dem.cellsize,2);
% % Se calcula el tercer indice valley flatness index
% FS4=TransformadaFuzzy(slope,2,4);
% CF4=CF3.*FS4;
% FD4=TransformadaFuzzy(nlfilter(Dem.Z, [24 24], fun),0.4,3);
% PVF4=CF4.*FD4;
% VF4=1-TransformadaFuzzy(PVF4,0.3,4); % valley flatness index 3
% pl=log((4-0.5/0.1)/log(1.5));
% w4=1-TransformadaFuzzy(VF4,0.4,pl);
% MRVBF4=(w4.*(4-1+VF4))+((1-w4).*MRVBF3); % multi resolution valley flatness index 2
% 
% 'MRVBF5'
% fun2 = @(x) nanmean(x(:));
% Dem_slope = nlfilter(Dem.Z,[48 48],fun2);
% slope= Slope(Dem_slope,Dem.cellsize,2);
% % Se calcula el tercer indice valley flatness index
% FS5=TransformadaFuzzy(slope,1,4);
% CF5=CF4.*FS5;
% FD5=TransformadaFuzzy(nlfilter(Dem.Z, [48 48], fun),0.4,3);
% PVF5=CF5.*FD5;
% VF5=1-TransformadaFuzzy(PVF5,0.3,4); % valley flatness index 3
% pl=log((5-0.5/0.1)/log(1.5));
% w5=1-TransformadaFuzzy(VF5,0.4,pl);
% MRVBF5=(w5.*(5-1+VF4))+((1-w5).*MRVBF4); % multi resolution valley flatness index 2

% 'MRVBF6'
% fun2 = @(x) nanmean(x(:));
% Dem_slope = nlfilter(Dem.Z,[96 96],fun2);
% slope= Slope(Dem_slope,Dem.cellsize,2);
% % Se calcula el quinto indice valley flatness index
% FS6=TransformadaFuzzy(slope,0.5,4);
% FD6=TransformadaFuzzy(nlfilter(Dem.Z, [96 96], fun),0.4,3);
% PVF6=FS6.*FD6;
% VF6=1-TransformadaFuzzy(PVF6,0.3,4); % valley flatness index 32
% 
% w6=1-TransformadaFuzzy(VF6,0.4,6.68);
% MRVBF6=(w6.*(1+VF6))+((1-w6).*VF5); % multi resolution valley flatness index 5
% 
% % Se calcula el quinto indice valley flatness index
% FS7=TransformadaFuzzy(slope,0.25,4);
% FD7=TransformadaFuzzy(nlfilter(Dem.Z, [192 192], fun),0.4,3);
% PVF7=FS7.*FD7;
% VF7=1-TransformadaFuzzy(PVF7,0.3,4); % valley flatness index 32
% 
% w7=1-TransformadaFuzzy(VF7,0.4,6.68);
% MRVBF7=(w7.*(1+VF7))+((1-w7).*VF6); % multi resolution valley flatness index 6
% 
% % Se calcula el quinto indice valley flatness index
% FS8=TransformadaFuzzy(slope,0.125,4);
% FD8=TransformadaFuzzy(nlfilter(Dem.Z, [384 384], fun),0.4,3);
% PVF8=FS8.*FD8;
% VF8=1-TransformadaFuzzy(PVF8,0.3,4); % valley flatness index 32
% 
% w8=1-TransformadaFuzzy(VF8,0.4,6.68);
% MRVBF8=(w8.*(1+VF8))+((1-w8).*VF7); % multi resolution valley flatness index 7


end

