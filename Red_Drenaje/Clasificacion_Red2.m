%% Script que separa las redes de drenaje de un mapa, sin tener en cuenta las direcciones 
% de flujo, solo se tienen en cuenta la continuidad, los inputs son la red,
% que se desea realizar la clasificacion, Escribir_Red_Clasi (1 si se desea
% escribir, 0 si no se desea),Encabezado y la Ruta de guardado

function [Red_Clasificada]= Clasificacion_Red2(Red)
Red_Clasificada=zeros(size(Red,1),size(Red,2));
Clasificacion=1;
Chequeo_Porcentaje=ceil(size(Red,1)/10);
Chequeo_Porcentaje1=Chequeo_Porcentaje;
for i=1:size(Red,1)
    if i==(Chequeo_Porcentaje) ;
        [num2str((i/size(Red,1))*100) '%']
        Chequeo_Porcentaje=Chequeo_Porcentaje+Chequeo_Porcentaje1;
    end
    for j=1:size(Red,2)
        % Pregunta si la celda es red de drenaje y no se ha clasificado
      if Red(i,j)==1 && Red_Clasificada(i,j)==0
          Contador2=0;
          Flag1=0;
          i_aux=i; j_aux=j;
          Red_Clasificada(i_aux,j_aux)=Clasificacion;
          % Se empieza a clasificar todas las celdas que son vecinas de
          % estas, con el mismo valor de clasificacion
          while Flag1==0  
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
                Clasificacion=Clasificacion+1; 
            end 
            %'Se quedo en el ciclo 1'
          end        
      end     
    end
end

end