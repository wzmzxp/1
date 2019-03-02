function varargout = keshi(varargin)
% KESHI MATLAB code for keshi.fig
%      KESHI, by itself, creates a new KESHI or raises the existing
%      singleton*.
%
%      H = KESHI returns the handle to a new KESHI or the handle to
%      the existing singleton*.
%
%      KESHI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KESHI.M with the given input arguments.
%
%      KESHI('Property','Value',...) creates a new KESHI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before keshi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to keshi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help keshi

% Last Modified by GUIDE v2.5 17-Jul-2018 17:23:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @keshi_OpeningFcn, ...
                   'gui_OutputFcn',  @keshi_OutputFcn, ...
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


% --- Executes just before keshi is made visible.
function keshi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to keshi (see VARARGIN)

% Choose default command line output for keshi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes keshi wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global cishu record
cishu=0;
record=[];

% --- Outputs from this function are returned to the command line.
function varargout = keshi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function biaoti_Callback(hObject, eventdata, handles)
% hObject    handle to biaoti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of biaoti as text
%        str2double(get(hObject,'String')) returns contents of biaoti as a double


% --- Executes during object creation, after setting all properties.
function biaoti_CreateFcn(hObject, eventdata, handles)
% hObject    handle to biaoti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xuhao_Callback(hObject, eventdata, handles)
% hObject    handle to xuhao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xuhao as text
%        str2double(get(hObject,'String')) returns contents of xuhao as a double


% --- Executes during object creation, after setting all properties.
function xuhao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xuhao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function riqi_Callback(hObject, eventdata, handles)
% hObject    handle to riqi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of riqi as text
%        str2double(get(hObject,'String')) returns contents of riqi as a double


% --- Executes during object creation, after setting all properties.
function riqi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to riqi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in keshi.
function keshi_Callback(hObject, eventdata, handles)
% hObject    handle to keshi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns keshi contents as cell array
%        contents{get(hObject,'Value')} returns selected item from keshi


% --- Executes during object creation, after setting all properties.
function keshi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to keshi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 日期选择
handles.cal=uicalendar('DestinationUI', {handles.riqi, 'string'},'OutputDateStyle',3);
waitfor(handles.cal)
data=str2num(handles.riqi.String);
temp=datevec(data);
riqi=[num2str(temp(1)),'年',num2str(temp(2)),'月',num2str(temp(3)),'日'];
handles.riqi.String=riqi;


% --- Executes on selection change in banxing.
function banxing_Callback(hObject, eventdata, handles)
% hObject    handle to banxing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns banxing contents as cell array
%        contents{get(hObject,'Value')} returns selected item from banxing


% --- Executes during object creation, after setting all properties.
function banxing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to banxing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function shijian_Callback(hObject, eventdata, handles)
% hObject    handle to shijian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of shijian as text
%        str2double(get(hObject,'String')) returns contents of shijian as a double


% --- Executes during object creation, after setting all properties.
function shijian_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shijian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in nianji.
function nianji_Callback(hObject, eventdata, handles)
% hObject    handle to nianji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns nianji contents as cell array
%        contents{get(hObject,'Value')} returns selected item from nianji


% --- Executes during object creation, after setting all properties.
function nianji_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nianji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xingming_Callback(hObject, eventdata, handles)
% hObject    handle to xingming (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xingming as text
%        str2double(get(hObject,'String')) returns contents of xingming as a double


% --- Executes during object creation, after setting all properties.
function xingming_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xingming (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function beizhu_Callback(hObject, eventdata, handles)
% hObject    handle to beizhu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of beizhu as text
%        str2double(get(hObject,'String')) returns contents of beizhu as a double


% --- Executes during object creation, after setting all properties.
function beizhu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to beizhu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tianjia.
function tianjia_Callback(hObject, eventdata, handles)
% hObject    handle to tianjia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cishu record t
cishu=cishu+1;
%%标题
biaoti=handles.biaoti.String;
if isempty(biaoti)
    warndlg('标题空的');
end
%%序号
xuhao=cishu;
handles.xuhao.String=xuhao;
%% 课时
switch handles.keshi.Value
    case 1
        keshi=1.0;
    case 2
        keshi=1.5;
    case 3
        keshi=2.0;
    case 4
        keshi=2.5;
    case 5
        keshi=3.0;
end
%% 日期
riqi=handles.riqi.String;
%%班型
switch handles.banxing.Value
    case 1
        banxing='一对一';
    case 2
        banxing='一对二';
    case 3
        banxing='一对三';
    case 4
        banxing='小班上课';
end
%% 时间
shijian=handles.shijian.String;
%% 班级
switch handles.nianji.Value
    case 1
        nianji='七年级';
    case 2
        nianji='八年级';
    case 3
        nianji='九年级';
end
%%姓名
xingming=handles.xingming.String;
%%备注
beizhu=handles.beizhu.String;

%% record
record=[record;{xuhao,keshi,riqi,banxing,shijian,nianji,xingming,beizhu}];

%% 添加
if handles.xianshi.Value == 1
    t.Data=record;
end



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t record cishu
record(end,:)=[];
cishu=cishu-1;
handles.xuhao.String=cishu;
if handles.xianshi.Value ==1
    t.Data=record;
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 导出excel
global record
[filename,pathname]=uiputfile({'*.xlsx','Excel 文档(*.xlsx)'},'另存为');
name=[pathname,filename];
h = waitbar(0,'存储中...');
e = actxserver('Excel.Application');%创建一个excel对象
if exist(name,'file')
    Workbook = e.Workbooks.Open(name);
else
    Workbook = e.Workbooks.Add;
    Workbook.SaveAs(name);  
end
e.Visible = 1;
eSheets = e.ActiveWorkbook.Sheets;
eSheet1 = eSheets.get('Item',1);
eSheet1.Activate
%设置单元格
eSheet1.Range('B1:I1').ColumnWidth = {5,15,15,8,8,8,50,20};
eSheet1.Range('B3:I3').MergeCells = 1;
eSheet1.Range('B3').RowHeight = 40;
eSheet1.Range('B3').HorizontalAlignment = 3;    
eSheet1.Range('B3').VerticalAlignment = -4108;

eSheet1.Range('B3').Font.size = 24;
eSheet1.Range('B3').Font.name = '宋体';
eSheet1.Range('B3').Value=handles.biaoti.String;
eSheet1.Range('B4').Value='序号';
eSheet1.Range('C4').Value='日期';
eSheet1.Range('D4').Value='时间';
eSheet1.Range('E4').Value='课时(h)';
eSheet1.Range('F4').Value='班型';
eSheet1.Range('G4').Value='年级';
eSheet1.Range('H4').Value='学生';
eSheet1.Range('I4').Value='备注';

for i = 1:size(record,1)
    waitbar(i/ size(record,1))
    fanwei=['B',num2str(4+i),':','I',num2str(4+i)];
    eSheet1.Range(fanwei).HorizontalAlignment = 3;    % -4130
    eSheet1.Range(fanwei).VerticalAlignment = -4108;
    eSheet1.Range(fanwei).Font.size = 12;
    eSheet1.Range(fanwei).Font.name = '宋体';
    
    eSheet1.Range(fanwei).Value=record(i,:);
end
Workbook.Save   % 保存文档
waitbar(1,h,'存储完成');
pause(1)
close(h) 
e.WorkBooks.Close;

% --- Executes on button press in xianshi.
function xianshi_Callback(hObject, eventdata, handles)
% hObject    handle to xianshi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of xianshi
global record f t
if handles.xianshi.Value == 1
    f=figure;
    f.Position=[300 100 800 500];
    f.Name='显示';
    t=uitable(f);
    t.Position=[50 50 700 400];
    t.ColumnName={'序号','课时(h)','日期','班型','时间','年级','姓名','备注'};
    t.ColumnWidth={30,50,100,70,80,50,200,100};
    if ~isempty(record)
        t.Data=record;
    end
else
    close(f);
end
