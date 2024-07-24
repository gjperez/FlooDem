%% Script que quema EL DEM empleando un buffer en la Red de drenaje, los mapas
% de entrada, son la matriz de Distancias, El Dem, La Red de Drenaje de la
% Cartografia

function[Dem,Matriz_Chequeo_Burn]=Burning_Buffer_Dem(Dem,Red_hidro,Distancias_Red,NoData,Distancia_Buffer,Buffer_Burn,Numero_de_rutas,Delta_Definido1,Delta_Definido2,Delta_Niivel)

% En función del Buffer_Burn se calcula las celdas que haran parte del
% Dem_Burn_Buffer

%% Se realiza el Burn solo en el Buffer, ademas se realiza el Burn empezando por las celdas que estan mas cercanas
% a la red de drenaje es decir la que tienen menos distancia en el mapa de
% Distancias_Red, para esto se organiza la matriz en un vector de menor a
% mayor, se debe tener en cuenta las coordenadas que corresponden estas
% posiciones
Distancias_Red(Distancias_Red>Distancia_Buffer)=NoData;
Distancias_Red(Dem==NoData)=NoData;
% Se crea un vector con las posiciones de cada celda
Cont=1;
for i=1:size(Distancias_Red,1)
    for j=1:size(Distancias_Red,2)
        if Distancias_Red(i,j)~=NoData
       Posicion_Distancias_Red_Vector(Cont,1)=Distancias_Red(i,j);
       Posicion_Distancias_Red_Vector(Cont,2)=i;
       Posicion_Distancias_Red_Vector(Cont,3)=j;
       Cont=Cont+1; 
        end
    end   
end
% Se organiza de menor a mayor y se guarda la posición de cada celda
%Sort_Posicion_Distancias_Red_Vector=sortrows(Posicion_Distancias_Red_Vector);%Desde
%adentro hasta el borde del buffer
Sort_Posicion_Distancias_Red_Vector=sortrows(Posicion_Distancias_Red_Vector,-1); % Desde el borde del buffer hasta adentro



%% Lo que habia en el codigo anterior

%  Distancias_Red(Distancias_Red<=Distancia_Buffer)=1;
%  Distancias_Red(Distancias_Red>Distancia_Buffer)=0;
%  Distancias_Red(Dem==NoData)=NoData;
N_Veces=2;

% Se define la matriz de chequeo, como la matriz de distancias, todo lo que
% tenga el valor de 2 significara que ya realizo el Burning
Matriz_Chequeo_Burn=zeros(size(Distancias_Red,1),size(Distancias_Red,2));
% Se empieza a hacer el recorrida de la matriz, cuando se encuentre en una
% celda del Buffer (celda igual a 1) se aplicara el Burning con caminata
% aleatoria - Codigo anterior
% Se empiezaa realizar por los pixeles que estan mas cerca de la red de
% drenaje
Chequeo_Porcentaje=ceil(size(Sort_Posicion_Distancias_Red_Vector,1)/10);
Chequeo_Porcentaje1=Chequeo_Porcentaje;
for ii=1:size(Sort_Posicion_Distancias_Red_Vector,1)
    if ii==(Chequeo_Porcentaje);
        [num2str((ii/size(Sort_Posicion_Distancias_Red_Vector,1))*100) '%']
        Chequeo_Porcentaje=Chequeo_Porcentaje+Chequeo_Porcentaje1;
    end
    i=Sort_Posicion_Distancias_Red_Vector(ii,2);
    j=Sort_Posicion_Distancias_Red_Vector(ii,3);
        if Matriz_Chequeo_Burn(i,j)==0 && Distancias_Red(i,j)~=NoData && Red_hidro(i,j)~=1 && Dem(i,j)~=NoData
            % Se realiza el Extract del Dem y Red_hidro para la camina
            % Aleatoria, para esto se usara un rectangulo de matriz N_veces
            % el tamaño de celdas en el Buffer (Buffer_Burn)
            Size_rectangulo=N_Veces*Buffer_Burn;
            % Se definen los cuatro limites, izq, der, sup e inferior
            Lim_sup=max(i-Size_rectangulo,1);
            Lim_inf=min(i+Size_rectangulo,size(Dem,1));
            Lim_izq=max(j-Size_rectangulo,1);
            Lim_der=min(j+Size_rectangulo,size(Dem,2));
            Dem_Extract=Dem(Lim_sup:Lim_inf,Lim_izq:Lim_der);
            Red_Extract=Red_hidro(Lim_sup:Lim_inf,Lim_izq:Lim_der);
            Distancias_Red_Extract=Distancias_Red(Lim_sup:Lim_inf,Lim_izq:Lim_der);
            Matriz_Chequeo_Burn_Extract=Matriz_Chequeo_Burn(Lim_sup:Lim_inf,Lim_izq:Lim_der);
            % Se aplica el Burn con la caminara Aleatoria
            i_analisis=max(i-Lim_sup+1,1);
            j_analisis=max(j-Lim_izq+1,1);
            [Nuevo_Dem,Matriz_Chequeo_Burn_Extract_N,Red_Extract_N]=Caminata_Aleatoria(Dem_Extract,Red_Extract,Distancias_Red_Extract,Matriz_Chequeo_Burn_Extract,NoData,Numero_de_rutas,i_analisis,j_analisis,Delta_Definido1,Delta_Definido2,Delta_Niivel);
            % Se escriben los resultados en la matriz de Dem y Matriz_Chequeo_Burn
            Red_hidro(Lim_sup:Lim_inf,Lim_izq:Lim_der)=Red_Extract_N; % Las zonas que ya se quemaron se trabajara como red de drenaje para que cuando realice el Burn y encuentre esto pare la busqueda
            Dem(Lim_sup:Lim_inf,Lim_izq:Lim_der)=Nuevo_Dem;
            Matriz_Chequeo_Burn(Lim_sup:Lim_inf,Lim_izq:Lim_der)=Matriz_Chequeo_Burn_Extract_N;
        end       
end


end