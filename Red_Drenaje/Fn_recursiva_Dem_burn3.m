%% Función recursiva para el Burning3 del Dem

function [Dem_burn,Matriz_chequeo] = Fn_recursiva_Dem_burn3(Dem_burn,Red_Clasificada,Matriz_chequeo,i_aux,j_aux,Contador,Delta_caida,Clase_Principal,Epsilon_min,Alpha_min)
Flag1=0;
while Flag1==0
    Contador=Contador+1;
    if Contador>80000
        break
    end
    if i_aux==1
        i_aux=i_aux+1;
    elseif i_aux==size(Dem_burn,1)
        i_aux=size(Dem_burn,1)-1;
    elseif j_aux==1
        j_aux=j_aux+1;
    elseif j_aux==size(Dem_burn,2)
        j_aux=size(Dem_burn,2)-1;
    end
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