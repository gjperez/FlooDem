function varargout = GIU_FLOODEM(varargin)
% GIU_FLOODEM MATLAB code for GIU_FLOODEM.fig
%      GIU_FLOODEM, by itself, creates a new GIU_FLOODEM or raises the existing
%      singleton*.
%
%      H = GIU_FLOODEM returns the handle to a new GIU_FLOODEM or the handle to
%      the existing singleton*.
%
%      GIU_FLOODEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GIU_FLOODEM.M with the given input arguments.
%
%      GIU_FLOODEM('Property','Value',...) creates a new GIU_FLOODEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GIU_FLOODEM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GIU_FLOODEM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GIU_FLOODEM

% Last Modified by GUIDE v2.5 11-May-2014 13:40:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GIU_FLOODEM_OpeningFcn, ...
                   'gui_OutputFcn',  @GIU_FLOODEM_OutputFcn, ...
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


% --- Executes just before GIU_FLOODEM is made visible.
function GIU_FLOODEM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GIU_FLOODEM (see VARARGIN)

% Choose default command line output for GIU_FLOODEM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GIU_FLOODEM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GIU_FLOODEM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
axes(handles.axes4) 
handles.imagen=imread('UNAL.png'); 
imagesc(handles.imagen) 
axis off 

axes(handles.axes2) 
handles.imagen=imread('Logo_Codigo.png'); 
imagesc(handles.imagen) 
axis off 



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pwd
addpath([pwd '/Red_Drenaje']);
GUI_Red_Drenaje


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pwd
addpath([pwd '/Analisis_Geomorfologico']);
GUI_Geomorfologia

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pwd
addpath([pwd '/Inundaciones']);
GUI_Inundaciones
