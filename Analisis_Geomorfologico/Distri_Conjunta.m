%% Función que crea un grafico, de una distribución conjunta de dos series
function[]=Distri_Conjunta(Serie_X,Serie_Y,Umbral_X,Umbral_Y,Rango_X,Rango_Y,Titulo,Etiqueta1,Etiqueta2,Ruta_Guardado)
% Se definen los intervalos en los que se desean observar los datos, 
% tanto en eje x como en eje y
%Rango_X=50;
%Rango_Y=50;
% Etiqueta1='EjeX';
% Etiqueta2='EjeY';
% Titulo='Titulo';


% Para cada serie se crea un vector de la misma longitud que la serie, el
% cual tendra como valor la localización en el intervalo definido
Valor_min_X=nanmin(Serie_X);
Valor_max_X=nanmax(Serie_X);
Valor_min_Y=nanmin(Serie_Y);
Valor_max_Y=nanmax(Serie_Y);

% se estandariza la serie con los valores maximos, y luego se redondean los
% resultados, estas series estandarizadas se emplearan como coordenadas,
% para crear la matriz conjunta, de las dos series
Serie_X_Estan=(((Serie_X/((Valor_max_X-Valor_min_X)))*Rango_X));
Serie_Y_Estan=(((Serie_Y/((Valor_max_Y-Valor_min_Y)))*Rango_Y));
Serie_X_Estan=ceil(Serie_X_Estan-nanmin(Serie_X_Estan)); Serie_X_Estan(Serie_X_Estan==0)=1; Serie_X_Estan(Serie_X_Estan>=Rango_X)=Rango_X;
Serie_Y_Estan=ceil(Serie_Y_Estan-nanmin(Serie_Y_Estan)); Serie_Y_Estan(Serie_Y_Estan==0)=1; Serie_Y_Estan(Serie_Y_Estan>=Rango_Y)=Rango_Y;

% Se crea matriz conjunta
Matriz_Conjunta=zeros(Rango_Y,Rango_X);
for i=1:size(Serie_X_Estan,1)
  Matriz_Conjunta(Serie_Y_Estan(i,1),Serie_X_Estan(i,1))=Matriz_Conjunta(Serie_Y_Estan(i,1),Serie_X_Estan(i,1))+1;   
end

% Se crean los vectores X y Y para graficar los ejes
for i=1:Rango_X
Vector_EjeX(i,1)=min(Serie_X)+((max(Serie_X)-min(Serie_X))/Rango_X)*i;
end
for i=1:Rango_Y
Vector_EjeY(i,1)=min(Serie_Y)+((max(Serie_Y)-min(Serie_Y))/Rango_Y)*i;
end

% Se crea una matriz conjunta, en donde no se tienen en cuenta las
% combinaciones de los pares producto de los umbrales definidos
Vector_EjeX_Delete=zeros(size(Vector_EjeX,1),1);
Vector_EjeX_Delete(Vector_EjeX>Umbral_X)=1;
Vector_EjeY_Delete=zeros(size(Vector_EjeY,1),1);
Vector_EjeY_Delete(Vector_EjeY>Umbral_Y)=1;
Matriz_Conjunta_Delete=Matriz_Conjunta;
for i=1:size(Matriz_Conjunta_Delete,1)
    for j=1:size(Matriz_Conjunta_Delete,2)
        if Vector_EjeX_Delete(j,1)==1 && Vector_EjeY_Delete(i,1)==1
        Matriz_Conjunta_Delete(i,j)=0;
        end
    end  
end

% Se crea una matriz con la densidad de probabilidad empirica de la
% distribución
% Frecuencia_Total=nansum(nansum(Matriz_Conjunta_Delete));
%  Frecuencia_Total=1;
% Matriz_Densidad=zeros(size(HAND,1),size(HAND,2));
% for i=1:size(Serie_X_Estan,1)
%   Matriz_Densidad(Coor_Y(i,1),Coor_X(i,1))=Matriz_Conjunta_Delete(Serie_Y_Estan(i,1),Serie_X_Estan(i,1));   
% end
% Matriz_Densidad=Matriz_Densidad./Frecuencia_Total;
% Matriz_Densidad(HAND==NoData)=NoData;
% 
% % Las frecuencias se pasan a escala logaritmica para que se visualice mejor
% %Matriz_Conjunta=(Matriz_Conjunta);
 Matriz_Conjunta_Delete=log(Matriz_Conjunta_Delete);

% Se dibuja la distribución
scrz=get(0,'screensize');
figura=figure('position',[100 100 scrz(3)/1.8 scrz(4)/2]);
set(gcf,'color','white')
Titulo2=['Ln(FRECUENCIAS): ' Titulo];
pcolor(Vector_EjeX,Vector_EjeY,Matriz_Conjunta_Delete),title(Titulo2,'fontsize',16,'fontweight','bold'), xlabel(Etiqueta1,'fontsize',14,'fontweight','bold'), ylabel(Etiqueta2,'fontsize',14,'fontweight','bold'), hold on
colormap(sortrows(jet,3));
colormap(jet);
colorbar('location','EastOutside');
rutaAF=[Ruta_Guardado  char(Titulo) '.png'];
grafico=getframe(figura);
%imwrite(grafico.cdata,rutaAF);
saveas(figura,rutaAF)
close



end

