%% Función recursiva para el Burning2 del Dem

function [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn2(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min)
Flag1=0;
while Flag1==0
    Contador=Contador+1;
    if Contador>50000
        break
    end
            if Red_Clasificada(i_aux-1,j_aux+1)==Clase_Principal && Matriz_chequeo(i_aux-1,j_aux+1)==0
                if Dem_burn(i_aux-1,j_aux+1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux-1,j_aux+1))<Epsilon_min
                    Dem_burn(i_aux-1,j_aux+1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux-1,j_aux+1)=1;
                    else
                    Matriz_chequeo(i_aux-1,j_aux+1)=3;
                    end
                else
                   Matriz_chequeo(i_aux-1,j_aux+1)=2;
                end
                i_aux=i_aux-1; j_aux=j_aux+1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min);
            elseif Red_Clasificada(i_aux,j_aux+1)==Clase_Principal  && Matriz_chequeo(i_aux,j_aux+1)==0
                if Dem_burn(i_aux,j_aux+1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux,j_aux+1))<Epsilon_min
                    Dem_burn(i_aux,j_aux+1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                    Matriz_chequeo(i_aux,j_aux+1)=1;
                    else
                    Matriz_chequeo(i_aux,j_aux+1)=3;    
                    end
                else
                   Matriz_chequeo(i_aux,j_aux+1)=2;
                end
                i_aux=i_aux; j_aux=j_aux+1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min);
            elseif Red_Clasificada(i_aux+1,j_aux+1)==Clase_Principal  && Matriz_chequeo(i_aux+1,j_aux+1)==0
                if Dem_burn(i_aux+1,j_aux+1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux+1,j_aux+1))<Epsilon_min
                   Dem_burn(i_aux+1,j_aux+1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux+1,j_aux+1)=1;
                    else
                    Matriz_chequeo(i_aux+1,j_aux+1)=3;    
                    end
                else
                   Matriz_chequeo(i_aux+1,j_aux+1)=2;
                end
                i_aux=i_aux+1; j_aux=j_aux+1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min);
            elseif Red_Clasificada(i_aux+1,j_aux)==Clase_Principal  && Matriz_chequeo(i_aux+1,j_aux)==0
                if Dem_burn(i_aux+1,j_aux)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux+1,j_aux))<Epsilon_min
                   Dem_burn(i_aux+1,j_aux)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux+1,j_aux)=1;
                    else
                    Matriz_chequeo(i_aux+1,j_aux)=3;   
                    end
                else
                   Matriz_chequeo(i_aux+1,j_aux)=2;
                end
                i_aux=i_aux+1; j_aux=j_aux;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min);
            elseif Red_Clasificada(i_aux+1,j_aux-1)==Clase_Principal  && Matriz_chequeo(i_aux+1,j_aux-1)==0
                if Dem_burn(i_aux+1,j_aux-1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux+1,j_aux-1))<Epsilon_min
                   Dem_burn(i_aux+1,j_aux-1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux+1,j_aux-1)=1;
                    else
                    Matriz_chequeo(i_aux+1,j_aux-1)=3;    
                    end
                else
                   Matriz_chequeo(i_aux+1,j_aux-1)=2;
                end
                i_aux=i_aux+1; j_aux=j_aux-1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min);
            elseif Red_Clasificada(i_aux,j_aux-1)==Clase_Principal  && Matriz_chequeo(i_aux,j_aux-1)==0
                if Dem_burn(i_aux,j_aux-1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux,j_aux-1))<Epsilon_min
                   Dem_burn(i_aux,j_aux-1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux,j_aux-1)=1;
                    else
                    Matriz_chequeo(i_aux,j_aux-1)=3;    
                    end
                else
                   Matriz_chequeo(i_aux,j_aux-1)=2;
                end
                i_aux=i_aux; j_aux=j_aux-1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min);
            elseif Red_Clasificada(i_aux-1,j_aux-1)==Clase_Principal  && Matriz_chequeo(i_aux-1,j_aux-1)==0
                if Dem_burn(i_aux-1,j_aux-1)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux-1,j_aux-1))<Epsilon_min
                   Dem_burn(i_aux-1,j_aux-1)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux-1,j_aux-1)=1;
                    else
                    Matriz_chequeo(i_aux-1,j_aux-1)=3;    
                    end
                else
                   Matriz_chequeo(i_aux-1,j_aux-1)=2;
                end
                i_aux=i_aux-1; j_aux=j_aux-1;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min);
            elseif Red_Clasificada(i_aux-1,j_aux)==Clase_Principal  && Matriz_chequeo(i_aux-1,j_aux)==0
                if Dem_burn(i_aux-1,j_aux)<Dem_burn(i_aux,j_aux);
                    if (Dem_burn(i_aux,j_aux)-Dem_burn(i_aux-1,j_aux))<Epsilon_min
                   Dem_burn(i_aux-1,j_aux)=Dem_burn(i_aux,j_aux)+Delta_caida;
                   Matriz_chequeo(i_aux-1,j_aux)=1;
                    else
                    Matriz_chequeo(i_aux-1,j_aux)=3;    
                    end
                else
                   Matriz_chequeo(i_aux-1,j_aux)=2;
                end
                i_aux=i_aux-1; j_aux=j_aux;
                [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min);
            else
                Flag1=1;
                
            end 
end

end