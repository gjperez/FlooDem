%% Función que calcula las estadisticas basica de un vector
% Se calcula, La media,Media, Mediana, Varianza, Desviación tipica, Minimo, Maximo,
% Rango, asimetria, curtosis, Numero de datos
function[Estadisticas]=Estadisticas_Basicas(Vector)
Estadisticas(1,1)=mean(Vector);
Estadisticas(2,1)=std(Vector);
Estadisticas(3,1)=var(Vector);
Estadisticas(4,1)=min(Vector);
Estadisticas(5,1)=max(Vector);
Estadisticas(6,1)=range(Vector);
Estadisticas(7,1)= skewness(Vector);
Estadisticas(8,1)= kurtosis(Vector);
Estadisticas(9,1)=size(Vector,1);
end