%% Funcion Recursiva par la clasificaicon de las redes de drenaje

function [Red_Clasificada] = Fn_recursiva_Clasi_Red(Red,Red_Clasificada,i_aux,j_aux,Clasificacion,Contador2)
Flag1=0;
while Flag1==0  
    Contador2=Contador2+1;
    if Contador2>80000
        break
    end
    % Se realiza unas condiciones para evitar que pregunte fuera del rango
    if i_aux==1
        i_aux=i_aux+1;
    elseif i_aux==size(Red,1)
        i_aux=size(Red,1)-1;
    elseif j_aux==1
        j_aux=j_aux+1;
    elseif j_aux==size(Red,2)
        j_aux=size(Red,2)-1;
    end
    % Contador 1
            % Se chequea que no haya un vecino con Clasificacion
            if Red(i_aux-1,j_aux+1)==1 && Red_Clasificada(i_aux-1,j_aux+1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux-1,j_aux+1)=Clasificacion;
                i_aux=i_aux-1; j_aux=j_aux+1;
                [Red_Clasificada] = Fn_recursiva_Clasi_Red(Red,Red_Clasificada,i_aux,j_aux,Clasificacion,Contador2);
            elseif Red(i_aux,j_aux+1)==1 && Red_Clasificada(i_aux,j_aux+1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux,j_aux+1)=Clasificacion;
                i_aux=i_aux; j_aux=j_aux+1;
                [Red_Clasificada] = Fn_recursiva_Clasi_Red(Red,Red_Clasificada,i_aux,j_aux,Clasificacion,Contador2);
            elseif Red(i_aux+1,j_aux+1)==1 && Red_Clasificada(i_aux+1,j_aux+1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux+1,j_aux+1)=Clasificacion;
                i_aux=i_aux+1; j_aux=j_aux+1;
                [Red_Clasificada] = Fn_recursiva_Clasi_Red(Red,Red_Clasificada,i_aux,j_aux,Clasificacion,Contador2);
            elseif Red(i_aux+1,j_aux)==1 && Red_Clasificada(i_aux+1,j_aux)==0 %&& Flag2==0;
                Red_Clasificada(i_aux+1,j_aux)=Clasificacion;
                i_aux=i_aux+1; j_aux=j_aux;
                [Red_Clasificada] = Fn_recursiva_Clasi_Red(Red,Red_Clasificada,i_aux,j_aux,Clasificacion,Contador2);
            elseif Red(i_aux+1,j_aux-1)==1 && Red_Clasificada(i_aux+1,j_aux-1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux+1,j_aux-1)=Clasificacion;
                i_aux=i_aux+1; j_aux=j_aux-1;
                [Red_Clasificada] = Fn_recursiva_Clasi_Red(Red,Red_Clasificada,i_aux,j_aux,Clasificacion,Contador2);
            elseif Red(i_aux,j_aux-1)==1 && Red_Clasificada(i_aux,j_aux-1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux,j_aux-1)=Clasificacion;
                i_aux=i_aux; j_aux=j_aux-1;
                [Red_Clasificada] = Fn_recursiva_Clasi_Red(Red,Red_Clasificada,i_aux,j_aux,Clasificacion,Contador2);
            elseif Red(i_aux-1,j_aux-1)==1 && Red_Clasificada(i_aux-1,j_aux-1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux-1,j_aux-1)=Clasificacion;
                i_aux=i_aux-1; j_aux=j_aux-1;
                [Red_Clasificada] = Fn_recursiva_Clasi_Red(Red,Red_Clasificada,i_aux,j_aux,Clasificacion,Contador2);
            elseif Red(i_aux-1,j_aux)==1 && Red_Clasificada(i_aux-1,j_aux)==0 %&& Flag2==0;
                Red_Clasificada(i_aux-1,j_aux)=Clasificacion;
                i_aux=i_aux-1; j_aux=j_aux;
                [Red_Clasificada] = Fn_recursiva_Clasi_Red(Red,Red_Clasificada,i_aux,j_aux,Clasificacion,Contador2);
            else
                Flag1=1;
                
            end 
            %'Se quedo en el ciclo 1'
end        

end