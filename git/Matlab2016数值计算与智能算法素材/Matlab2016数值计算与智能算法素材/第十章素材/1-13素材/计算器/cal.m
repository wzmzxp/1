function varargout = cal(varargin)
% CAL MATLAB code for cal.fig
%      CAL, by itself, creates a new CAL or raises the existing
%      singleton*.
%
%      H = CAL returns the handle to a new CAL or the handle to
%      the existing singleton*.
%
%      CAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAL.M with the given input arguments.
%
%      CAL('Property','Value',...) creates a new CAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cal

% Last Modified by GUIDE v2.5 13-Jul-2018 19:44:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cal_OpeningFcn, ...
                   'gui_OutputFcn',  @cal_OutputFcn, ...
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


% --- Executes just before cal is made visible.
function cal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cal (see VARARGIN)

% Choose default command line output for cal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cal wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global ch
ch=[];
%% 数字0
[num0_y,num0_fs]=audioread('num0.ogg');
setappdata(handles.figure1,'num0_y',num0_y);
setappdata(handles.figure1,'num0_fs',num0_fs);
%% 数字2
[num2_y,num2_fs]=audioread('num2.ogg');
setappdata(handles.figure1,'num2_y',num2_y);
setappdata(handles.figure1,'num2_fs',num2_fs);

%% 数字1
[num1_y,num1_fs]=audioread('num1.ogg');
setappdata(handles.figure1,'num1_y',num1_y);
setappdata(handles.figure1,'num1_fs',num1_fs);
%% 数字3
[num3_y,num3_fs]=audioread('num3.ogg');
setappdata(handles.figure1,'num3_y',num3_y);
setappdata(handles.figure1,'num3_fs',num3_fs);
%% 数字4
[num4_y,num4_fs]=audioread('num4.ogg');
setappdata(handles.figure1,'num4_y',num4_y);
setappdata(handles.figure1,'num4_fs',num4_fs);
%% 数字5
[num5_y,num5_fs]=audioread('num5.ogg');
setappdata(handles.figure1,'num5_y',num5_y);
setappdata(handles.figure1,'num5_fs',num5_fs);
%% 数字6
[num6_y,num6_fs]=audioread('num6.ogg');
setappdata(handles.figure1,'num6_y',num6_y);
setappdata(handles.figure1,'num6_fs',num6_fs);
%% 数字7
[num7_y,num7_fs]=audioread('num7.ogg');
setappdata(handles.figure1,'num7_y',num7_y);
setappdata(handles.figure1,'num7_fs',num7_fs);
%% 数字8
[num8_y,num8_fs]=audioread('num8.ogg');
setappdata(handles.figure1,'num8_y',num8_y);
setappdata(handles.figure1,'num8_fs',num8_fs);
%% 数字9
[num9_y,num9_fs]=audioread('num9.ogg');
setappdata(handles.figure1,'num9_y',num9_y);
setappdata(handles.figure1,'num9_fs',num9_fs);

%% 等于
[equal_y,equal_fs]=audioread('equal.ogg');
setappdata(handles.figure1,'equal_y',equal_y);
setappdata(handles.figure1,'equal_fs',equal_fs);
% --- Outputs from this function are returned to the command line.
function varargout = cal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'1'];
end
num1_y=getappdata(handles.figure1,'num1_y');
num1_fs=getappdata(handles.figure1,'num1_fs');
sound(num1_y,num1_fs);
handles.result.String=ch;



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'2'];
end
num2_y=getappdata(handles.figure1,'num2_y');
num2_fs=getappdata(handles.figure1,'num2_fs');
sound(num2_y,num2_fs);
handles.result.String=ch;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'3'];
end
num3_y=getappdata(handles.figure1,'num3_y');
num3_fs=getappdata(handles.figure1,'num3_fs');
sound(num3_y,num3_fs);
handles.result.String=ch;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'4'];
end
num4_y=getappdata(handles.figure1,'num4_y');
num4_fs=getappdata(handles.figure1,'num4_fs');
sound(num4_y,num4_fs);

handles.result.String=ch;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'5'];
end
num5_y=getappdata(handles.figure1,'num5_y');
num5_fs=getappdata(handles.figure1,'num5_fs');
sound(num5_y,num5_fs);
handles.result.String=ch;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'6'];
end
num6_y=getappdata(handles.figure1,'num6_y');
num6_fs=getappdata(handles.figure1,'num6_fs');
sound(num6_y,num6_fs);
handles.result.String=ch;

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'7'];
end
num7_y=getappdata(handles.figure1,'num7_y');
num7_fs=getappdata(handles.figure1,'num7_fs');
sound(num7_y,num7_fs);

handles.result.String=ch;

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'8'];
end

num8_y=getappdata(handles.figure1,'num8_y');
num8_fs=getappdata(handles.figure1,'num8_fs');
sound(num8_y,num8_fs);
handles.result.String=ch;

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'9'];
end
num9_y=getappdata(handles.figure1,'num9_y');
num9_fs=getappdata(handles.figure1,'num9_fs');
sound(num9_y,num9_fs);

handles.result.String=ch;


% --- Executes on button press in pushbutton0.
function pushbutton0_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'0'];
end
num0_y=getappdata(handles.figure1,'num0_y');
num0_fs=getappdata(handles.figure1,'num0_fs');
sound(num0_y,num0_fs);
handles.result.String=ch;

% --- Executes on button press in add.
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'+'];
end
handles.result.String=ch;

% --- Executes on button press in sub.
function sub_Callback(hObject, eventdata, handles)
% hObject    handle to sub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'-'];
end
handles.result.String=ch;

% --- Executes on button press in mul.
function mul_Callback(hObject, eventdata, handles)
% hObject    handle to mul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'×'];
end
handles.result.String=ch;

% --- Executes on button press in div.
function div_Callback(hObject, eventdata, handles)
% hObject    handle to div (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'÷'];
end
handles.result.String=ch;

% --- Executes on button press in cal.
function cal_Callback(hObject, eventdata, handles)
% hObject    handle to cal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if ch(end) == '+' || ch(end) == '-'||ch(end) == '×'||ch(end) == '÷'||ch(end) == '.'
    ch(end)=[];
end

ch=strrep(ch,'×','*');
ch=strrep(ch,'÷','/');
result=eval(ch);
result_end={ch,['=',num2str(result)]};

equal_y=getappdata(handles.figure1,'equal_y');
equal_fs=getappdata(handles.figure1,'equal_fs');
sound(equal_y,equal_fs);
handles.result.String=result_end;
ch=[];


% --- Executes on button press in dian.
function dian_Callback(hObject, eventdata, handles)
% hObject    handle to dian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'.'];
end
handles.result.String=ch;

% --- Executes on button press in fuhao.
function fuhao_Callback(hObject, eventdata, handles)
% hObject    handle to fuhao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
if length(ch)>30
    warndlg('超出长度','注意');
else
    ch=[ch,'-'];
end
handles.result.String=ch;

% --- Executes on button press in qingchu.
function qingchu_Callback(hObject, eventdata, handles)
% hObject    handle to qingchu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
ch=[];
handles.result.String=ch;



% --- Executes on button press in tuiwei.
function tuiwei_Callback(hObject, eventdata, handles)
% hObject    handle to tuiwei (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ch
ch(end)=[];
handles.result.String=ch;
