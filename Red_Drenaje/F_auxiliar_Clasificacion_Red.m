%% Funcion auxiliar para devolverse en la red de drenaje, cuando encontro una red que ya 
% esta clasificada

function [Red,Red_Clasificada,i_aux,j_aux,Flag1] = F_auxiliar_Clasificacion_Red(Red,Red_Clasificada,i_aux,j_aux,Nueva_Clasificacion)
Flag1=0;
while Flag1==0
     % Contador 1
            if Red(i_aux-1,j_aux+1)==1 && Red_Clasificada(i_aux-1,j_aux+1)>Nueva_Clasificacion
                Red_Clasificada(i_aux-1,j_aux+1)=Nueva_Clasificacion;
                i_aux=i_aux-1; j_aux=j_aux+1;
            elseif Red(i_aux,j_aux+1)==1 && Red_Clasificada(i_aux,j_aux+1)>Nueva_Clasificacion
                Red_Clasificada(i_aux,j_aux+1)=Nueva_Clasificacion;
                i_aux=i_aux; j_aux=j_aux+1;
            elseif Red(i_aux+1,j_aux+1)==1 && Red_Clasificada(i_aux+1,j_aux+1)>Nueva_Clasificacion
                Red_Clasificada(i_aux+1,j_aux+1)=Nueva_Clasificacion;
                i_aux=i_aux+1; j_aux=j_aux+1;
            elseif Red(i_aux+1,j_aux)==1 && Red_Clasificada(i_aux+1,j_aux)>Nueva_Clasificacion
                Red_Clasificada(i_aux+1,j_aux)=Nueva_Clasificacion;
                i_aux=i_aux+1; j_aux=j_aux;
            elseif Red(i_aux+1,j_aux-1)==1 && Red_Clasificada(i_aux+1,j_aux-1)>Nueva_Clasificacion
                Red_Clasificada(i_aux+1,j_aux-1)=Nueva_Clasificacion;
                i_aux=i_aux+1; j_aux=j_aux-1;
            elseif Red(i_aux,j_aux-1)==1 && Red_Clasificada(i_aux,j_aux-1)>Nueva_Clasificacion
                Red_Clasificada(i_aux,j_aux-1)=Nueva_Clasificacion;
                i_aux=i_aux; j_aux=j_aux-1;
            elseif Red(i_aux-1,j_aux-1)==1 && Red_Clasificada(i_aux-1,j_aux-1)>Nueva_Clasificacion
                Red_Clasificada(i_aux-1,j_aux-1)=Nueva_Clasificacion;
                i_aux=i_aux-1; j_aux=j_aux-1;
            elseif Red(i_aux-1,j_aux)==1 && Red_Clasificada(i_aux-1,j_aux)>Nueva_Clasificacion
                Red_Clasificada(i_aux-1,j_aux)=Nueva_Clasificacion;
                i_aux=i_aux-1; j_aux=j_aux;
            else
                Flag1=1;
                
            end 
            %'SE quedo en el cicloo 2'
end
%'No se quedo en el cicloo 2'

end