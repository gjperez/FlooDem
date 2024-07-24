%% Función que realiza un histograma multivariado, este se realiza para definir la frecuencia 
% de las zonas de inundación empleando indices morfometricos derivados de
% un MDE. La hipotesis es que los rangos con mayores frecuencias seran
% aquellas zonas donde se presenta mayor probabilidad de inundaciones, esta
% hipotesis se cimenta en la idea de que los descriptores morfometricos
% emplean describen la inundación en algun aspecto, por lo que los
% concordancia de este aspecto en diferentes indices morfometricos puedan
% dar como resultados frecuencias altas para la definición de zonas de
% inundación.

% Los mapas que se emplearan para realizar los analisis son los siguientes
% HAND, slope, distancias a la red, TPI, TI, Densidad de drenaje,
% Acumulacion

% La Matriz de parametros sera la represenatción de cada una de las
% avriables de analisis, cada columna de la matriz representa un indice
% morfometrico.

function[Matriz_Frecuencias_Multivariada]=Distri_Multivariada(Matriz_Multivariada,Matriz_Umbral,HAND,Coor_Y,Coor_X,NoData,Tipo_Clases,Umbral_Clases)

% Se eliminan las celdas que estan por encima de los Umbrales de cada uno
% de los mapas
'PASO 0'
Tamano_inicial=size(Matriz_Multivariada,1);
Vector_aux=zeros(size(Coor_Y,1),1);
for i=Tamano_inicial:-1:1
    Contador=0;
    for j=1:size(Matriz_Multivariada,2)
        if Matriz_Multivariada(i,j)>Matriz_Umbral(1,j)
            Contador=Contador+1;
        end
    end
    Vector_aux(i,1)=Contador;
end
% Analiza solamente el cuadrante que esta en la intercepción de las
% variables de analisis, OPCION_1=1, CUANDO ES OPCIÓN_1=2 ANALIZA por fuera del
% cuadrante y cuando es OPCIÓN_1=3 ANALIZA TODOS LOS DATOS

OPCION=3;

if OPCION==2
   for j=1:size(Matriz_Umbral,2)
    Matriz=Matriz_Multivariada(:,j);
    Matriz(Vector_aux==size(Matriz_Umbral,2))=[];
    Matriz_Multivariada2(:,j)=Matriz;
   end
    Matriz_Multivariada=Matriz_Multivariada2;
    clear Matriz_Multivariada2
    Coor_Y(Vector_aux==size(Matriz_Umbral,2))=[];
    Coor_X(Vector_aux==size(Matriz_Umbral,2))=[]; 
elseif OPCION==1
    for j=1:size(Matriz_Umbral,2)
    Matriz=Matriz_Multivariada(:,j);
    Matriz(Vector_aux>=1)=[];
    Matriz_Multivariada2(:,j)=Matriz;
   end
    Matriz_Multivariada=Matriz_Multivariada2;
    clear Matriz_Multivariada2
    Coor_Y(Vector_aux>=1)=[];
    Coor_X(Vector_aux>=1)=[]; 
else
end

% Nuevo paso, se reclasifica el mapa en función de 3 metodos: 1 metodo,
% desviaciones estandar, 2 metodo por quantiles, 3 por intervalos definidos
% por el usuario, % Ninugun mapa va ser mayor de 3000
for i=1:size(Matriz_Multivariada,2)
    Vector_Analisis=Matriz_Multivariada(:,i);
    Cont=1;
    if Tipo_Clases==1 % Por desviaciones estandar
        Desviacion_Vector=nanstd(Vector_Analisis);
        Desviacion_Vector=Umbral_Clases*Desviacion_Vector;
        for ii=nanmin(Vector_Analisis):Desviacion_Vector:nanmax(Vector_Analisis)
            Vector_Analisis(Vector_Analisis<ii)=3000+Cont;
            Cont=Cont+1;
        end
        Vector_Analisis(Vector_Analisis<3000)=3000+Cont; % Este es para el ultimo ya que no lo toma
    elseif Tipo_Clases==2 % Por cuantiles
        Umbral_Cuantiles=1/Umbral_Clases;
        Cuantiles=0:Umbral_Cuantiles:1;
        Vector_Cuantiles=quantile(Vector_Analisis,Cuantiles);
        for ii=1:size(Vector_Cuantiles,2)
            Vector_Analisis(Vector_Analisis<Vector_Cuantiles(1,ii))=3000+Cont;
            Cont=Cont+1;
        end 
        Vector_Analisis(Vector_Analisis<3000)=3000+Cont; % Este es para el ultimo ya que no lo toma
    elseif Tipo_Clases==3 % Por rangos definidos por el usuario
        Intervalo_Clases=(nanmax(Vector_Analisis)-nanmin(Vector_Analisis))/Umbral_Clases;
        for ii=nanmin(Vector_Analisis):Intervalo_Clases:nanmax(Vector_Analisis)
            Vector_Analisis(Vector_Analisis<ii)=3000+Cont;
            Cont=Cont+1;
        end
        Vector_Analisis(Vector_Analisis<3000)=3000+Cont; % Este es para el ultimo ya que no lo toma
    end
    Matriz_Multivariada(:,i)=Vector_Analisis;
end

% Se estandarizan las variables, las cuales comenzaran desde el valor 1000,
% lo que se pretende es trasladar el rango de valores empleando el punto
% referencia como el minimo de la serie este teendra que ser igual a 1000
% por lo que si queremos que todos los vecttores tengan como valor minimo
% 1000, lo que se tiene que hacer es a cada valor sumarle (1000-Xmin)
'PASO 1'
for j=1:size(Matriz_Multivariada,2)
Matriz_Multivariada(:,j)=(Matriz_Multivariada(:,j)-nanmin(Matriz_Multivariada(:,j)))*1000;
end
%% Esta es la primera alternativa
% for i=1:size(Matriz_Multivariada,1)
%     Cte=num2str(Matriz_Multivariada(i,1));
%   for j=2:size(Matriz_Multivariada,2)
%      Cte2=num2str(Matriz_Multivariada(i,j));
%      Cte=strcat(Cte,Cte2);
%   end
%   Codigo_Matriz_Multivariada(i,1)=str2num(Cte);
% end
%% Esta es la segunda alternativa
'PASO 2'
Codigo_Matriz_Multivariada=0;
for j=1:size(Matriz_Multivariada,2)
Codigo_Matriz_Multivariada=Codigo_Matriz_Multivariada*1000+Matriz_Multivariada(:,j);
end
min(Codigo_Matriz_Multivariada)
max(Codigo_Matriz_Multivariada)
%%
% Se clasifica en grupos, ya que tal y como esta gasta mucho espacio en
% memoria, 64 bits!
Codigo_Matriz_Multivariada=grp2idx(Codigo_Matriz_Multivariada);
min(Codigo_Matriz_Multivariada)
max(Codigo_Matriz_Multivariada)
% Se estiman las frecuencias
Analisis_Frecuencias=tabulate(Codigo_Matriz_Multivariada);

'PASO 3'
% for i=1:size(Codigo_Matriz_Multivariada,1)
%     Frecuencia_Matriz_Multivariada(i,1)=Analisis_Frecuencias(find(Analisis_Frecuencias(:,1)==Codigo_Matriz_Multivariada(i,1)),2); % El 2 es el contador si queremos el % ponemos 3   
% end
% Se aborda en otra perspectiva para que sea mas eficiente ALGO ESTA MAL EN
% ESTE METODO
Frecuencia_Matriz_Multivariada=zeros(size(Codigo_Matriz_Multivariada,1),1);
% for i=1:size(Analisis_Frecuencias,1)
%     Vector_Temp=find(Codigo_Matriz_Multivariada(:,1)==Analisis_Frecuencias(i,1)); 
%     for ii=size(Vector_Temp,1)
%      Frecuencia_Matriz_Multivariada(Vector_Temp(ii,1),1)=Analisis_Frecuencias(i,2); % El 2 es el contador si queremos el % ponemos 3  
%     end
% end
% Otra alternativa
Tamano=size(Analisis_Frecuencias,1);
Frecuencia=Analisis_Frecuencias(:,2); 
Valor=Analisis_Frecuencias(:,1); %Valor(Frecuencia<10)=[];
Porcentaje=Analisis_Frecuencias(:,3);%Porcentaje(Frecuencia<10)=[];
%Frecuencia(Frecuencia<10)=[]; 
Contador_Total=nansum(Frecuencia); Maximo_Frecuencias=nanmax(Frecuencia);
Frecuencia=Frecuencia/Maximo_Frecuencias; % Se estandariza sobre el maximo

Tamano=size(Valor,1);
% for i=Tamano:-1:1
% if Analisis_Frecuencias(i,2)<10
%     Analisis_Frecuencias(i,:)=[];    
% end
% end
'yeah'
size(Valor,1)
for i=1:size(Valor,1)
    Frecuencia_Matriz_Multivariada(Codigo_Matriz_Multivariada==Valor(i,1))=Frecuencia(i,1);
end
    

'PASO 4'
% Se crea la matriz con las frecuencias
Matriz_Frecuencias_Multivariada=zeros(size(HAND,1),size(HAND,2));
for i=1:size(Frecuencia_Matriz_Multivariada,1)
  Matriz_Frecuencias_Multivariada(Coor_Y(i,1),Coor_X(i,1))=Frecuencia_Matriz_Multivariada(i,1);   
end
Matriz_Frecuencias_Multivariada(HAND==NoData)=NoData;


end