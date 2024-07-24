%% Script que separa las redes de drenaje de un mapa, sin tener en cuenta las direcciones 
% de flujo, solo se tienen en cuenta la continuidad, los inputs son la red,
% que se desea realizar la clasificacion, Escribir_Red_Clasi (1 si se desea
% escribir, 0 si no se desea),Encabezado y la Ruta de guardado

function [Red_Clasificada]= Clasificacion_Red(Red,Escribir_Red_Clasi,NoData,Encabezado,Ruta_Red_Clasi)
Red_Clasificada=zeros(size(Red,1),size(Red,2));
Clasificacion=0;
for i=1:size(Red,1)
    i
    for j=1:size(Red,2)
        % Pregunta si la celda es red de drenaje y no se ha clasificado
      if Red(i,j)==1 && Red_Clasificada(i,j)==0
          Flag1=0;
          Clasificacion=Clasificacion+1;
          i_aux=i; j_aux=j;
          % Se empieza a clasificar todas las celdas que son vecinas de
          % estas, con el mismo valor de clasificacion
          [Flag2] = F_auxiliar2_Clasificacion_Red(Red,Red_Clasificada,i_aux,j_aux);
          if Flag2==0
              Red_Clasificada(i_aux,j_aux)=Clasificacion;
          end
          while Flag1==0  
            % Contador 1
            % Se chequea que no haya un vecino con Clasificacion
            if Red(i_aux-1,j_aux+1)==1 && Red_Clasificada(i_aux-1,j_aux+1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux-1,j_aux+1)=Clasificacion;
                i_aux=i_aux-1; j_aux=j_aux+1;
            elseif Red(i_aux,j_aux+1)==1 && Red_Clasificada(i_aux,j_aux+1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux,j_aux+1)=Clasificacion;
                i_aux=i_aux; j_aux=j_aux+1;
            elseif Red(i_aux+1,j_aux+1)==1 && Red_Clasificada(i_aux+1,j_aux+1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux+1,j_aux+1)=Clasificacion;
                i_aux=i_aux+1; j_aux=j_aux+1;
            elseif Red(i_aux+1,j_aux)==1 && Red_Clasificada(i_aux+1,j_aux)==0 %&& Flag2==0;
                Red_Clasificada(i_aux+1,j_aux)=Clasificacion;
                i_aux=i_aux+1; j_aux=j_aux;
            elseif Red(i_aux+1,j_aux-1)==1 && Red_Clasificada(i_aux+1,j_aux-1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux+1,j_aux-1)=Clasificacion;
                i_aux=i_aux+1; j_aux=j_aux-1;
            elseif Red(i_aux,j_aux-1)==1 && Red_Clasificada(i_aux,j_aux-1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux,j_aux-1)=Clasificacion;
                i_aux=i_aux; j_aux=j_aux-1;
            elseif Red(i_aux-1,j_aux-1)==1 && Red_Clasificada(i_aux-1,j_aux-1)==0 %&& Flag2==0;
                Red_Clasificada(i_aux-1,j_aux-1)=Clasificacion;
                i_aux=i_aux-1; j_aux=j_aux-1;
            elseif Red(i_aux-1,j_aux)==1 && Red_Clasificada(i_aux-1,j_aux)==0 %&& Flag2==0;
                Red_Clasificada(i_aux-1,j_aux)=Clasificacion;
                i_aux=i_aux-1; j_aux=j_aux;
               % Contador 2, este se devuelve para reclasificar
            elseif Red(i_aux-1,j_aux+1)==1 &&  Red_Clasificada(i_aux-1,j_aux+1)<Clasificacion
                Nueva_Clasificacion=Red_Clasificada(i_aux-1,j_aux+1);
                Red_Clasificada(i_aux,j_aux)= Nueva_Clasificacion;
                [Red,Red_Clasificada,i_aux,j_aux,Flag1] = F_auxiliar_Clasificacion_Red(Red,Red_Clasificada,i_aux,j_aux,Nueva_Clasificacion);
            elseif Red(i_aux,j_aux+1)==1 &&  Red_Clasificada(i_aux,j_aux+1)<Clasificacion
                Nueva_Clasificacion=Red_Clasificada(i_aux,j_aux+1);
                Red_Clasificada(i_aux,j_aux)= Nueva_Clasificacion;
                [Red,Red_Clasificada,i_aux,j_aux,Flag1] = F_auxiliar_Clasificacion_Red(Red,Red_Clasificada,i_aux,j_aux,Nueva_Clasificacion);
            elseif Red(i_aux+1,j_aux+1)==1 &&  Red_Clasificada(i_aux+1,j_aux+1)<Clasificacion
                Nueva_Clasificacion=Red_Clasificada(i_aux+1,j_aux+1);
                Red_Clasificada(i_aux,j_aux)= Nueva_Clasificacion;
                [Red,Red_Clasificada,i_aux,j_aux,Flag1] = F_auxiliar_Clasificacion_Red(Red,Red_Clasificada,i_aux,j_aux,Nueva_Clasificacion);
            elseif Red(i_aux+1,j_aux)==1  && Red_Clasificada(i_aux+1,j_aux)<Clasificacion
                Nueva_Clasificacion=Red_Clasificada(i_aux+1,j_aux);
                Red_Clasificada(i_aux,j_aux)= Nueva_Clasificacion;
                [Red,Red_Clasificada,i_aux,j_aux,Flag1] = F_auxiliar_Clasificacion_Red(Red,Red_Clasificada,i_aux,j_aux,Nueva_Clasificacion);
            elseif Red(i_aux+1,j_aux-1)==1  && Red_Clasificada(i_aux+1,j_aux-1)<Clasificacion
                Nueva_Clasificacion=Red_Clasificada(i_aux+1,j_aux-1);
                Red_Clasificada(i_aux,j_aux)= Nueva_Clasificacion;
                [Red,Red_Clasificada,i_aux,j_aux,Flag1] = F_auxiliar_Clasificacion_Red(Red,Red_Clasificada,i_aux,j_aux,Nueva_Clasificacion);
            elseif Red(i_aux,j_aux-1)==1  && Red_Clasificada(i_aux,j_aux-1)<Clasificacion
                Nueva_Clasificacion=Red_Clasificada(i_aux,j_aux-1);
                Red_Clasificada(i_aux,j_aux)= Nueva_Clasificacion;
                [Red,Red_Clasificada,i_aux,j_aux,Flag1] = F_auxiliar_Clasificacion_Red(Red,Red_Clasificada,i_aux,j_aux,Nueva_Clasificacion);
            elseif Red(i_aux-1,j_aux-1)==1  && Red_Clasificada(i_aux-1,j_aux-1)<Clasificacion
                Nueva_Clasificacion=Red_Clasificada(i_aux-1,j_aux-1);
                Red_Clasificada(i_aux,j_aux)= Nueva_Clasificacion;
                [Red,Red_Clasificada,i_aux,j_aux,Flag1] = F_auxiliar_Clasificacion_Red(Red,Red_Clasificada,i_aux,j_aux,Nueva_Clasificacion);
            elseif Red(i_aux-1,j_aux)==1  && Red_Clasificada(i_aux-1,j_aux)<Clasificacion
                Nueva_Clasificacion=Red_Clasificada(i_aux-1,j_aux);
                Red_Clasificada(i_aux,j_aux)= Nueva_Clasificacion;
                [Red,Red_Clasificada,i_aux,j_aux,Flag1] = F_auxiliar_Clasificacion_Red(Red,Red_Clasificada,i_aux,j_aux,Nueva_Clasificacion);
            else
                Flag1=1;
                
            end 
            %'Se quedo en el ciclo 1'
          end        
      end     
    end
end
Red_Clasificada(Red_Clasificada==0)=NoData;
%% Se escriben los resultados
if Escribir_Red_Clasi==1
 % se escriben los resultadosde Linea de Energia
texto='';
for i=1:(size(Red_Clasificada,1)-1)
    texto=[texto,'%6.2f '];
end
texto=[texto,'%6.2f\n'];

%encabezado=char(mapa1.textdata);
Encabezado=Encabezado;
% Ruta de salida
fid=fopen([Ruta_Red_Clasi  'Red_Clasificada.asc'],'wt');
for k=1:6 
fprintf(fid,'%s\n',Encabezado(k,:));
end

fprintf(fid, texto, Red_Clasificada');
fclose(fid);

disp(repmat('*',1,50));
disp('* Se guardó Mapa');
disp(repmat('*',1,50));   
    
end

end