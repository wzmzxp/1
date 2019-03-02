function varargout = chazhi(varargin)
% CHAZHI MATLAB code for chazhi.fig
%      CHAZHI, by itself, creates a new CHAZHI or raises the existing
%      singleton*.
%
%      H = CHAZHI returns the handle to a new CHAZHI or the handle to
%      the existing singleton*.
%
%      CHAZHI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAZHI.M with the given input arguments.
%
%      CHAZHI('Property','Value',...) creates a new CHAZHI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chazhi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chazhi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chazhi

% Last Modified by GUIDE v2.5 15-Jul-2018 17:43:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chazhi_OpeningFcn, ...
                   'gui_OutputFcn',  @chazhi_OutputFcn, ...
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


% --- Executes just before chazhi is made visible.
function chazhi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chazhi (see VARARGIN)

% Choose default command line output for chazhi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chazhi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chazhi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
temp=handles.checkbox1.Value;
axes(handles.axes1)
switch temp
    case 1
        grid on;
    case 0
        grid off;
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=uisetcolor([0 0 0]);
axes(handles.axes1)
handles.axes1.Color=c;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=uisetcolor([0 0 0]);
axes(handles.axes1)
handles.axes1.Children(2).Color=c;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
cla;
handles.uitable1.Data=[0,0];

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sel=questdlg('确定要退出吗？','退出','我要退','不退','不要管我','我要退');
switch sel
    case '我要退'
        close;
    case '不退'
    case '不要管我'
end


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y
[filename,pathname]=uigetfile({'*.txt','*.txt';'*.dat','*.dat'},'打开文件');
name=[pathname,filename];
fid=fopen(name,'r');
data=fscanf(fid,'%f');
x=data(1:2:end-1);
y=data(2:2:end);
axes(handles.axes1)
plot(x,y,'o')


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global x y
if isempty(x) || isempty(y)
    warndlg('数据为空');
    return;
end
if handles.radiobutton1.Value == 1
    %拉格朗日插值
    [X,Y]=lagrange(x,y);
    axes(handles.axes1)
    plot(X,Y,x,y,'o');
    %设置网格
    temp=handles.checkbox1.Value;
    switch temp
        case 1
            grid on;
        case 0
            grid off;
    end
    %设置UITABLE数据
    handles.uitable1.Data=[X(:),Y(:)];
end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global x y
if isempty(x) || isempty(y)
    warndlg('数据为空');
    return;
end
if handles.radiobutton2.Value == 1
    %牛顿
    [X,Y]=newton(x,y);
    axes(handles.axes1)
    plot(X,Y,x,y,'*');
    %设置网格
    temp=handles.checkbox1.Value;
    switch temp
        case 1
            grid on;
        case 0
            grid off;
    end
    %设置UITABLE数据
    handles.uitable1.Data=[X(:),Y(:)];
end
