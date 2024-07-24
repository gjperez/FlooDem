function varargout = GUI_Red_Drenaje(varargin)
% GUI_RED_DRENAJE MATLAB code for GUI_Red_Drenaje.fig
%      GUI_RED_DRENAJE, by itself, creates a new GUI_RED_DRENAJE or raises the existing
%      singleton*.
%
%      H = GUI_RED_DRENAJE returns the handle to a new GUI_RED_DRENAJE or the handle to
%      the existing singleton*.
%
%      GUI_RED_DRENAJE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_RED_DRENAJE.M with the given input arguments.
%
%      GUI_RED_DRENAJE('Property','Value',...) creates a new GUI_RED_DRENAJE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Red_Drenaje_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Red_Drenaje_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Red_Drenaje

% Last Modified by GUIDE v2.5 11-May-2014 13:51:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Red_Drenaje_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Red_Drenaje_OutputFcn, ...
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


% --- Executes just before GUI_Red_Drenaje is made visible.
function GUI_Red_Drenaje_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Red_Drenaje (see VARARGIN)

% Choose default command line output for GUI_Red_Drenaje
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Red_Drenaje wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Red_Drenaje_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
varargout{1} = handles.output;
axes(handles.axes10) 
handles.imagen=imread('UNAL.png'); 
imagesc(handles.imagen) 
axis off 

axes(handles.axes9) 
handles.imagen=imread('Logo_Codigo.png'); 
imagesc(handles.imagen) 
axis off 


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1



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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double



% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
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
%% Aqui se pone el Codigo Completo
tic
pwd
addpath([pwd '/Codigos_Anexados_TopoToolbox']);
%% Se define la ruta de guardado
% ruta de escritura
Ruta_Res=get(handles.edit10,'String');
NoData=str2double(get(handles.edit21,'String'));
%% Se realiza la lectura de los mapas de entrada, inicialmente se realizara 
% Lectura del MDT, dirección y red_hidrografia
'CARGANDO MAPAS DE ENTRADA'
Ruta_MDT=get(handles.edit1,'String');
Ruta_red_hidrografia=get(handles.edit2,'String');
'CARGANDO DEM'
[Dem,X_dem,Y_dem] = rasterread(Ruta_MDT);
Dem=GRIDobj(Ruta_MDT); % Se carga el DEM
'CARGANDO RED'
Red_hidro=GRIDobj(Ruta_red_hidrografia);

%% Se define el valor de NoData, se lee del mismo archivo
Red_hidro.Z(isnan(Dem.Z)==1)=NoData;
Red_hidro.Z(Red_hidro.Z==0)=NoData;

%% Se calcula el mapa de Dirección, Acumulación y Red de drenaje
'CALCULANDO DIRECCIÓN, ACUMULACIÓN Y RED - SIN QUEMAR'

Umbral=str2double(get(handles.edit11,'String'));Umbral=ceil((Umbral*1000*1000/900));
'Realizando Fill y calculando mapa de direcciones'
% Se estipula que opción se desea emplear para el procesamiento de zonas
% planas, [Ninguno, cross, route]

Metodo_Flats = get(handles.popupmenu2,'String'); 
popupmenu2value = Metodo_Flats{get(handles.popupmenu2,'Value')};
 switch popupmenu2value
     case 'Ninguno'
       Fill_Dem=fillsinks(Dem);
       FD = FLOWobj(Dem,'preprocess','fill');
     case 'Geodesic'
       Fill_Dem=fillsinks(Dem);
       Dir_Geodesic = flowdir(X_dem,Y_dem,Fill_Dem.Z,'routeflats','geodesic','type','single');
       FD = FLOWobj(Dir_Geodesic,'cellsize',Dem.cellsize,'size',Dem.size,'refmat',Dem.refmat);  
     case 'Route'
       Fill_Dem=fillsinks(Dem);
       Dir_route = flowdir(X_dem,Y_dem,Fill_Dem.Z,'routeflats','route','type','single');
       FD = FLOWobj(Dir_route,'cellsize',Dem.cellsize,'size',Dem.size,'refmat',Dem.refmat);  
 end       
Guarda_Fill=(get(handles.checkbox1,'Value'));
if Guarda_Fill==1
 GRIDobj2ascii(Fill_Dem,[Ruta_Res 'Fill_Dem.asc']);
else   
end
D8_ArcGis = FLOWobj2GRIDobj(FD);
D8_ArcGis.Z=double(D8_ArcGis.Z);
D8_ArcGis.Z(isnan(Dem.Z)==1)=NaN;
Guarda_D8=(get(handles.checkbox8,'Value'));
if Guarda_D8==1
 GRIDobj2ascii(D8_ArcGis,[Ruta_Res 'Direccion_D8.asc']);
else   
end
clear D8_ArcGis
'Calculando el mapa de acumulación'
As = flowacc(FD); 
As.Z=double(As.Z);
As.Z(isnan(Dem.Z)==1)=NaN;
Guarda_Acu=(get(handles.checkbox9,'Value'));
if Guarda_Acu==1
 GRIDobj2ascii(As,[Ruta_Res 'Acu.asc']);
else   
end
'Definiendo Red de drenaje con Umbral predeterminado'
Red = As;
Red.Z(As.Z >= Umbral)=1;Red.Z(As.Z < Umbral)=NaN;
Red.Z=double(Red.Z);
Red.Z(isnan(Dem.Z)==1)=NaN;
Guarda_Red=(get(handles.checkbox10,'Value'));
if Guarda_Red==1
 GRIDobj2ascii(Red,[Ruta_Res 'Red_Sin_Burn.asc']);
else   
end




%% Se ejecuta el algoritmo para modificar los valores de Elevacion en el DEM para garantizar la misma red de drenjae de la hidrografia

%% Se reclasifica toda la red de la hidrografia, para poder localizar, cual es la red principal
% y poder localizar tambien el punto de mas aguas abajo de la red  principal. LISTOOO!!!
'RECLASIFICANDO LA RED DE DRENAJE'
%Escribir_Red_Clasi=(get(handles.checkbox6,'Value'));
set(0,'RecursionLimit',5000)
[Red_Clasificada]= Clasificacion_Red2(Red_hidro.Z);
Red_Clasificada = GRIDobj(X_dem,Y_dem,Red_Clasificada);
Red_Clasificada.Z=double(Red_Clasificada.Z);
Red_Clasificada.Z(isnan(Dem.Z)==1)=NaN; Red_Clasificada.Z(Red_Clasificada.Z==0)=NaN;
Guarda_Red_Clas=(get(handles.checkbox22,'Value'));
if Guarda_Red_Clas==1
 GRIDobj2ascii(Red_Clasificada,[Ruta_Res 'Red_Clasificada.asc']);
else   
end

% %% Función que genera una matriz de distancias a la Red de drenaje, con esta se puede emplear para extraer el Buffer de cualqueir distancia
% 'CREANDO MAPA DE DISTANCIAS A LA RED'
% S = STREAMobj(FD,flowacc(FD)>Umbral);
% Distancias_Red = flowdistance(FD,S);
% Distancias_Red.Z=double(Distancias_Red.Z);
% Distancias_Red.Z(isnan(Dem.Z)==1)=NaN;
% GRIDobj2ascii(Distancias_Red,[Ruta_Res 'Distancias_Flujo_Red.asc']);

% Función que calcula la distancia eucludiana a la red de drenaje
Red_hidro.Z(isnan(Red_hidro.Z)==1)=NoData;
Distancias=Distancia_Red(Red_hidro.Z,NoData,Dem.cellsize);
Distancias = GRIDobj(X_dem,Y_dem,Distancias);
Distancias.Z=double(Distancias.Z);
Distancias.Z(isnan(Dem.Z)==1)=NaN;
Guarda_Distancias=(get(handles.checkbox21,'Value'));
if Guarda_Distancias==1
 GRIDobj2ascii(Distancias,[Ruta_Res 'Distancias_Red.asc']);
else   
end

%% Función que quema la red de drenaje, garantizando las direcciones y modificando lo menos posible el MDT
'QUEMANDO RED PRINCIPAL'
%Escribir_Dem_burn=(get(handles.checkbox1,'Value'));
Incisado=str2double(get(handles.edit22,'String'));
Delta_caida=str2double(get(handles.edit3,'String'));
Epsilon_min=str2double(get(handles.edit5,'String')); % Diferencias mayores a Epsilon_min metros no se realizara corrección (de aguas abajo a aguas arriba)
Alpha_min=str2double(get(handles.edit4,'String')); % Diferencias mayores a Epsilon_min metros no se realizara corrección (de aguas arriba a aguas abajo)
Red_Clasificada.Z(isnan(Red_Clasificada.Z)==1)=NoData;
[Dem_Burn,Contador_Clases,Pos_AAb_Red,Matriz_chequeo]=Burning3_Dem(Dem.Z,Red_Clasificada.Z,NoData,Incisado,Delta_caida,Epsilon_min,Alpha_min);



%% Función que quema la red de drenaje, garantizando las direcciones y modificando lo menos posible el MDT, en un area aferente
'QUEMANDO BUFFER'
Buffer_Burn=str2double(get(handles.edit9,'String')); % Son numero de celdas
Distancia_Buffer=Buffer_Burn*Dem.cellsize;
Numero_de_rutas=str2double(get(handles.edit23,'String'));
%Escribir_Dem_burn_Buffer=(get(handles.checkbox2,'Value'));
Delta_Definido1=str2double(get(handles.edit7,'String'));  % La diferencia es adversa, Epsilon
Delta_Definido2=str2double(get(handles.edit8,'String')); % Mucha diferencia, Alpha
Delta_Niivel=str2double(get(handles.edit6,'String'));
Dem_Burn(isnan(Dem_Burn)==1)=NoData; Red_hidro.Z(isnan(Red_hidro.Z)==1)=NoData; Distancias.Z(isnan(Distancias.Z)==1)=NoData;
[Dem_Burn_Buffer,Dem_Chequeo_Burn]=Burning_Buffer_Dem(Dem_Burn,Red_hidro.Z,Distancias.Z,NoData,Distancia_Buffer,Buffer_Burn,Numero_de_rutas,Delta_Definido1,Delta_Definido2,Delta_Niivel);

%% Se vulve a definir el NaN como no Nadata para Red_hidro
Red_hidro.Z(Red_hidro.Z==NoData)=NaN;

%% Se deriva la red del Dem_Burn y el dem Burn_Buffer
'GENERANDO REDES DEL BURN'
Dem.Z(Dem.Z==NoData)=NaN;Dem_Burn(Dem_Burn==NoData)=NaN; Dem_Burn_Buffer(Dem_Burn_Buffer==NoData)=NaN;
Escribir_Acu=0;
%Escribir_Red_Burn=(get(handles.checkbox3,'Value'));
%Escribir_Red_Burn_Buffer=(get(handles.checkbox4,'Value'));

'Realizando Fill y calculando mapa de direcciones empleando Burn y Burn Buffer'
Dem_Burn = GRIDobj(X_dem,Y_dem,Dem_Burn);
FD_Burn = FLOWobj(Dem_Burn,'preprocess','fill');
Dem_Burn.Z=double(Dem_Burn.Z);
Dem_Burn.Z(isnan(Dem.Z)==1)=NaN;
Guarda_Dem_Burn=(get(handles.checkbox19,'Value'));
if Guarda_Dem_Burn==1
 GRIDobj2ascii(Dem_Burn,[Ruta_Res 'Dem_Burn.asc']);
else   
end
Fill_Dem_Burn=fillsinks(Dem_Burn);
Guarda_Dem_Burn_Fill=(get(handles.checkbox11,'Value'));
if Guarda_Dem_Burn_Fill==1
 GRIDobj2ascii(Fill_Dem_Burn,[Ruta_Res 'Dem_Burn_Fill.asc']);
else   
end
Dem_Burn_Buffer = GRIDobj(X_dem,Y_dem,Dem_Burn_Buffer);
FD_Burn_Buffer = FLOWobj(Dem_Burn_Buffer,'preprocess','fill');
Dem_Burn_Buffer.Z=double(Dem_Burn_Buffer.Z);
Dem_Burn_Buffer.Z(isnan(Dem.Z)==1)=NaN;
Guarda_Dem_Burn_Buffer=(get(handles.checkbox20,'Value'));
if Guarda_Dem_Burn_Buffer==1
 GRIDobj2ascii(Dem_Burn_Buffer,[Ruta_Res 'Dem_Burn_Buffer.asc']);
else   
end
Fill_Dem_Burn_Buffer=fillsinks(Dem_Burn_Buffer);
Guarda_Dem_Burn_Fill_Buffer=(get(handles.checkbox15,'Value'));
if Guarda_Dem_Burn_Fill_Buffer==1
 GRIDobj2ascii(Fill_Dem_Burn_Buffer,[Ruta_Res 'Dem_Burn_Fill_Buffer.asc']);
else   
end
'Calculando el mapa de acumulación'
D8_ArcGis = FLOWobj2GRIDobj(FD_Burn);
D8_ArcGis.Z=double(D8_ArcGis.Z);
D8_ArcGis.Z(isnan(Dem.Z)==1)=NaN;
Guarda_D8_Burn=(get(handles.checkbox12,'Value'));
if Guarda_D8_Burn==1
 GRIDobj2ascii(D8_ArcGis,[Ruta_Res 'Direccion_D8_Burn.asc']);
else   
end
clear D8_ArcGis
As_Burn = flowacc(FD_Burn);
As_Burn.Z=double(As_Burn.Z);
As_Burn.Z(isnan(Dem.Z)==1)=NaN;
Guarda_Acu_Burn=(get(handles.checkbox13,'Value'));
if Guarda_Acu_Burn==1
 GRIDobj2ascii(As_Burn,[Ruta_Res 'Acu_Burn.asc']);
else   
end

D8_ArcGis = FLOWobj2GRIDobj(FD_Burn_Buffer);
D8_ArcGis.Z=double(D8_ArcGis.Z);
D8_ArcGis.Z(isnan(Dem.Z)==1)=NaN;
Guarda_D8_Burn_Buffer=(get(handles.checkbox16,'Value'));
if Guarda_D8_Burn_Buffer==1
 GRIDobj2ascii(D8_ArcGis,[Ruta_Res 'Direccion_D8_Burn_Buffer.asc']);
else   
end
clear D8_ArcGis
As_Burn_Buffer = flowacc(FD_Burn_Buffer); 
As_Burn_Buffer.Z=double(As_Burn_Buffer.Z);
As_Burn_Buffer.Z(isnan(Dem.Z)==1)=NaN;
Guarda_Acu_Burn_Buffer=(get(handles.checkbox17,'Value'));
if Guarda_Acu_Burn_Buffer==1
 GRIDobj2ascii(As_Burn,[Ruta_Res 'Acu_Burn_Buffer.asc']);
else   
end
'Definiendo Red de drenaje con Umbral predeterminado'
Red_Burn = As_Burn;
Red_Burn.Z(As_Burn.Z >= Umbral)=1;Red_Burn.Z(As_Burn.Z < Umbral)=NaN;
Red_Burn.Z=double(Red_Burn.Z);
Red_Burn.Z(isnan(Dem.Z)==1)=NaN;
Guarda_Red_Burn=(get(handles.checkbox14,'Value'));
if Guarda_Red_Burn==1
 GRIDobj2ascii(Red_Burn,[Ruta_Res 'Red_Burn_Red.asc']);
else   
end


Red_Burn_Buffer = As_Burn_Buffer;
Red_Burn_Buffer.Z(As_Burn_Buffer.Z >= Umbral)=1;Red_Burn_Buffer.Z(As_Burn_Buffer.Z < Umbral)=NaN;
Red_Burn_Buffer.Z=double(Red_Burn_Buffer.Z);
Red_Burn_Buffer.Z(isnan(Dem.Z)==1)=NaN;
Guarda_Red_Burn_Buffer=(get(handles.checkbox18,'Value'));
if Guarda_Red_Burn_Buffer==1
 GRIDobj2ascii(Red_Burn_Buffer,[Ruta_Res 'Red_Burn_Red_Buffer.asc']);
else   
end


% Se pueden mostrar los reuslatdos con el comando geoshow
%% Se calculan los errores de las redes de drenajes derivada con respecto a la real
Distancia_Analisis=500;
[Coincidencia_Porcentual_Red]=Error_Red(Red_hidro.Z,Red.Z,Distancias.Z,Distancia_Analisis,Dem.cellsize);
[Coincidencia_Porcentual_Red_Burn]=Error_Red(Red_hidro.Z,Red_Burn.Z,Distancias.Z,Distancia_Analisis,Dem.cellsize);
[Coincidencia_Porcentual_Red_Burn_Buffer]=Error_Red(Red_hidro.Z,Red_Burn_Buffer.Z,Distancias.Z,Distancia_Analisis,Dem.cellsize);

%%Auxiliar=Distancia_Analisis/Dem.cellsize;

scrz=get(0,'screensize');
figura=figure('position',[100 100 scrz(3)/1.8 scrz(4)/2]);
set(gcf,'color','white')
Auxiliar=Distancia_Analisis/Dem.cellsize;
Auxiliar=ceil(Auxiliar);
Vector_X(1,1)=0;
for i=1:Auxiliar
   Vector_X(i+1,1)=Dem.cellsize*i; 
end
Titulo='Coincidencia Red de drenaje derivada VS Hidrografia';
 % Cambia el fondo
    %set(gcf,'color','white')
plot(Vector_X,Coincidencia_Porcentual_Red,'LineWidth',2); title(Titulo,'fontsize',12,'fontweight','bold'); ylabel('Coincidencia %','fontsize',10,'fontweight','bold'),xlabel('Distancia a la Hidrografia (m)','fontsize',10,'fontweight','bold'); hold on
plot(Vector_X,Coincidencia_Porcentual_Red_Burn,'g','LineWidth',2);
plot(Vector_X,Coincidencia_Porcentual_Red_Burn_Buffer,'y','LineWidth',2);
h = legend('Coincidencia % Red','Coincidencia % Red Burn','Coincidencia % Red Burn Buffer',1,'location','best');
set(h,'Interpreter','none')
i=getframe(figura);
Ruta_G=[Ruta_Res 'Grafica.jpg'];
imwrite(i.cdata,Ruta_G);
close

%% Función que grafica los resultados
% Vector X ( Distancia de analisis)
Auxiliar=Distancia_Analisis/Dem.cellsize;
Auxiliar=ceil(Auxiliar);
Vector_X(1,1)=0;
for i=1:Auxiliar
   Vector_X(i+1,1)=Dem.cellsize*i; 
end
axes(handles.axes1)
Titulo='Coincidencia Red de drenaje derivada VS Hidrografia';
 % Cambia el fondo
    %set(gcf,'color','white')
plot(handles.axes1,Vector_X,Coincidencia_Porcentual_Red,'LineWidth',2); title(handles.axes1,Titulo,'fontsize',12,'fontweight','bold'); ylabel(handles.axes1,'Coincidencia %','fontsize',10,'fontweight','bold'),xlabel(handles.axes1,'Distancia a la Hidrografia (m)','fontsize',10,'fontweight','bold'); hold on
plot(handles.axes1,Vector_X,Coincidencia_Porcentual_Red_Burn,'g','LineWidth',2);
plot(handles.axes1,Vector_X,Coincidencia_Porcentual_Red_Burn_Buffer,'y','LineWidth',2);
h = legend(handles.axes1,'Coincidencia % Red','Coincidencia % Red Burn','Coincidencia % Red Burn Buffer',1,'location','best');
set(h,'Interpreter','none')

%% Función que calcula las diferencias del DEM modificado, para la red de drenaje y para la zona del Buffer
Distancia=Buffer_Burn*Dem.cellsize;
Distancias.Z(Distancias.Z<=Distancia)=1;
Distancias.Z(Distancias.Z>Distancia)=0;
Resultado_Diferencias=Analisis_Diferencias_DEM(Dem.Z,Dem_Burn.Z,Dem_Burn_Buffer.Z,Red_hidro.Z,Distancias.Z);
set(handles.edit13,'String',Resultado_Diferencias(1,1))  
set(handles.edit14,'String',Resultado_Diferencias(2,1))  
set(handles.edit15,'String',Resultado_Diferencias(3,1))  
set(handles.edit16,'String',Resultado_Diferencias(4,1))  
set(handles.edit17,'String',Resultado_Diferencias(1,2))  
set(handles.edit18,'String',Resultado_Diferencias(2,2))  
set(handles.edit19,'String',Resultado_Diferencias(3,2))  
set(handles.edit20,'String',Resultado_Diferencias(4,2))  

%% Aqui termina el Codigo
toc

guidata(hObject,handles);

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Metodo_Flats = get(handles.popupmenu2,'String'); 
 popupmenu2value = Metodo_Flats{get(handles.popupmenu2,'Value')};

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



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double

% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
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
set(handles.edit10, 'String', path)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] =uigetfile
if pathname==0
    return
else
    path=[pathname filename];
end
set(handles.edit1, 'String', path)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] =uigetfile
if pathname==0
    return
else
    path=[pathname filename];
end
set(handles.edit2, 'String', path)



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold off 


% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox18


% --- Executes on button press in checkbox17.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox17


% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16


% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox15


% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14


% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in checkbox20.
function checkbox20_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox20


% --- Executes on button press in checkbox19.
function checkbox19_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox19


% --- Executes on button press in checkbox21.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox21


% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox22
