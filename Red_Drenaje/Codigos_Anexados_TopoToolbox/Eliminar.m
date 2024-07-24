%% Procedimiento para obtener la matriz de distancia con respecto a la red de drenaje (Buffer)
% Se utiliza los comandos de TopoToolbox
% Se realiza lectura de los mapas
% Se carga el DEM
[dem,X,Y] = rasterread('Dem_planas.asc');
% Se llenan los sumideros
dem=GRIDobj('Dem_planas.asc');
cs  = abs(Y(2)-Y(1));
siz = size(dem);
% Se obtiene la matriz de dispersión para definir la dirección de flujo, se
% tienen dos alternativas flow single (para grandes mapas) y flow multiple
% (para mapas peuqeños)
%Ms = flowdir(X,Y,dem,'type','single'); % Flow single, se usan en la
%versión anterior del TopoToolbox, en esta nueva versión son objetos
%Mm = flowdir(X,Y,dem,'type','multi'); % Flow single
FD = FLOWobj(dem,'preprocess','fill'); % intentar con carve para ver los resultados
D8_ArcGis = FLOWobj2GRIDobj(FD);
D8_ArcGis.Z=double(D8_ArcGis.Z);
D8_ArcGis.Z(isnan(dem.Z)==1)=NaN;
GRIDobj2ascii(D8_ArcGis,'Direccion_D8.asc');
% Se obtiene el mapa de pendientes, empleando los 8 vecinos
G = FLOWobj2gradient(FD,dem);
G.Z=double(G.Z);
G.Z(isnan(dem.Z)==1)=NaN;
GRIDobj2ascii(G,'Slope.asc');

% Se obtiene el mapa de acumulación
As = flowacc(FD); % Apartir del flow single
As.Z=double(As.Z);
As.Z(isnan(dem.Z)==1)=NaN;
GRIDobj2ascii(As,'Acu.asc');
%Am = flowacc(Mm,siz); % Apartir del flow multi
% Se obtienen las cuencas de nuestra zona
DB = drainagebasins(FD);
DB.Z=double(DB.Z);
DB.Z(isnan(dem.Z)==1)=NaN;
GRIDobj2ascii(DB,'Cuencas.asc');

% se obtiene el mapa de distancias con respecto a la red de drenjae, se
% puede definir la distancia con el punto de mas aguas abajo o de mas guas
% arriba. Se emplera con respecto a la Red de drenaje
CHANNEL = As.Z>1000;
%D = flowdistance(FD,X,Y,dem,CHANNEL);
D = flowdistance(FD,CHANNEL);
D.Z=double(D.Z);
D.Z(isnan(dem.Z)==1)=NaN;
GRIDobj2ascii(D,'Distancias_Red.asc');

% Se crea una matriz de distancias sin importar la dirección de flujo
% -PENDIENTE

% Se calcula el HAND
S = STREAMobj(FD,'minarea',1e6,'unit','m');
 DZ = vertdistance2stream(FD,S,dem);
 DZ.Z=double(DZ.Z);
DZ.Z(isnan(dem.Z)==1)=NaN;
GRIDobj2ascii(DZ,'HAND.asc');
%imageschs(D) % Se visualiza con relieve los datos

% Se calcula el TPI

% Se calcula las red de drenaje por medio de otros 3 algoritmos que
% procesan zonas planas
[dem,X,Y] = rasterread('Dem_planas.asc');
dem=GRIDobj('Dem_planas.asc');
dem = fillsinks(dem);
dem=dem.Z;
Dir_Cross = flowdir(X,Y,dem,'routeflats','cross','type','single');
Dir_route = flowdir(X,Y,dem,'routeflats','route','type','single');
Dir_geodesic = flowdir(X,Y,dem,'routeflats','geodesic','type','single');
dem=GRIDobj('Dem_planas.asc');


FD_Cross = FLOWobj(Dir_Cross,'cellsize',dem.cellsize,'size',dem.size,'refmat',dem.refmat);
FD_route = FLOWobj(Dir_route,'cellsize',dem.cellsize,'size',dem.size,'refmat',dem.refmat);
FD_geodesic = FLOWobj(Dir_geodesic,'cellsize',dem.cellsize,'size',dem.size,'refmat',dem.refmat);

As_Cross = flowacc(FD_Cross); % Apartir del flow single
As_Cross.Z=double(As_Cross.Z);
As_Cross.Z(isnan(dem.Z)==1)=NaN;
GRIDobj2ascii(As_Cross,'Acu_Crossss.asc');

As_route = flowacc(FD_route); % Apartir del flow single
As_route.Z=double(As_route.Z);
As_route.Z(isnan(dem.Z)==1)=NaN;
GRIDobj2ascii(As_route,'Ac_routeu.asc');

As_geodesic = flowacc(FD_geodesic); % Apartir del flow single
As_geodesic.Z=double(As_geodesic.Z);
As_geodesic.Z(isnan(dem.Z)==1)=NaN;
GRIDobj2ascii(As_geodesic,'Acu_geodesic.asc');
