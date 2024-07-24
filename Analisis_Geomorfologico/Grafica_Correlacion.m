%% Función que crea la grafica de correlación entre una variable X vs una Y

function[Vector_Correlacion_X,Vector_Correlacion_C]=Grafica_Correlacion(Matriz_Multivariada,Matriz_Umbral,NoData,Titulo,Etiqueta1,Etiqueta2,Ruta_Guardado)
% Se eliminan las celdas que estan por encima de los Umbrales de cada uno
% de los mapas
'PASO 0'
Tamano_inicial=size(Matriz_Multivariada,1);
Vector_aux=zeros(size(Matriz_Multivariada,1),1);
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
elseif OPCION==1
    for j=1:size(Matriz_Umbral,2)
    Matriz=Matriz_Multivariada(:,j);
    Matriz(Vector_aux>=1)=[];
    Matriz_Multivariada2(:,j)=Matriz;
   end
    Matriz_Multivariada=Matriz_Multivariada2;
    clear Matriz_Multivariada2
else
end

% Se debe considerar que los mapas de entrada deben estar en enteros
Min_Hand=nanmin(Matriz_Multivariada(:,1));
Max_Hand=nanmax(Matriz_Multivariada(:,1));
Vector_Correlacion_X=Min_Hand:Max_Hand; Vector_Correlacion_X=Vector_Correlacion_X';
Vector_Correlacion_C=ones(size(Vector_Correlacion_X,1),1)*NoData;
Media=ones(size(Vector_Correlacion_X,1),1)*NoData;
Desviacion=ones(size(Vector_Correlacion_X,1),1)*NoData;
Contador=ones(size(Vector_Correlacion_X,1),1)*NoData;
for i=1:size(Vector_Correlacion_X,1)
    Vector_Aux_X=Matriz_Multivariada(:,1);
    Vector_Aux_Y=Matriz_Multivariada(:,2);
    Vector_Aux_Y(Vector_Aux_X~=Vector_Correlacion_X(i,1))=[];
    Vector_Aux_X(Vector_Aux_X~=Vector_Correlacion_X(i,1))=[];
    if size(Vector_Aux_X,1)<=50
    %Vector_Correlacion_C(i,1)=NoData;
    Media(i,1)=NoData;
    Desviacion(i,1)=NoData; 
    Contador(i,1)=NoData; 
    else
    Media(i,1)=nanmean(Vector_Aux_Y);
    Desviacion(i,1)=nanstd(Vector_Aux_Y);
    Contador(i,1)=length(Vector_Aux_Y);
    %M_Correlacion=corr(Vector_Aux_X,Vector_Aux_Y);
    %Vector_Correlacion_C(i,1)=M_Correlacion(1,2);
    end
end
Vector_Correlacion_X(Media==NoData)=[];
%Vector_Correlacion_C(Vector_Correlacion_C==NoData)=[];
Media(Media==NoData)=[];
Desviacion(Desviacion==NoData)=[];
Contador(Contador==NoData)=[];

% Se definen los intervalos de confianza con una signicancia del 5%,
% siguiendo una distribución normal

% (Intervalos de confianza) para el 99% de los datos
Inter_Sup=Media+(2.576*Desviacion./(Contador.^0.5));
Inter_Inf=Media-(2.576*Desviacion./(Contador.^0.5));
% Se grafican los resultados
scrz=get(0,'screensize');
figura=figure('position',[100 100 scrz(3)/1.8 scrz(4)/2]);
set(gcf,'color','white')
Titulo1=['Media Zonal ' Titulo];
plot(Vector_Correlacion_X,Media),title(Titulo1,'fontsize',16,'fontweight','bold'), xlabel(Etiqueta1,'fontsize',14,'fontweight','bold'), ylabel(Etiqueta2,'fontsize',14,'fontweight','bold'); hold on
plot(Vector_Correlacion_X,Inter_Sup,'r')
plot(Vector_Correlacion_X,Inter_Inf,'r')
rutaAF=[Ruta_Guardado Titulo1 '.png'];
saveas(figura,rutaAF)
close

%% Se realiza un boxplot de los datos
% Se debe considerar que los mapas de entrada deben estar en enteros,
% estare el 99.3% de los datos (los otros son atipicos y no se graficaran
% en el boxplot
Min_Hand=nanmin(Matriz_Multivariada(:,1));
Max_Hand=nanmax(Matriz_Multivariada(:,1));
% Se define cual es la maxima frecuencia
Maxima_Long=tabulate(Matriz_Multivariada(:,1));
Maxima_Long=nanmax(Maxima_Long(:,2));
Vector_Correlacion_X=-10:10; Vector_Correlacion_X=Vector_Correlacion_X';
Matriz_Bloxplot=nan(Maxima_Long,size(Vector_Correlacion_X,1));

Contador=ones(size(Vector_Correlacion_X,1),1)*NoData;
for i=1:size(Vector_Correlacion_X,1)
    Vector_Aux_X=Matriz_Multivariada(:,1);
    Vector_Aux_Y=Matriz_Multivariada(:,2);
    Vector_Aux_Y(Vector_Aux_X~=Vector_Correlacion_X(i,1))=[];
    Vector_Aux_X(Vector_Aux_X~=Vector_Correlacion_X(i,1))=[];
    Percentil_25_75= prctile(Vector_Aux_Y,[25 75]);
    Umbral_Inf=Percentil_25_75(1)-(1.5*(Percentil_25_75(2)-Percentil_25_75(1)));
    Umbral_Sup=Percentil_25_75(2)+(1.5*(Percentil_25_75(2)-Percentil_25_75(1)));
    Vector_Aux_Y(Vector_Aux_Y<Umbral_Inf)=[];
    Vector_Aux_Y(Vector_Aux_Y>Umbral_Sup)=[];
    Matriz_Bloxplot(1:size(Vector_Aux_Y,1),i)=Vector_Aux_Y;
    Matriz_Bloxplot(size(Vector_Aux_Y,1)+1:end,i)=NaN;
    if size(Vector_Aux_Y,1)<=50
    %Vector_Correlacion_C(i,1)=NoData;
    Contador(i,1)=NoData; 
    else
    Contador(i,1)=length(Vector_Aux_Y);
    %M_Correlacion=corr(Vector_Aux_X,Vector_Aux_Y);
    %Vector_Correlacion_C(i,1)=M_Correlacion(1,2);
    end
end
Vector_Correlacion_X(Media==NoData)=[];
%Vector_Correlacion_C(Vector_Correlacion_C==NoData)=[];
Contador(Contador==NoData)=[];

% Se grafican los resultados
scrz=get(0,'screensize');
figura=figure('position',[100 100 scrz(3)/1.8 scrz(4)/2]);
set(gcf,'color','white')
Titulo=['Boxplot ' Titulo];
boxplot(Matriz_Bloxplot),title(Titulo,'fontsize',16,'fontweight','bold'), xlabel(Etiqueta1,'fontsize',14,'fontweight','bold'), ylabel(Etiqueta2,'fontsize',14,'fontweight','bold'); hold on
set(gca,'XTick',1:21);
set(gca,'XTickLabel',{'-10','-9','-8','-7','-6','-5','-4','-3','-2','-1','0','1','2','3','4','5','6','7','8','9','10'})
rutaAF=[Ruta_Guardado Titulo '.png'];
saveas(figura,rutaAF)
close

csvwrite([Ruta_Guardado Titulo 'Box'],Matriz_Bloxplot);



end