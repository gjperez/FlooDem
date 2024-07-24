%% Función que estandariza un mapa, se pueden emplear varios metodos de estandarización
% 1 metodo:  Resta la media y se divide por la desiación estandar
% 2 metodo: Se divide por la media
% 3 metodo: Se divide por el rango
function[Mapa_Estandarizado]=Estandarizar_Mapa(Mapa,tipo)

if tipo==1
    Mapa_Estandarizado=(Mapa-(nanmean(Mapa(:))))./nanstd(Mapa(:));
elseif tipo==2
    Mapa_Estandarizado=Mapa./nanstd(Mapa(:));
elseif tipo==3
    Mapa_Estandarizado=Mapa/range(Mapa(:));
end

end