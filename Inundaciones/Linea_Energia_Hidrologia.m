%% Funcion que calcula la liena de energia, empelando las estaciones de NIvel
% Datos de entrada mapas de estaciones, DEM, Direcciones, Red, de drenaje

function [Linea_Energia] = Linea_Energia_Hidrologia(Dem,Direccion,Red,Estaciones,nodata,Tama_Celda)
%% Datos de entrada, se debe elimiar esto!!
% rutaEscrituraLineaEnergia_Hidro='D:\Ensayo_Linea_de_Energia\Patia\';
% La matriz de Linea de Enegria sera la misma de Estaciones
%% Se cambia la notacion del flujo, ya que esta en ArcGis
for i=1:size(Red,1)
    for j=1:size(Red,2)
        % Se cambia el valor de la direccion de drenaje de ArcGis a
        % MapWindows
        if Direccion(i,j)==8
          Direccion(i,j)=1;
        elseif Direccion(i,j)==4
           Direccion(i,j)=2;
        elseif Direccion(i,j)==2
           Direccion(i,j)=3;
        elseif Direccion(i,j)==1
           Direccion(i,j)=6;
        elseif Direccion(i,j)==128
           Direccion(i,j)=9;
        elseif Direccion(i,j)==64
           Direccion(i,j)=8;
        elseif Direccion(i,j)==32
           Direccion(i,j)=7;
        elseif Direccion(i,j)==16
           Direccion(i,j)=4;
        end
    end
end
%% Se leen las estaciones, se obtiene la fila, columna y su Valor
cont=0;
pendiente=1/1000; % Esta es la pendiente asignada
for i=1:size(Estaciones,1)
    for j=1:size(Estaciones,2)
        if Estaciones(i,j)~=nodata
            cont=cont+1;
            %Estaciones(i,j)=Estaciones(i,j)/1000; %%% Cuando se multiplican las estaciones por 1000
            VectorEstaciones(cont,1)=i; %Fila
            VectorEstaciones(cont,2)=j; %Columna
            VectorEstaciones(cont,3)=Estaciones(i,j); %Columna
        end 
    end  
end
% se organiza de menor a mayor los niveles
Sort_VectorEstaciones(:,3)=sort(VectorEstaciones(:,3),'descend');
for i=1:size(VectorEstaciones,1)
    Sort_VectorEstaciones(i,1)=VectorEstaciones(find(VectorEstaciones(:,3)==Sort_VectorEstaciones(i,3),1),1);
    Sort_VectorEstaciones(i,2)=VectorEstaciones(find(VectorEstaciones(:,3)==Sort_VectorEstaciones(i,3),1),2);
end

%% Etapa 1 Interpolación
% Se empieza a generar la linea de energia con la estacion con menor nivel
Flag1=0;
% se encuentra la pos de la estacion
i_aux=Sort_VectorEstaciones(end,1);
j_aux=Sort_VectorEstaciones(end,2);
while Flag1==0
    % Se calcula la celda a la que drena
    j_next=j_aux+(mod(Direccion(i_aux,j_aux)-1,3))-1;
    i_next=i_aux-(ceil((Direccion(i_aux,j_aux))/3))+2;
    if Red(i_next,j_next)==1 && Estaciones(i_next,j_next)==nodata
        if Direccion(i_next,j_next)==4 || Direccion(i_next,j_next)==8 || Direccion(i_next,j_next)==6 || Direccion(i_next,j_next)==2
        %Estaciones(i_next,j_next)=Estaciones(i_aux,j_aux)-(Tama_Celda*(pendiente)); Flag1=0;
        Estaciones(i_next,j_next)=Estaciones(i_aux,j_aux)+(Dem(i_next,j_next)-Dem(i_aux,j_aux)); Flag1=0;
        else
        %Estaciones(i_next,j_next)=Estaciones(i_aux,j_aux)-((Tama_Celda+Tama_Celda)^0.5*(pendiente)); Flag1=0;
        Estaciones(i_next,j_next)=Estaciones(i_aux,j_aux)+(Dem(i_next,j_next)-Dem(i_aux,j_aux)); Flag1=0;
        end
        if Estaciones(i_next,j_next)<=0
           Estaciones(i_next,j_next)=0;
        end
        if Estaciones(i_next,j_next)<=Dem(i_next,j_next)
           Estaciones(i_next,j_next)=Dem(i_next,j_next);
        end
    else
         Flag1=1; % Se salio del mapa que se salga del ciclo
    end
    j_aux=j_next;
    i_aux=i_next;
end
 'YEAHHHH 1'
%% Etapa 2 Interpolación
% Se empieza interpolar entre estaciones, se empieza desde la estacion con
% mayor cota
for i=1:size(Sort_VectorEstaciones,1)-1
Flag1=0;  % Bandera que sirve para encontrar la distancia entre las dos estaciones
Flag2=0;  % Bandera que sirve para que diga cuando termian se interpolar
% se encuentra la pos de la estacion
i_aux=Sort_VectorEstaciones(i,1);
j_aux=Sort_VectorEstaciones(i,2);
Auxiliar_Estacion_Inicial=Estaciones(i_aux,j_aux);
Dem_aux=Dem(i_aux,j_aux);
Distancia1=0;
Distancia2=0;

while Flag1==0
% Se busca la distancia entre las estaciones para interpolar, para esto se
% va arealizar un contador de celdas que pasa, y con el numero de celdas se
% obtiene la distnacia a la que se encuentra, para esto se diferenciara en
% un contador para las celdas con distancia de 30 y otro para las
% distancias de (30 + 30)^0.5, para esto se necesita el mapa de direcciones

% Se calcula la celda a la que drena
    j_next=j_aux+(mod(Direccion(i_aux,j_aux)-1,3))-1;
    i_next=i_aux-(ceil((Direccion(i_aux,j_aux))/3))+2;
    if Red(i_next,j_next)==1 && Estaciones(i_next,j_next)==nodata
        if Direccion(i_next,j_next)==4 || Direccion(i_next,j_next)==8 || Direccion(i_next,j_next)==6 || Direccion(i_next,j_next)==2
        Distancia1=Distancia1+1; Flag1=0;
        elseif  Direccion(i_next,j_next)==7 || Direccion(i_next,j_next)==9 || Direccion(i_next,j_next)==1 || Direccion(i_next,j_next)==3
        Distancia2=Distancia2+1; Flag1=0;    
        end
    elseif Red(i_next,j_next)==nodata
        'Paso'
        Auxiliar_Estacion_Final=Dem(i_aux,j_aux)+Estaciones(Sort_VectorEstaciones(i,1),Sort_VectorEstaciones(i,2))-Dem(Sort_VectorEstaciones(i,1),Sort_VectorEstaciones(i,2));
        Dem_aux_Final=Dem(i_aux,j_aux);
        Flag1=1;  % LLega a un valor con nivel para interpolar
    else
        Auxiliar_Estacion_Final=Estaciones(i_next,j_next);
        Dem_aux_Final=Dem(i_next,j_next);
        Flag1=1;  % LLega a un valor con nivel para interpolar
    end
    j_aux=j_next;
    i_aux=i_next;
end
Distancia_Total=(Distancia1*Tama_Celda)+(Distancia2*((Tama_Celda^2+Tama_Celda^2)^0.5));
pendiente=((Auxiliar_Estacion_Inicial-Dem_aux)-(Auxiliar_Estacion_Final-Dem_aux_Final))/Distancia_Total;

% Se empieza a interpolar entre los valores
i_aux=Sort_VectorEstaciones(i,1);
j_aux=Sort_VectorEstaciones(i,2);
while Flag2==0
 % Se calcula la celda a la que drena
    j_next=j_aux+(mod(Direccion(i_aux,j_aux)-1,3))-1;
    i_next=i_aux-(ceil((Direccion(i_aux,j_aux))/3))+2;
    if Red(i_next,j_next)==1 && Estaciones(i_next,j_next)==nodata
        if Direccion(i_next,j_next)==4 || Direccion(i_next,j_next)==8 || Direccion(i_next,j_next)==6 || Direccion(i_next,j_next)==2
        Estaciones(i_next,j_next)=Estaciones(i_aux,j_aux)-Dem(i_aux,j_aux)-(Tama_Celda*(pendiente))+Dem(i_next,j_next); Flag2=0;
        else
        Estaciones(i_next,j_next)=Estaciones(i_aux,j_aux)-Dem(i_aux,j_aux)-(((Tama_Celda^2+Tama_Celda^2)^0.5)*pendiente)+Dem(i_next,j_next); Flag2=0;   
        end
        if Estaciones(i_next,j_next)<=0
           Estaciones(i_next,j_next)=0;
        end
        if Estaciones(i_next,j_next)<=Dem(i_next,j_next)
           Estaciones(i_next,j_next)=Dem(i_next,j_next);
        end
    else
         Flag2=1; % Se salio del mapa que se salga del ciclo   
    end   
    j_aux=j_next;
    i_aux=i_next;
end
end
'YEAHHHH 1'
%% Etapa 3 Interpolacion
% se interpola en las partes donde no hay estaciones, para esto se recorre
% la matriz preguntando donde hay Linea de energia, (mapa de esatciones) y
% si se obtiene algun vecino sin Linea de energia se interpola
contador=0;
Auxiliar1=1; 
while Auxiliar1~=0
    contador=contador+1;
    contador
    if contador==60
        break
    end
    Auxiliar1=0;
for j=1:size(Estaciones,2)
    for i=1:size(Estaciones,1)
        if Red(i,j)==1 && Estaciones(i,j)~=nodata
            Flag1=0;
            Auxiliar=0;
            while Flag1==0
            if Red(i+1,j-1)==1 && Estaciones(i+1,j-1)==nodata && Direccion(i+1,j-1)==9
                %Estaciones(i+1,j-1)=Estaciones(i,j)+((Tama_Celda^2+Tama_Celda^2)^0.5)*(1/1000);Flag1=0;
                Estaciones(i+1,j-1)=Estaciones(i,j)+(Dem(i+1,j-1)-Dem(i,j)); Flag1=0;
                i_next=i+1;
                j_next=j-1;
                Auxiliar=Auxiliar+1;
                Estaciones=Interpolacion3(Estaciones,Red,Direccion,Dem,nodata,i_next,j_next,0);
                Auxiliar1=Auxiliar1+1;
            end
            if Red(i+1,j+1)==1 && Estaciones(i+1,j+1)==nodata && Direccion(i+1,j+1)==7
                %Estaciones(i+1,j+1)=Estaciones(i,j)+((Tama_Celda^2+Tama_Celda^2)^0.5)*(1/1000);Flag1=0;
                Estaciones(i+1,j+1)=Estaciones(i,j)+(Dem(i+1,j+1)-Dem(i,j)); Flag1=0;
                i_next=i+1;
                j_next=j+1;
                Auxiliar=Auxiliar+1;
                Estaciones=Interpolacion3(Estaciones,Red,Direccion,Dem,nodata,i_next,j_next,0);
                Auxiliar1=Auxiliar1+1;
            end
            if Red(i-1,j+1)==1 && Estaciones(i-1,j+1)==nodata && Direccion(i-1,j+1)==1
                %Estaciones(i-1,j+1)=Estaciones(i,j)+((Tama_Celda^2+Tama_Celda^2)^0.5)*(1/1000);Flag1=0;
                Estaciones(i-1,j+1)=Estaciones(i,j)+(Dem(i-1,j+1)-Dem(i,j)); Flag1=0;
                i_next=i-1;
                j_next=j+1;
                Auxiliar=Auxiliar+1;
                Estaciones=Interpolacion3(Estaciones,Red,Direccion,Dem,nodata,i_next,j_next,0);
                Auxiliar1=Auxiliar1+1;
            end
            if Red(i-1,j-1)==1 && Estaciones(i-1,j-1)==nodata && Direccion(i-1,j-1)==3
                %Estaciones(i-1,j-1)=Estaciones(i,j)+((Tama_Celda^2+Tama_Celda^2)^0.5)*(1/1000);Flag1=0;
                Estaciones(i-1,j-1)=Estaciones(i,j)+(Dem(i-1,j-1)-Dem(i,j)); Flag1=0;
                i_next=i-1;
                j_next=j-1;
                Auxiliar=Auxiliar+1;
                Estaciones=Interpolacion3(Estaciones,Red,Direccion,Dem,nodata,i_next,j_next,0);
                Auxiliar1=Auxiliar1+1;
            end
           if Red(i+1,j)==1 && Estaciones(i+1,j)==nodata && Direccion(i+1,j)==8
                %Estaciones(i+1,j)=Estaciones(i,j)+(Tama_Celda)*(1/1000);Flag1=0;
                Estaciones(i+1,j)=Estaciones(i,j)+(Dem(i+1,j)-Dem(i,j)); Flag1=0;
                i_next=i+1;
                j_next=j;
                Auxiliar=Auxiliar+1;
                Estaciones=Interpolacion3(Estaciones,Red,Direccion,Dem,nodata,i_next,j_next,0);
                Auxiliar1=Auxiliar1+1;
           end
            if Red(i,j+1)==1 && Estaciones(i,j+1)==nodata && Direccion(i,j+1)==4
                %Estaciones(i,j+1)=Estaciones(i,j)+(Tama_Celda)*(1/1000);Flag1=0;
                Estaciones(i,j+1)=Estaciones(i,j)+(Dem(i,j+1)-Dem(i,j)); Flag1=0;
                i_next=i;
                j_next=j+1;
                Auxiliar=Auxiliar+1;
                Estaciones=Interpolacion3(Estaciones,Red,Direccion,Dem,nodata,i_next,j_next,0);
                Auxiliar1=Auxiliar1+1;
            end
            if Red(i-1,j)==1 && Estaciones(i-1,j)==nodata && Direccion(i-1,j)==2
                %Estaciones(i-1,j)=Estaciones(i,j)+(Tama_Celda)*(1/1000);Flag1=0;
                Estaciones(i-1,j)=Estaciones(i,j)+(Dem(i-1,j)-Dem(i,j)); Flag1=0;
                i_next=i-1;
                j_next=j;
                Auxiliar=Auxiliar+1;
                Estaciones=Interpolacion3(Estaciones,Red,Direccion,Dem,nodata,i_next,j_next,0);
                Auxiliar1=Auxiliar1+1;
            end
            if Red(i,j-1)==1 && Estaciones(i,j-1)==nodata && Direccion(i,j-1)==6
                %Estaciones(i,j-1)=Estaciones(i,j)+(Tama_Celda)*(1/1000);Flag1=0;
                Estaciones(i,j-1)=Estaciones(i,j)+(Dem(i,j-1)-Dem(i,j)); Flag1=0;
                i_next=i;
                j_next=j-1;
                Auxiliar=Auxiliar+1;
                Estaciones=Interpolacion3(Estaciones,Red,Direccion,Dem,nodata,i_next,j_next,0);
                Auxiliar1=Auxiliar1+1;
            end
            if Auxiliar==0
                Flag1=1;
                i_next=i;
                j_next=j; 
            end
             i=i_next;
             j=j_next;
             Auxiliar=0;
            end
        end
    end
end
end
'YEAHHHH 1'
Linea_Energia=Estaciones;


%% end que termina el codigo
end







