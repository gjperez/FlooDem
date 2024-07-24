%% Script que modifica el MDT en función de una cartografia base, 
% garantizando que las direcciones de flujo definan la red de drenaje
% definida por la cartografia

%% Este script es una modificación del Burning_Dem, este se distingue en el hecho
% de que solo se modifican aquellas celdas donde la diferencia no sea mayor
% a un factor Epsilon_min

%% Este script es una modificacion del Burning2_Dem, en el cual tiene una nueva restricción
% acerca de la diferencia maxima que puede exister entre dos celdas de red
% de drenaje vecinas, la cual define que aunque la diferencia sea positiva
% es decir esta drenando de aguas arriba a aguas abajo, esta diferencia no
% puede ser mayor a un factor Alpha_min

function [Dem_burn,Contador_Clases,Pos_AAb_Red,Matriz_chequeo]=Burning3_Dem(Dem,Red_Clasificada,NoData,Incisado,Delta_caida,Epsilon_min,Alpha_min)

%% Primero se procede a identificar la red de drejna mas representativa, de la red de la hidrografia
% para esto se emplea el mapa generado por el Script codigo
% Clasificacion_Red2 el cual clasifico la red de la hidrografia,
% identificando con una clase cada red que exista en el mapa.

% Se lee la Red_Clasificada, y se reliza un contador para saber cual es la
% clasificación mas representativa del mapa
aux=1;
for i=1:size(Red_Clasificada,1)
    for j=1:size(Red_Clasificada,2)
        % se realiza un incisado de la red, para ver como cambian los
        % resultados
        if Red_Clasificada(i,j)~=NoData && Red_Clasificada(i,j)~=0
        Dem(i,j)=Dem(i,j)-Incisado;
        end
        if Red_Clasificada(i,j)==NoData || Red_Clasificada(i,j)==0
        else 
        Vector_Contador(aux,1)=Red_Clasificada(i,j);
        aux=aux+1;
        end
    end   
end


% Se organiza el Vector_Contador de mayor a menor
% Vector_Contador=sort(Vector_Contador);
% aux2=1;
% aux3=1;
% Clase=Vector_Contador(1,1);
% 'aqui2'
% size(Vector_Contador,1)
% for ii=1:size(Vector_Contador,1)
%     if Vector_Contador(ii,1)==Clase
% Contador_Clases(aux2,1)=aux3;
% Contador_Clases(aux2,2)=Clase;
% aux3=aux3+1;
%     else
%         aux3=1;
%         aux2=aux2+1;
%         Clase=Vector_Contador(ii,1);
%         Contador_Clases(aux2,1)=aux3;
%         Contador_Clases(aux2,2)=Clase;
%         aux3=aux3+1;
%     end
% end
% %Se busca cual es la clase mas importante en la Red_Clasificada
% Cont_Clase_Principal=max(Contador_Clases(:,1));
% Clase_Principal=Contador_Clases(find(Contador_Clases(:,1)==Cont_Clase_Principal),2);

% Se crea el vector Contador_Clases, de forma mas eficiente
 Max_Rango=nanmax(nanmax(Red_Clasificada));
 Contador_Clases=1:Max_Rango;Contador_Clases=Contador_Clases';
 %Map_Aux=Red_Clasificada; Map_Aux(Map_Aux==Max_Rango)=1;Map_Aux(Map_Aux~=Max_Rango)=0;
 %Sum_Principal=nansum(nansum(Map_Aux));
% Se realiza un for para que realice el Burn en todos los drenaje
Dem_burn=Dem;
Matriz_chequeo=zeros(size(Dem,1),size(Dem,2));
for jjj=1:size(Contador_Clases,1)
    Clase_Principal=Contador_Clases(jjj,1);
% Se busca cual es el punto de mas aguas abajo de la Red_Clasificada, para
% esto se pregunta cual es la cota minima de cada uno de los extremos de la
% red de drenaje, la minima sera el punto de mas aguas abajo de la
% Red_Clasificada
Opcion=2;
if Opcion==1
% Opcion1
Auxiliar_Cotamin=80000;
for i=1:size(Dem,1)
    for j=1:size(Dem,2)
        Cont_aux=0;
        if Red_Clasificada(i,j)==Clase_Principal
            if Red_Clasificada(i-1,j+1)==Clase_Principal 
                Cont_aux=Cont_aux+1;
            end
            if Red_Clasificada(i,j+1)==Clase_Principal  
                Cont_aux=Cont_aux+1;
            end
            if Red_Clasificada(i+1,j+1)==Clase_Principal 
                Cont_aux=Cont_aux+1;
            end
            if Red_Clasificada(i+1,j)==Clase_Principal  
                Cont_aux=Cont_aux+1;
            end
            if Red_Clasificada(i+1,j-1)==Clase_Principal  
                Cont_aux=Cont_aux+1;
            end
            if Red_Clasificada(i,j-1)==Clase_Principal  
                Cont_aux=Cont_aux+1;
            end
            if Red_Clasificada(i-1,j-1)==Clase_Principal  
                Cont_aux=Cont_aux+1;
            end
            if Red_Clasificada(i-1,j)==Clase_Principal  
                Cont_aux=Cont_aux+1; 
            end 
            if Cont_aux==1 && Dem(i,j)<Auxiliar_Cotamin
               Pos_AAb_Red(1,1)=i;
               Pos_AAb_Red(1,2)=j;
               Auxiliar_Cotamin=Dem(i,j);
            end
        end
    end   
end

else % del if Opcion
% Opcion 2 - Se selecciona el pixel con la elevacion menor y que sea de la
% Clasificacion principal
Auxiliar_Cotamin=80000;
for i=1:size(Dem,1)
    for j=1:size(Dem,2)
      if Dem(i,j)<Auxiliar_Cotamin && Red_Clasificada(i,j)==Clase_Principal && Dem(i,j)~=NoData
          Pos_AAb_Red(1,1)=i;
          Pos_AAb_Red(1,2)=j;
          Auxiliar_Cotamin=Dem(i,j);   
      end
    end
end

end  % del if Opcion

%% Se quema el Dem, para esto se empezara desde la posición encontrada en el paso anterior
% puede suceder que tengamos dos caminos para empezar el Burning para esto,
% se evaluara la longitud de cada una de los posibles caminos, el mas corto
% sera aguas abajo y el mas largo sera aguas arriba

% Se empezara suponinedo que solo hay un camino
%Dem_burn=Dem;
Flag1=0;
i_aux=Pos_AAb_Red(1,1);
j_aux=Pos_AAb_Red(1,2);
%Delta_caida=0.01;
% Se crea una matriz de chequeo y se define el Factor minimo de corrección
%Epsilon_min=2; % Diferencias mayores a Epsilon_min metros no se realizara corrección (de aguas abajo a aguas arriba)
%Alpha_min=2; % Diferencias mayores a Epsilon_min metros no se realizara corrección (de aguas arriba a aguas abajo)
%Matriz_chequeo=zeros(size(Dem,1),size(Dem,2));
while Flag1==0
    Contador=0;
            if Red_Clasificada(i_aux-1,j_aux+1)==Clase_Principal && Matriz_chequeo(i_aux-1,j_aux+1)==0
                if Dem_burn(i_aux-1,j_aux+1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux-1,j_aux+1))<Epsilon_min
                    Dem_burn(i_aux-1,j_aux+1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux-1,j_aux+1)=1;
                    else
                    Matriz_chequeo(i_aux-1,j_aux+1)=3;
                    end
                elseif (Dem_burn(i_aux-1,j_aux+1)-Dem_burn(i_aux,j_aux))<Alpha_min;
                    Dem_burn(i_aux-1,j_aux+1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux-1,j_aux+1)=4;
                else
                   Matriz_chequeo(i_aux-1,j_aux+1)=2;
                end
                i_aux=i_aux-1; j_aux=j_aux+1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min,Alpha_min);
            elseif Red_Clasificada(i_aux,j_aux+1)==Clase_Principal  && Matriz_chequeo(i_aux,j_aux+1)==0
                if Dem_burn(i_aux,j_aux+1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux,j_aux+1))<Epsilon_min
                    Dem_burn(i_aux,j_aux+1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux,j_aux+1)=1;
                    else
                    Matriz_chequeo(i_aux,j_aux+1)=3;    
                    end
                elseif (Dem_burn(i_aux,j_aux+1)-Dem_burn(i_aux,j_aux))<Alpha_min;
                    Dem_burn(i_aux,j_aux+1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux,j_aux+1)=4;    
                else
                   Matriz_chequeo(i_aux,j_aux+1)=2;
                end
                i_aux=i_aux; j_aux=j_aux+1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min,Alpha_min);
            elseif Red_Clasificada(i_aux+1,j_aux+1)==Clase_Principal  && Matriz_chequeo(i_aux+1,j_aux+1)==0
                if Dem_burn(i_aux+1,j_aux+1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux+1,j_aux+1))<Epsilon_min
                   Dem_burn(i_aux+1,j_aux+1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux+1,j_aux+1)=1;
                    else
                    Matriz_chequeo(i_aux+1,j_aux+1)=3;    
                    end
                elseif (Dem_burn(i_aux+1,j_aux+1)-Dem_burn(i_aux,j_aux))<Alpha_min;
                    Dem_burn(i_aux+1,j_aux+1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux+1,j_aux+1)=4;    
                else
                   Matriz_chequeo(i_aux+1,j_aux+1)=2;
                end
                i_aux=i_aux+1; j_aux=j_aux+1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min,Alpha_min);
            elseif Red_Clasificada(i_aux+1,j_aux)==Clase_Principal  && Matriz_chequeo(i_aux+1,j_aux)==0
                if Dem_burn(i_aux+1,j_aux)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux+1,j_aux))<Epsilon_min
                   Dem_burn(i_aux+1,j_aux)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux+1,j_aux)=1;
                    else
                    Matriz_chequeo(i_aux+1,j_aux)=3;   
                    end
                elseif (Dem_burn(i_aux+1,j_aux)-Dem_burn(i_aux,j_aux))<Alpha_min;
                    Dem_burn(i_aux+1,j_aux)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux+1,j_aux)=4;    
                else
                   Matriz_chequeo(i_aux+1,j_aux)=2;
                end
                i_aux=i_aux+1; j_aux=j_aux;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min,Alpha_min);
            elseif Red_Clasificada(i_aux+1,j_aux-1)==Clase_Principal  && Matriz_chequeo(i_aux+1,j_aux-1)==0
                if Dem_burn(i_aux+1,j_aux-1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux+1,j_aux-1))<Epsilon_min
                   Dem_burn(i_aux+1,j_aux-1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux+1,j_aux-1)=1;
                    else
                    Matriz_chequeo(i_aux+1,j_aux-1)=3;    
                    end
                elseif (Dem_burn(i_aux+1,j_aux-1)-Dem_burn(i_aux,j_aux))<Alpha_min;
                    Dem_burn(i_aux+1,j_aux-1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux+1,j_aux-1)=4;    
                else
                   Matriz_chequeo(i_aux+1,j_aux-1)=2;
                end
                i_aux=i_aux+1; j_aux=j_aux-1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min,Alpha_min);
            elseif Red_Clasificada(i_aux,j_aux-1)==Clase_Principal  && Matriz_chequeo(i_aux,j_aux-1)==0
                if Dem_burn(i_aux,j_aux-1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux,j_aux-1))<Epsilon_min
                   Dem_burn(i_aux,j_aux-1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux,j_aux-1)=1;
                    else
                    Matriz_chequeo(i_aux,j_aux-1)=3;    
                    end
                elseif (Dem_burn(i_aux,j_aux-1)-Dem_burn(i_aux,j_aux))<Alpha_min;
                    Dem_burn(i_aux,j_aux-1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux,j_aux-1)=4;    
                else
                   Matriz_chequeo(i_aux,j_aux-1)=2;
                end
                i_aux=i_aux; j_aux=j_aux-1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min,Alpha_min);
            elseif Red_Clasificada(i_aux-1,j_aux-1)==Clase_Principal  && Matriz_chequeo(i_aux-1,j_aux-1)==0
                if Dem_burn(i_aux-1,j_aux-1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux-1,j_aux-1))<Epsilon_min
                   Dem_burn(i_aux-1,j_aux-1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux-1,j_aux-1)=1;
                    else
                    Matriz_chequeo(i_aux-1,j_aux-1)=3;    
                    end
                elseif (Dem_burn(i_aux-1,j_aux-1)-Dem_burn(i_aux,j_aux))<Alpha_min;
                    Dem_burn(i_aux-1,j_aux-1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux-1,j_aux-1)=4;    
                else
                   Matriz_chequeo(i_aux-1,j_aux-1)=2;
                end
                i_aux=i_aux-1; j_aux=j_aux-1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min,Alpha_min);
            elseif Red_Clasificada(i_aux-1,j_aux)==Clase_Principal  && Matriz_chequeo(i_aux-1,j_aux)==0
                if Dem_burn(i_aux-1,j_aux)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux-1,j_aux))<Epsilon_min
                   Dem_burn(i_aux-1,j_aux)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux-1,j_aux)=1;
                    else
                    Matriz_chequeo(i_aux-1,j_aux)=3;    
                    end
                elseif (Dem_burn(i_aux-1,j_aux)-Dem_burn(i_aux,j_aux))<Alpha_min;
                    Dem_burn(i_aux-1,j_aux)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux-1,j_aux)=4;    
                else
                   Matriz_chequeo(i_aux-1,j_aux)=2;
                end
                i_aux=i_aux-1; j_aux=j_aux;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min,Alpha_min);
            else
                Flag1=1;
                
            end 
end

end

%%



end