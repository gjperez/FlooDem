%% Corrección 2_ Caminata Aleatoria
%% Funcion que obtiene los diferentes caminos de un punto A a un punto B, en función de una caminata
% aleatorio
function [Nuevo_Dem,Matriz_Burn] = Caminata_Aleatoria_Cor(Dem_Extract,Red_Extract,Matriz_Chequeo_Burn_Extract,NoData,Numero_de_rutas,i_analisis,j_analisis)
%load('Red_Extract.mat')
%load('Dem_Extract.mat')

% Se debe tener en cuenta el valor de NoData, para que la ruta no pase por
% esas celdas
% Se define una mtriz de chequeo, esta nos dira por donde ya ha pasado el
% camino, para no volver a pasar por el, sera de 0 y 1
Matriz_Chequeo=Matriz_Chequeo_Burn_Extract;
% Se define el comienzo de la celda origen
%i_analisis=2;
%j_analisis=2;
Matriz_Chequeo(i_analisis,j_analisis)=1;
Flag3=0;
Flag1=0;
i=i_analisis;
j=j_analisis;

for ii=1:Numero_de_rutas
    Flag3=0;
while Flag3==0
    Flag1=0;
    cont1=0;
    Matriz_Chequeo2=zeros(size(Dem_Extract,1),size(Dem_Extract,2));
    Matriz_Chequeo(i_analisis,j_analisis)=1;
    Matriz_Chequeo2(i_analisis,j_analisis)=1;
    i=i_analisis;
    j=j_analisis;
while Flag1==0
    % Se genera un numero aleatorio de 1 a 9, para garantizar la direccion
    % del flujo
    Num_Alea=round(random('unif',0.5,9.49));
    Flag2=0;
    i_aux=i;
    j_aux=j;
    while Flag2==0 % Bandera para quitar el numero aleatorio 5, ya que no representa nada
        if Num_Alea==5
          Num_Alea=round(random('unif',0.5,9.49));
        elseif Num_Alea~=5
            Flag2=1;
        end
    end
    j_next=j_aux+(mod(Num_Alea-1,3))-1;
    i_next=i_aux-(ceil((Num_Alea)/3))+2;
    % Se realizan las restricciones de que la siguiente posición no halla
    % pasado y que no se salga del mapa
    if i_next>0 && i_next<=size(Dem_Extract,1) && j_next>0 && j_next<=size(Dem_Extract,2) && Dem_Extract(i_next,j_next)~=NoData && Matriz_Chequeo2(i_next,j_next)==0
        Matriz_Chequeo(i_next,j_next)=1;
        Matriz_Chequeo2(i_next,j_next)=1;
        i=i_next;
        j=j_next;
        cont1=cont1+1;
        % Se almacena los resultados en un vector
        Vector_Ruta_pos_i(cont1,ii)=i;
        Vector_Ruta_pos_j(cont1,ii)=j;
        if Red_Extract(i,j)==1
            Flag1=1;
        end
    else
      Flag1=1; 
    end
end   % While Flag1
    
if Red_Extract(i,j)==1
      Flag3=1;
end           
end % While Flag3
end


Error_min=inf; 
for iii=1:size(Vector_Ruta_pos_i,2)   %% aqui estaba numero de rutas
%% Se definen las rutas encontradas , en vectores de posición para cada uno, se realizara primero para la primera ruta
% encontrada, y despues se generalizara para las demas rutas encontradas
% El vector tendra n-1 filas, ya que se necesitan definir pares Actual y
% Vecino, para definir la función objetivo
Vector1_Ruta_pos_i=Vector_Ruta_pos_i(:,iii);
Vector1_Ruta_pos_j=Vector_Ruta_pos_j(:,iii);
% Se extraen los 0 del vector si es que existen
Vector1_Ruta_pos_i(Vector1_Ruta_pos_i==0)=[];
Vector1_Ruta_pos_j(Vector1_Ruta_pos_j==0)=[];
% Se define la posición en forma vectorial, a esta pos se le debe elminar
% una fila
if numel(Vector1_Ruta_pos_i)==0
    continue
else
end   
for i=1:size(Vector1_Ruta_pos_i,1)
Pos_Actual(i,1)=(Vector1_Ruta_pos_j(i)*size(Dem_Extract,1))-(size(Dem_Extract,1)-Vector1_Ruta_pos_i(i));
Pos_Pixel_analisis=(j_analisis*size(Dem_Extract,1))-(size(Dem_Extract,1)-i_analisis);
end
Pos_Dem_Actual=Pos_Actual;
Pos_Dem_Siguiente=Pos_Actual;
if size(Pos_Dem_Actual,1)==1
Pos_Dem_Actual=Pos_Pixel_analisis;
else
Pos_Dem_Actual(end)=[];
Pos_Dem_Siguiente(1)=[];
end


% Con estas posiciones se definen los vectores con los valores del Dem
for i=1:size(Pos_Dem_Actual,1)
    Valor_Pos_Dem_Actual(i,1)=Dem_Extract(Pos_Dem_Actual(i,1));
    Valor_Pos_Dem_Siguiente(i,1)=Dem_Extract(Pos_Dem_Siguiente(i,1));
end

% Se genera la corrección del Dem, garantizando que la celda ala que drena
% sea menor o igual, solo se cambiaran los valores con Delta_definido, se
% empieza de aguas abajo a aguas arriba
N_Valor_Pos_Dem_Actual=Valor_Pos_Dem_Actual;
N_Valor_Pos_Dem_Siguiente=Valor_Pos_Dem_Siguiente;
Delta_Definido1=100;
Delta_Definido2=5;
Delta_Niivel=0.5;
Diferencias=Valor_Pos_Dem_Actual-Valor_Pos_Dem_Siguiente;
% Se chequea que el ultimo  pixel si sea Red de Drenaje
%if Red_Extract(Pos_Dem_Siguiente(end))==1
for i=1:size(Valor_Pos_Dem_Siguiente,1)
    if Diferencias(end-i+1)<0 && Diferencias(end-i+1)>-Delta_Definido1 && i~=size(N_Valor_Pos_Dem_Siguiente,1)
      N_Valor_Pos_Dem_Actual(end-i+1)=N_Valor_Pos_Dem_Siguiente(end-i+1)+Delta_Niivel;
      N_Valor_Pos_Dem_Siguiente(end-i)=N_Valor_Pos_Dem_Actual(end-i+1);
      Diferencias=N_Valor_Pos_Dem_Actual-N_Valor_Pos_Dem_Siguiente;
    elseif Diferencias(end-i+1)>0 && Diferencias(end-i+1)>Delta_Definido2 && i~=size(N_Valor_Pos_Dem_Siguiente,1)
      N_Valor_Pos_Dem_Actual(end-i+1)=N_Valor_Pos_Dem_Siguiente(end-i+1)+Delta_Niivel;
      N_Valor_Pos_Dem_Siguiente(end-i)=N_Valor_Pos_Dem_Actual(end-i+1);
      Diferencias=N_Valor_Pos_Dem_Actual-N_Valor_Pos_Dem_Siguiente;  
%     elseif Diferencias(end-i+1)<0 && Diferencias(end-i+1)>-Delta_Definido1 && i==size(N_Valor_Pos_Dem_Siguiente,1)
%       N_Valor_Pos_Dem_Actual(end-i+1)=N_Valor_Pos_Dem_Siguiente(end-i+1)+Delta_Niivel;    
    end
end
%else
%    'Error'
%end

% Se calcula el error, entre EL dem Original y el dem Nuevo
Error(iii,1)=sum(abs(Valor_Pos_Dem_Actual-N_Valor_Pos_Dem_Actual));
if Error(iii,1)<Error_min
    Error_min=Error(iii,1);
    clear 'Matriz_Resultado'
    Matriz_Resultado=[Pos_Dem_Actual Pos_Dem_Siguiente Valor_Pos_Dem_Actual Valor_Pos_Dem_Siguiente N_Valor_Pos_Dem_Actual N_Valor_Pos_Dem_Siguiente];
end
clear 'Valor_Pos_Dem_Actual' 'Valor_Pos_Dem_Siguiente' 'Pos_Actual' ''

end

% Se escriben los resultados en el nuevo DEM,Se escriben los resultados de las celdas donde ya se realizo el Burn
Nuevo_Dem=Dem_Extract;
N_Valor_Pos_Dem_Actual=Matriz_Resultado(:,5);
Pos_Dem_Actual=Matriz_Resultado(:,1);
%Matriz_Burn=zeros(size(Nuevo_Dem,1),size(Nuevo_Dem,2));
Matriz_Burn=Matriz_Chequeo_Burn_Extract;
Matriz_Burn(Nuevo_Dem==NoData)=NoData;
for i=1:size(Matriz_Resultado,1)
   Nuevo_Dem(Pos_Dem_Actual(i,1))=N_Valor_Pos_Dem_Actual(i);
   Matriz_Burn(Pos_Dem_Actual(i,1))=1;
end
% Se escriben los resultados de las celdas donde ya se realizo el Burn
%Matriz_Burn=zeros(size(Nuevo_Dem,1),size(Nuevo_Dem,2));

end








% % Por este metodo no dio
% % Se define la funcion objetivo, para esto se suman todos los valores de
% % Valor_Pos_Dem_Actual y Valor_Pos_Dem_Siguiente
% 
% Suma=sum(Valor_Pos_Dem_Actual)+sum(Valor_Pos_Dem_Siguiente);
% Vector_aux=-1*ones(1,2*size(Valor_Pos_Dem_Actual,1));
% Vector_aux=Vector_aux';
% Vector_Incognita=[Vector_aux; Suma];
% % Ahhora se crean el vector de las desigualdades
% Desigualdades=ones(1,2*size(Valor_Pos_Dem_Actual,1));
% for i=1:size(Desigualdades,2)
%     if mod(i,2)==0
%        Desigualdades(i)=-1;
%     else
%     end
% end
% Desigualdades=[Desigualdades 0]; 
% % Se crea la restricción , menor igual que cero
% b=[0];
% lb = zeros(2*size(Valor_Pos_Dem_Actual,1),1);
% Aeq=zeros(1,2*size(Valor_Pos_Dem_Actual,1)+1);
% Aeq(1,end)=[1];
% beq=[1];
% 
% 
% [x,fval,exitflag,output,lambda] = linprog(Vector_Incognita,Desigualdades,b,Aeq,beq,lb);