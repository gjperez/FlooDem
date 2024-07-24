function varargout = GUI_Geomorfologia(varargin)
% GUI_GEOMORFOLOGIA MATLAB code for GUI_Geomorfologia.fig
%      GUI_GEOMORFOLOGIA, by itself, creates a new GUI_GEOMORFOLOGIA or raises the existing
%      singleton*.
%
%      H = GUI_GEOMORFOLOGIA returns the handle to a new GUI_GEOMORFOLOGIA or the handle to
%      the existing singleton*.
%
%      GUI_GEOMORFOLOGIA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_GEOMORFOLOGIA.M with the given input arguments.
%
%      GUI_GEOMORFOLOGIA('Property','Value',...) creates a new GUI_GEOMORFOLOGIA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Geomorfologia_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Geomorfologia_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Geomorfologia

% Last Modified by GUIDE v2.5 15-May-2014 12:06:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Geomorfologia_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Geomorfologia_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_Geomorfologia is made visible.
function GUI_Geomorfologia_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Geomorfologia (see VARARGIN)

% Choose default command line output for GUI_Geomorfologia
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Geomorfologia wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Geomorfologia_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
axes(handles.axes1) 
handles.imagen=imread('UNAL.png'); 
imagesc(handles.imagen) 
axis off 

axes(handles.axes3) 
handles.imagen=imread('Logo_Codigo.png'); 
imagesc(handles.imagen) 
axis off 





function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] =uigetfile
if pathname==0
    return
else
    path=[pathname filename];
end
set(handles.edit4, 'String', path)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path=uigetdir
if path==0
    return
else
    path=strcat(path,'\');
end
set(handles.edit8, 'String', path)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Codigo Analisis geomorfologico
tic
pwd
addpath([pwd '/Codigos_Anexados_TopoToolbox']);
%% Se define la ruta de guardado
% ruta de escritura
Ruta_Res=get(handles.edit8,'String');
NoData=str2double(get(handles.edit6,'String'));

%% Se realiza la lectura de los mapas de entrada, inicialmente se realizara 
% Lectura del MDT, dirección y red_hidrografia
'CARGANDO MAPAS DE ENTRADA'
Ruta_MDT=get(handles.edit4,'String');
'CARGANDO DEM'
[Dem,X_dem,Y_dem] = rasterread(Ruta_MDT);
Dem=GRIDobj(Ruta_MDT); % Se carga el DEM
Carga_Dem_BURN=(get(handles.checkbox78,'Value')); % Se pregunta si se usa el Dem_BURN para calcular la red derivada y As
if Carga_Dem_BURN==1
'CARGANDO DEM_BURN'
Ruta_Burn=get(handles.edit16,'String');    
Dem_BURN=GRIDobj(Ruta_Burn); % Se carga el DEM  
end
Carga_Red=(get(handles.checkbox77,'Value')); % Se pregunta si se usa esta red para el HAND y el mapa de distancias
if Carga_Red==1
'CARGANDO RED'
Ruta_Red=get(handles.edit15,'String');    
Red_Real=GRIDobj(Ruta_Red); % Se carga el DEM 
Red_Real=Red_Real.Z;
end

% Lectura del umbral de area de drenaje
Umbral=str2double(get(handles.edit11,'String'));Umbral=ceil((Umbral*1000*1000/900)); % Esta en Km2
Radio=str2double(get(handles.edit17,'String')); % Este debe ser impar, para que siempre exista una cel da en el centro
Radio2=Radio*5; % Este debe ser impar, para que siempre exista una cel da en el centro

%% Se calculan los parametros geomorfologicos derivados del MDT
%Se calcula la red de drenaje si es caso o se emplea la que se introduce
%FIll
'Haciendo Fill'
if Carga_Dem_BURN==1
Fill_Dem=fillsinks(Dem_BURN);
else
Fill_Dem=fillsinks(Dem);    
end
% Dirección
'Dirección'
Dir = flowdir(X_dem,Y_dem,Fill_Dem.Z,'type','single'); clear Fill_Dem
FD = FLOWobj(Dir,'cellsize',Dem.cellsize,'size',Dem.size,'refmat',Dem.refmat);
Direccion = FLOWobj2GRIDobj(FD);
Direccion.Z=double(Direccion.Z);
Direccion.Z(isnan(Dem.Z)==1)=NaN;
% Acumulación
'Acumulación'
As = flowacc(FD); clear FD
As.Z=double(As.Z);
As.Z(isnan(Dem.Z)==1)=NaN;
% Red
'Red'
if Carga_Red==1
Red=Red_Real;
else
Red = As;
Red.Z(As.Z >= Umbral)=1;Red.Z(As.Z < Umbral)=NaN;
Red.Z=double(Red.Z);
Red.Z(isnan(Dem.Z)==1)=NaN;
Red=Red.Z;
end
%Distancia a la red
'Distancia Red'
Red(isnan(Red)==1)=NoData;
Distancias=Distancia_Red(Red,NoData,Dem.cellsize);
Distancias(isnan(Dem.Z)==1)=NaN;
%Pendiente en %
'Pendiente'
Slope_MDT= Slope(Dem.Z,Dem.cellsize,1); % 1 en porcentaje, 2 en grados
%Hight altitud near dreinage-HAND
%S = STREAMobj(FD,As>Umbral);
% Se identifica la cuenca principal para eliminar todo lo demas
% DB = drainagebasins(FD);
% DB.Z(isnan(Dem.Z)==1)=NaN;
% Cuencas=DB.Z(:); Cuencas(isnan(Cuencas)==1)=[];
% Cuenca_ppal=tabulate(Cuencas);
% Cuenca_ppal=sortrows(Cuenca_ppal,2);
% HAND = vertdistance2stream(FD,S,Dem);
% HAND.Z(DB.Z~=Cuenca_ppal(end,1))=NaN; % Para eliminar los resultados que estan por fuera de la cuenca
% HAND=HAND.Z;
'HAND'
HAND=HAND_F(Dem.Z,Direccion.Z,Red,1,NoData); clear Direccion
%Multiresolution valley bottom flatness -MrVBF
'MrVBF'
[MRVBF4]= Mrvbf(Dem); %MRVBF4=round(100*MRVBF4); % Se multiplica por 100 y se redondea (la clasificación de clases)
%Topographic Position Index - TPI
'TPI'
TPI = roughness(Dem,'tpi',[Radio2 Radio2]);
TPI=TPI.Z; %TPI=round(100*TPI); % Se multiplica por 100 y se redondea (la clasificación de clases)
%Topographic ruggedness index - TRI
'TRI'
TRI = roughness(Dem,'tri',[Radio Radio]);
TRI=TRI.Z; %TRI=round(100*TRI); % Se multiplica por 100 y se redondea (la clasificación de clases)
%Roughness
'Roughness'
Roughness = roughness(Dem,'roughness',[Radio Radio]);
Roughness=Roughness.Z; %Roughness=round(100*Roughness); % Se multiplica por 100 y se redondea (la clasificación de clases)
%Ruggedness
'Ruggedness'
Ruggedness = roughness(Dem,'ruggedness',[Radio Radio]);
Ruggedness=Ruggedness.Z; %Ruggedness=round(100*Ruggedness); % Se multiplica por 100 y se redondea (la clasificación de clases)
%Surface roughness factor - SRF
'SRF'
SRF = roughness(Dem,'srf',[Radio Radio]);
SRF=SRF.Z; %SRF=round(100*SRF); % Se multiplica por 100 y se redondea (la clasificación de clases)

% Se guardan los mapas
Guarda_MRVBF4=(get(handles.checkbox1,'Value')); % Se guarda el mapa MRVBF4
Guarda_Distancias=(get(handles.checkbox5,'Value')); % Se guarda el mapa Distancias
Guarda_Slope_MDT=(get(handles.checkbox4,'Value')); % Se guarda el mapa Slope_MDT
Guarda_HAND=(get(handles.checkbox2,'Value')); % Se guarda el mapa HAND
Guarda_TPI=(get(handles.checkbox6,'Value')); % Se guarda el mapa TPI
Guarda_TRI=(get(handles.checkbox11,'Value')); % Se guarda el mapa TRI
Guarda_Roughness=(get(handles.checkbox10,'Value')); % Se guarda el mapa Roughness
Guarda_Ruggedness=(get(handles.checkbox9,'Value')); % Se guarda el mapa Ruggedness
Guarda_SRF=(get(handles.checkbox8,'Value')); % Se guarda el mapa SRF
'Exportando mapas geomorfologia'
if Guarda_MRVBF4==1
 MRVBF4 = GRIDobj(X_dem,Y_dem,MRVBF4);
 GRIDobj2ascii(MRVBF4,[Ruta_Res 'MRVBF4.asc']);
 MRVBF4=MRVBF4.Z;
end
if Guarda_Distancias==1
 Distancias = GRIDobj(X_dem,Y_dem,Distancias);
 GRIDobj2ascii(Distancias,[Ruta_Res 'Distancias.asc']);
 Distancias=Distancias.Z;
end
if Guarda_Slope_MDT==1
 Slope_MDT = GRIDobj(X_dem,Y_dem,Slope_MDT);
 GRIDobj2ascii(Slope_MDT,[Ruta_Res 'Slope_MDT.asc']);
 Slope_MDT=Slope_MDT.Z;
end
if Guarda_HAND==1
 HAND = GRIDobj(X_dem,Y_dem,HAND);
 GRIDobj2ascii(HAND,[Ruta_Res 'HAND.asc']);
 HAND=HAND.Z;
end
if Guarda_TPI==1
 TPI = GRIDobj(X_dem,Y_dem,TPI);
 GRIDobj2ascii(TPI,[Ruta_Res 'TPI.asc']);
 TPI=TPI.Z;
end
if Guarda_TRI==1
 TRI = GRIDobj(X_dem,Y_dem,TRI);
 GRIDobj2ascii(TRI,[Ruta_Res 'TRI.asc']);
 TRI=TRI.Z;
end
if Guarda_Roughness==1
 Roughness = GRIDobj(X_dem,Y_dem,Roughness);
 GRIDobj2ascii(Roughness,[Ruta_Res 'Roughness.asc']);
 Roughness=Roughness.Z;
end
if Guarda_Ruggedness==1
 Ruggedness = GRIDobj(X_dem,Y_dem,Ruggedness);
 GRIDobj2ascii(Ruggedness,[Ruta_Res 'Ruggedness.asc']);
 Ruggedness=Ruggedness.Z;
end
if Guarda_SRF==1
 SRF = GRIDobj(X_dem,Y_dem,SRF);
 GRIDobj2ascii(SRF,[Ruta_Res 'SRF.asc']);
 SRF=SRF.Z;
end


%%Se realiza el analisis multivariado
% Se asegura que todos los datos tenga el mismo campo de NoData, el sum es
% para chequear que todos tenga l amisma dimensiony y no tengan nans,
% Se define el umbral del HAND que se quiere analizar, en este caso se
% analizaran HAND mayores que umbral2
Umbral2=10000000;
HAND(HAND>Umbral2)=NaN;

[Coor_X,Coor_Y] = meshgrid(1:size(MRVBF4,2),1:size(MRVBF4,1));
MRVBF4(isnan(MRVBF4)==1)=NoData; MRVBF4(isnan(HAND)==1)=NoData; MRVBF4(HAND==NoData)=NoData; sum(sum(isnan(MRVBF4)));
Distancias(MRVBF4==NoData)=NoData; sum(sum(isnan(Distancias)));
Slope_MDT(MRVBF4==NoData)=NoData; sum(sum(isnan(Slope_MDT)));
HAND(MRVBF4==NoData)=NoData; sum(sum(isnan(HAND)));
TPI(MRVBF4==NoData)=NoData; sum(sum(isnan(TPI)));
TRI(MRVBF4==NoData)=NoData; sum(sum(isnan(TRI)));
Roughness(MRVBF4==NoData)=NoData; sum(sum(isnan(Roughness)));
Ruggedness(MRVBF4==NoData)=NoData; sum(sum(isnan(Ruggedness)));
SRF(MRVBF4==NoData)=NoData; sum(sum(isnan(SRF)));
Coor_X(MRVBF4==NoData)=NoData;
Coor_Y(MRVBF4==NoData)=NoData;

% Se grafican las variables, se pasan a vectores
MRVBF4=MRVBF4(:); MRVBF4(MRVBF4==NoData)=[];
Distancias=Distancias(:); Distancias(Distancias==NoData)=[];
Slope_MDT=Slope_MDT(:); Slope_MDT(Slope_MDT==NoData)=[];
HAND=HAND(:); HAND(HAND==NoData)=[];
TPI=TPI(:); TPI(TPI==NoData)=[];
TRI=TRI(:); TRI(TRI==NoData)=[];
Roughness=Roughness(:); Roughness(Roughness==NoData)=[];
Ruggedness=Ruggedness(:); Ruggedness(Ruggedness==NoData)=[];
SRF=SRF(:); SRF(SRF==NoData)=[];
Coor_X=Coor_X(:); Coor_X(Coor_X==NoData)=[];
Coor_Y=Coor_Y(:); Coor_Y(Coor_Y==NoData)=[];

%% Se grafican todos los mapas con respecto al HAND
OPCION=1; % CUANDO ESTA EN 1 ANALIZA TODOS LOS DATOS, CUANDO ESTA EN 0 ANALIZA LOS DATOS MENORES QUE LOS UMBRALES PLANTEADOS
if OPCION==1
Umbrales=[600 100000 3000 600 600 600 600 600 600]; % Orden MRVBF4 Distancias Slope_MDT As HAND TPI TRI Roughness Ruggedness SRF Wetness_Index Sediment_transport_Index
else % Esto es con la premisa de que los valores por debajo a estos magnitudes corresponden a desciptores de inundaciones
Umbrales=[600 100000 3000 600 600 600 600 600 600]; % Orden MRVBF4 Distancias Slope_MDT As HAND TPI TRI Roughness Ruggedness SRF Wetness_Index Sediment_transport_Index
end

% Se crea una matriz que posee las 12 variables de analisis
% Se crea una matriz con 12 bandas, las cuales almacenan los 12 parametros
% analizados.
'creando matriz de geomorfologia'
Matriz_Mapas_Geomorfologia(:,1)=MRVBF4;clear MRVBF4;  Matriz_Mapas_Geomorfologia(:,2)=Distancias; clear Distancias; Matriz_Mapas_Geomorfologia(:,3)=Slope_MDT; clear Slope_MDT;
Matriz_Mapas_Geomorfologia(:,4)=HAND; clear HAND; Matriz_Mapas_Geomorfologia(:,5)=TPI; clear TPI;
Matriz_Mapas_Geomorfologia(:,6)=TRI; clear TRI; Matriz_Mapas_Geomorfologia(:,7)=Roughness; clear Roughness; Matriz_Mapas_Geomorfologia(:,8)=Ruggedness; clear Ruggedness;
Matriz_Mapas_Geomorfologia(:,9)=SRF; clear SRF; 

% Se realiza la matriz de correlación
[Matriz_Correlacion,P,RLO,RUP]=corrcoef(Matriz_Mapas_Geomorfologia);
Intervalor_Sup_Inf=[RLO RUP];
Guardar_Reporte=(get(handles.checkbox49,'Value')); % Se revisa si se realiza el analisis bivariado
if Guardar_Reporte==1
csvwrite([Ruta_Res 'Matriz_Correlacion'],Matriz_Correlacion);
csvwrite([Ruta_Res 'Intervalor_Sup_Inf'],Intervalor_Sup_Inf);
end
% Se realiza una estadistica descriptiva basica de cada una de los mapas
Etiqueta_Ejes={'MrVBF' 'Distancias (m)' 'Pendiente (%)' 'HAND (m)' 'TPI' 'TRI' 'Roughness' 'Ruggedness' 'SRF'};
Guardar_Reporte=(get(handles.checkbox48,'Value')); % 
if Guardar_Reporte==1
    for i=1:size(Matriz_Mapas_Geomorfologia,2)
        Estadisticas(:,i)=Estadisticas_Basicas(Matriz_Mapas_Geomorfologia(:,i));
    end
    csvwrite([Ruta_Res 'Estadisticas_Mapas'],Estadisticas);
else
    
end

%% Se realiza las frecuencias conjuntas (bivariadas) para los pares propuestos
% Se crean las etiquetas de los ejes
Realiza_Analisis_Bivariado=(get(handles.checkbox20,'Value')); % Se revisa si se realiza el analisis bivariado
Etiqueta_Ejes={'MrVBF' 'Distancias (m)' 'Pendiente (%)' 'HAND (m)' 'TPI' 'TRI' 'Roughness' 'Ruggedness' 'SRF'};
if Realiza_Analisis_Bivariado==1
    % Lectura De:
    Lectura_De(1)=(get(handles.checkbox44,'Value')); Lectura_De(2)=(get(handles.checkbox40,'Value'));
    Lectura_De(3)=(get(handles.checkbox41,'Value')); 
    Lectura_De(4)=(get(handles.checkbox43,'Value')); Lectura_De(5)=(get(handles.checkbox39,'Value'));
    Lectura_De(6)=(get(handles.checkbox38,'Value')); Lectura_De(7)=(get(handles.checkbox35,'Value'));
    Lectura_De(8)=(get(handles.checkbox37,'Value')); Lectura_De(9)=(get(handles.checkbox34,'Value'));

    % Lectura - Con respecto a:
    Lectura_Con_respecto_a(1)=(get(handles.checkbox21,'Value')); Lectura_Con_respecto_a(2)=(get(handles.checkbox25,'Value'));
    Lectura_Con_respecto_a(3)=(get(handles.checkbox24,'Value')); 
    Lectura_Con_respecto_a(4)=(get(handles.checkbox22,'Value')); Lectura_Con_respecto_a(5)=(get(handles.checkbox26,'Value'));
    Lectura_Con_respecto_a(6)=(get(handles.checkbox27,'Value')); Lectura_Con_respecto_a(7)=(get(handles.checkbox30,'Value'));
    Lectura_Con_respecto_a(8)=(get(handles.checkbox28,'Value')); Lectura_Con_respecto_a(9)=(get(handles.checkbox31,'Value'));

Rango_X=60; % Es el numero de clases que tendra el eje X
%Rango_Y=max(HAND)-min(HAND)-1; % Para el HAND
Rango_Y=60;
'realizando matriz conjunta'
for i=1:size(Matriz_Mapas_Geomorfologia,2)
    for j=1:size(Matriz_Mapas_Geomorfologia,2)
        chequeo=Lectura_De(i)+ Lectura_Con_respecto_a(j);
        if chequeo==0 || chequeo==1
            continue
        end
Titulo=[char(Etiqueta_Ejes(i)) ' VS ' char(Etiqueta_Ejes(j))];
Distri_Conjunta(Matriz_Mapas_Geomorfologia(:,i),Matriz_Mapas_Geomorfologia(:,j),Umbrales(i),Umbrales(j),Rango_X,Rango_Y,Titulo,char(Etiqueta_Ejes(i)),char(Etiqueta_Ejes(j)),Ruta_Res);

Metodo_Clases = get(handles.popupmenu2,'String'); 
popupmenu2value = Metodo_Clases{get(handles.popupmenu2,'Value')};
 switch popupmenu2value
     case 'Desviaciones estandar' % Se pone el umbral de desviaciones estandar que se usara para dividir los datos
       Tipo_Clases=1;
     case 'Cuantiles' % Se pone el numero de cuantiles que se usara
       Tipo_Clases=2;  
     case 'Intervalos iguales' % El numero de intervalor para dividirlos, tendran igual tamaño los intervalos
       Tipo_Clases=3; 
 end 
Umbral_Clases=str2double(get(handles.edit18,'String'));
[Mapa_Conjunta]=Distri_Multivariada(Matriz_Mapas_Geomorfologia(:,[i j]),Umbrales(:,[i j]),Dem.Z,Coor_Y,Coor_X,NoData,Tipo_Clases,Umbral_Clases);
Mapa_Conjunta = GRIDobj(X_dem,Y_dem,Mapa_Conjunta);
GRIDobj2ascii(Mapa_Conjunta,[Ruta_Res Titulo '_Mapa_Bivariado.asc']);
    end
end

else
end
clear Mapa_Conjunta
%% Se realiza el analisis de componentes principales
% Se estandariza los datos
Realiza_ACP=(get(handles.checkbox45,'Value')); % Se revisa si se realiza el analisis bivariado
if Realiza_ACP==1
'Componentes ppales'   
[n m] = size(Matriz_Mapas_Geomorfologia);
AMean=mean(Matriz_Mapas_Geomorfologia);
AStd=std(Matriz_Mapas_Geomorfologia);
Matriz_Mapas_Geomorfologia_Estan = (Matriz_Mapas_Geomorfologia - repmat(AMean,[n 1])) ./ repmat(AStd,[n 1]);
[Componentes_Principales,COEFF_ACP,Componentes_Principales_Vectores,latent,Varianza]= PCA_mapas(Matriz_Mapas_Geomorfologia_Estan,Dem.Z,Coor_X,Coor_Y);
for i=1:size(Componentes_Principales,3)
Componente = GRIDobj(X_dem,Y_dem,Componentes_Principales(:,:,i));
GRIDobj2ascii(Componente,[Ruta_Res 'Componente_Ppal_' num2str(i) '.asc']);
end
%Se exportan los coeficientes (COEFF_ACP y la varianza
Guardar_Reporte=(get(handles.checkbox46,'Value')); % Se revisa si se realiza el analisis bivariado
if Guardar_Reporte==1
csvwrite([Ruta_Res 'COEFF_ACP'],COEFF_ACP);
csvwrite([Ruta_Res 'Varianza_ACP'],Varianza);
end

else
end
clear Componente
%% Se realiza el analisis exploratorio
% Se realiza un zonal statistic el grupo sera el HAND y la variable seran
% los demas mapas.
Realiza_Analisis_Exploratorio=(get(handles.checkbox47,'Value')); % Se revisa si se realiza el analisis bivariado
if Realiza_Analisis_Exploratorio==1
for i=1:size(Matriz_Mapas_Geomorfologia,2)
Titulo=[char(Etiqueta_Ejes(4)) ' VS ' char(Etiqueta_Ejes(i))];
[Vector_Correlacion_X,Vector_Correlacion_C]=Grafica_Correlacion(Matriz_Mapas_Geomorfologia(:,[4 i]),Umbrales(:,[4 i]),NoData,Titulo,char(Etiqueta_Ejes(4)),char(Etiqueta_Ejes(i)),Ruta_Res);
end
end

%% Se realiza el calculo de los mapas con frecuencias multivariadas
% para que las coincidencias sean mas recurrentes, es preferible redondiar
% la magnitud de los mapas
Realiza_frecuencia_multivariada=(get(handles.checkbox52,'Value')); % Se revisa si se realiza el analisis bivariado
if Realiza_frecuencia_multivariada==1
    'Realizando matriz multivariada'
% Se crea una matriz con las variables que se desea realizar el mapa de
% frecuencias multivariadas
    Lectura_Multi(1)=(get(handles.checkbox53,'Value')); Lectura_Multi(2)=(get(handles.checkbox57,'Value'));
    Lectura_Multi(3)=(get(handles.checkbox56,'Value'));
    Lectura_Multi(4)=(get(handles.checkbox54,'Value')); Lectura_Multi(5)=(get(handles.checkbox58,'Value'));
    Lectura_Multi(6)=(get(handles.checkbox59,'Value')); Lectura_Multi(7)=(get(handles.checkbox62,'Value'));
    Lectura_Multi(8)=(get(handles.checkbox60,'Value')); Lectura_Multi(9)=(get(handles.checkbox63,'Value'));

% Se eliminan las columnas(variables) que no se tienen en cuenta para el
% analisis
for i=size(Lectura_Multi,2):-1:1
    if Lectura_Multi(i)==0
        Matriz_Mapas_Geomorfologia(:,i)=[];
        Umbrales(i)=[];
    end
end
% Se pregunta que tipo de analisis se realizara para la dicisión de las clases de las frecuencias (Se agrupan los mapas inicialmente y despues se realizan los histogramas), Tipo1: Desviaciones
% Estandar, Tipo 2: Quantiles, Tipo 3: Definidas por el usuario
Metodo_Clases = get(handles.popupmenu3,'String'); 
popupmenu3value = Metodo_Clases{get(handles.popupmenu3,'Value')};
 switch popupmenu3value
     case 'Desviaciones estandar' % Se pone el umbral de desviaciones estandar que se usara para dividir los datos
       Tipo_Clases=1;
     case 'Cuantiles' % Se pone el numero de cuantiles que se usara
       Tipo_Clases=2;  
     case 'Intervalos iguales' % El numero de intervalor para dividirlos, tendran igual tamaño los intervalos
       Tipo_Clases=3; 
 end 
 Umbral_Clases=str2double(get(handles.edit19,'String'));


[Mapa_Frecuencias_Multivariada]=Distri_Multivariada(Matriz_Mapas_Geomorfologia(:,:),Umbrales(:,:),Dem.Z,Coor_Y,Coor_X,NoData,Tipo_Clases,Umbral_Clases);
Mapa_Frecuencias_Multivariada = GRIDobj(X_dem,Y_dem,Mapa_Frecuencias_Multivariada);
GRIDobj2ascii(Mapa_Frecuencias_Multivariada,[Ruta_Res 'Mapa_Frecuencias_Multivariada.asc']);
end
clear all
toc





% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox20.
function checkbox20_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox20


% --- Executes on button press in checkbox32.
function checkbox32_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox32


% --- Executes on button press in checkbox31.
function checkbox31_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox31


% --- Executes on button press in checkbox30.
function checkbox30_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox30


% --- Executes on button press in checkbox29.
function checkbox29_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox29


% --- Executes on button press in checkbox28.
function checkbox28_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox28


% --- Executes on button press in checkbox27.
function checkbox27_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox27


% --- Executes on button press in checkbox26.
function checkbox26_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox26


% --- Executes on button press in checkbox25.
function checkbox25_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox25


% --- Executes on button press in checkbox24.
function checkbox24_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox24


% --- Executes on button press in checkbox23.
function checkbox23_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox23


% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox22


% --- Executes on button press in checkbox21.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox21


% --- Executes on button press in checkbox45.
function checkbox45_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox45


% --- Executes on button press in checkbox46.
function checkbox46_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox46


% --- Executes on button press in checkbox44.
function checkbox44_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox44


% --- Executes on button press in checkbox43.
function checkbox43_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox43


% --- Executes on button press in checkbox42.
function checkbox42_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox42


% --- Executes on button press in checkbox41.
function checkbox41_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox41


% --- Executes on button press in checkbox40.
function checkbox40_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox40


% --- Executes on button press in checkbox39.
function checkbox39_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox39


% --- Executes on button press in checkbox38.
function checkbox38_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox38


% --- Executes on button press in checkbox37.
function checkbox37_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox37


% --- Executes on button press in checkbox36.
function checkbox36_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox36


% --- Executes on button press in checkbox35.
function checkbox35_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox35


% --- Executes on button press in checkbox34.
function checkbox34_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox34


% --- Executes on button press in checkbox33.
function checkbox33_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox33


% --- Executes on button press in checkbox51.
function checkbox51_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox51


% --- Executes on button press in checkbox50.
function checkbox50_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox50


% --- Executes on button press in checkbox47.
function checkbox47_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox47


% --- Executes on button press in checkbox48.
function checkbox48_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox48


% --- Executes on button press in checkbox49.
function checkbox49_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox49


% --- Executes on button press in checkbox52.
function checkbox52_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox52


% --- Executes on button press in checkbox53.
function checkbox53_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox53


% --- Executes on button press in checkbox54.
function checkbox54_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox54


% --- Executes on button press in checkbox55.
function checkbox55_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox55


% --- Executes on button press in checkbox56.
function checkbox56_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox56


% --- Executes on button press in checkbox57.
function checkbox57_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox57


% --- Executes on button press in checkbox58.
function checkbox58_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox58


% --- Executes on button press in checkbox59.
function checkbox59_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox59


% --- Executes on button press in checkbox60.
function checkbox60_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox60


% --- Executes on button press in checkbox61.
function checkbox61_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox61


% --- Executes on button press in checkbox62.
function checkbox62_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox62


% --- Executes on button press in checkbox63.
function checkbox63_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox63


% --- Executes on button press in checkbox64.
function checkbox64_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox64


% --- Executes on button press in checkbox77.
function checkbox77_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox77



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] =uigetfile
if pathname==0
    return
else
    path=[pathname filename];
end
set(handles.edit15, 'String', path)

% --- Executes on button press in checkbox78.
function checkbox78_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox78



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] =uigetfile
if pathname==0
    return
else
    path=[pathname filename];
end
set(handles.edit16, 'String', path)



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: place code in OpeningFcn to populate axes1


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
