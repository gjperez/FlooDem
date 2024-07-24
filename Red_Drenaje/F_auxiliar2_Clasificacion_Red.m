%% Funcion auxiliar para devolverse en la red de drenaje, cuando encontro una red que ya 
% esta clasificada

function [Flag2] = F_auxiliar2_Clasificacion_Red(Red,Red_Clasificada,i_aux,j_aux)
     Cont_aux=0;
            if Red(i_aux-1,j_aux+1)==1 && Red_Clasificada(i_aux-1,j_aux+1)~=0
                Cont_aux=Cont_aux+1;
            elseif Red(i_aux,j_aux+1)==1 && Red_Clasificada(i_aux,j_aux+1)~=0
                Cont_aux=Cont_aux+1;
            elseif Red(i_aux+1,j_aux+1)==1 && Red_Clasificada(i_aux+1,j_aux+1)~=0
                Cont_aux=Cont_aux+1;
            elseif Red(i_aux+1,j_aux)==1 && Red_Clasificada(i_aux+1,j_aux)~=0
                Cont_aux=Cont_aux+1;
            elseif Red(i_aux+1,j_aux-1)==1 && Red_Clasificada(i_aux+1,j_aux-1)~=0
                Cont_aux=Cont_aux+1;
            elseif Red(i_aux,j_aux-1)==1 && Red_Clasificada(i_aux,j_aux-1)~=0
                Cont_aux=Cont_aux+1;
            elseif Red(i_aux-1,j_aux-1)==1 && Red_Clasificada(i_aux-1,j_aux-1)~=0
                Cont_aux=Cont_aux+1;
            elseif Red(i_aux-1,j_aux)==1 && Red_Clasificada(i_aux-1,j_aux)~=0
                Cont_aux=Cont_aux+1; 
            end 
            if Cont_aux>=1
                Flag2=1;
            else
                Flag2=0;
            end

end