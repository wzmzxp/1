function varargout = sv(varargin)
% SV MATLAB code for sv.fig
%      SV, by itself, creates a new SV or raises the existing
%      singleton*.
%
%      H = SV returns the handle to a new SV or the handle to
%      the existing singleton*.
%
%      SV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SV.M with the given input arguments.
%
%      SV('Property','Value',...) creates a new SV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sv_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sv_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sv

% Last Modified by GUIDE v2.5 15-Jul-2018 16:21:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sv_OpeningFcn, ...
                   'gui_OutputFcn',  @sv_OutputFcn, ...
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


% --- Executes just before sv is made visible.
function sv_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sv (see VARARGIN)

% Choose default command line output for sv
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sv wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sv_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function dakai_Callback(hObject, eventdata, handles)
% hObject    handle to dakai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic
[filename,pathname]=uigetfile({'*.jpg','*.jpg';'*.png','*.png'},'打开');
if isequal(filename,0)|| isequal(pathname,0)
    return;
end
name=[pathname,filename];
pic=imread(name);
axes(handles.axes1);
imshow(pic);
% --------------------------------------------------------------------
function baocun_Callback(hObject, eventdata, handles)
% hObject    handle to baocun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A
[filename,pathname]=uiputfile({'*.jpg','*.jpg';'*.png','*.png'},'打开');
name=[pathname,filename];
imwrite(A,name)

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global pic A
yasuo=handles.slider1.Value;
A=svd_pic(pic,yasuo);
axes(handles.axes2)
imshow(A)

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
