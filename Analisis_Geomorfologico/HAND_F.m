%% Codigo que realiza el mapa de Hand. Los mapas de entrada son: Mapa del DEM,
% Mapa de direcciones (se debe definir la abndera 1 notacion Arcgis, 0
% Notacion MapWindows), Mapa de la red de drenaje, Estos mapas deben tener
% el mismo numero de filas y columnas para correr, ademas se debe definir
% en el encabezado el valor de NoData

function [Hand] = HAND_F(Dem,Direccion,Red,arcgis,nodata)
Dem(isnan(Dem)==1)=nodata;Red(isnan(Red)==1)=nodata;Direccion(isnan(Direccion)==1)=nodata;

%% Se crea la matriz de Hand, I y J
Hand=zeros(size(Red,1),size(Red,2));
MatrizI=zeros(size(Red,1),size(Red,2));
MatrizJ=zeros(size(Red,1),size(Red,2));

%% Se recorre toda la matriz para calcular la Matriz I y J,-2 no drena a
%% ninguna red, -1 es celda de red de drenaje
if arcgis==1
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
        else
           Direccion(i,j)=nodata; 
        end
    end
end
else
end
   
for i=1:size(Red,1)

    for j=1:size(Red,2)
     j
        Flag1=0;
        i_aux=i;
        j_aux=j;
        while Flag1==0
            if Red(i_aux,j_aux)==1
                Flag1=1; MatrizI(i,j)=-1; MatrizJ(i,j)=-1; 
            elseif Dem(i_aux,j_aux)==nodata
                Flag1=1; MatrizI(i,j)=-2; MatrizJ(i,j)=-2;
            elseif Direccion(i_aux,j_aux)==nodata
                Flag1=1; MatrizI(i,j)=-2; MatrizJ(i,j)=-2;    
            else
            % Se calcula la celda a la que drena, y se chequea que no se
            % salga del mapa
            j_next=j_aux+(mod(Direccion(i_aux,j_aux)-1,3))-1;
            i_next=i_aux-(ceil((Direccion(i_aux,j_aux))/3))+2;
            if (Direccion(i_aux,j_aux)+Direccion(i_next,j_next))==10
                Flag1=1; MatrizI(i,j)=-2; MatrizJ(i,j)=-2;
            end
            if i_next>size(Red,1)
                 Flag1=1; MatrizI(i,j)=-2; MatrizJ(i,j)=-2;
            elseif i_next<1
                 Flag1=1; MatrizI(i,j)=-2; MatrizJ(i,j)=-2;
            elseif j_next>size(Red,2)
                 Flag1=1; MatrizI(i,j)=-2; MatrizJ(i,j)=-2;
            elseif j_next<1
                 Flag1=1; MatrizI(i,j)=-2; MatrizJ(i,j)=-2;
            elseif Direccion(i_next,j_next)==nodata
                 Flag1=1; MatrizI(i,j)=-2; MatrizJ(i,j)=-2;
            %elseif Red(i_next,j_next)==nodata
                 %Flag1=1; MatrizI(i,j)=-2; MatrizJ(i,j)=-2;     
            elseif Red(i_next,j_next)==1
                 Flag1=1; MatrizI(i,j)=i_next; MatrizJ(i,j)=j_next;
            else
                i_aux=i_next;
                j_aux=j_next;
            end
            end
        end
    end
end

%% Se crea ahora la matriz de Hand
                 
 for i=1:size(Red,1)
    for j=1:size(Red,2)
        if MatrizI(i,j)==-2
            Hand(i,j)=nodata;
        elseif MatrizI(i,j)==-1
            Hand(i,j)=0;
        elseif Dem(i,j)==nodata
            Hand(i,j)=nodata;   
        else
            Hand(i,j)=Dem(i,j)-Dem(MatrizI(i,j),MatrizJ(i,j));
        end
    end
 end
 
end