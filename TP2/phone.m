function varargout = phone(varargin)
% PHONE MATLAB code for phone.fig
%      PHONE, by itself, creates a new PHONE or raises the existing
%      singleton*.
%
%      H = PHONE returns the handle to a new PHONE or the handle to
%      the existing singleton*.
%
%      PHONE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHONE.M with the given input arguments.
%
%      PHONE('Property','Value',...) creates a new PHONE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before phone_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to phone_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help phone

% Last Modified by GUIDE v2.5 25-May-2016 12:45:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @phone_OpeningFcn, ...
                   'gui_OutputFcn',  @phone_OutputFcn, ...
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


% --- Executes just before phone is made visible.
function phone_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to phone (see VARARGIN)

% Choose default command line output for phone
handles.output = hObject;

load filter_697
load filter_770
load filter_852
load filter_941
load filter_1209
load filter_1336
load filter_1477
load filter_1633

handles.rows = [697, 770, 852, 941];
handles.cols = [1209, 1336, 1477, 1633];
handles.rows_filters = {filter_697; filter_770; filter_852; filter_941};
handles.cols_filters = {filter_1209; filter_1336; filter_1477; filter_1633};
handles.number = [['1' '2' '3' 'A'];['4' '5' '6' 'B'];['7' '8' '9' 'C'];['*' '0' '#' 'D']];
handles.fs=8000;
handles.t=0:1/handles.fs:0.1;
t = handles.t;
rows = handles.rows;
cols = handles.cols;
handles.f1=sin(2*pi*rows(1)*t) + sin(2*pi*cols(1)*t);
handles.f2=sin(2*pi*rows(1)*t) + sin(2*pi*cols(2)*t);
handles.f3=sin(2*pi*rows(1)*t) + sin(2*pi*cols(3)*t);
handles.fA=sin(2*pi*rows(1)*t) + sin(2*pi*cols(4)*t);
handles.f4=sin(2*pi*rows(2)*t) + sin(2*pi*cols(1)*t);
handles.f5=sin(2*pi*rows(2)*t) + sin(2*pi*cols(2)*t);
handles.f6=sin(2*pi*rows(2)*t) + sin(2*pi*cols(3)*t);
handles.fB=sin(2*pi*rows(2)*t) + sin(2*pi*cols(4)*t);
handles.f7=sin(2*pi*rows(3)*t) + sin(2*pi*cols(1)*t);
handles.f8=sin(2*pi*rows(3)*t) + sin(2*pi*cols(2)*t);
handles.f9=sin(2*pi*rows(3)*t) + sin(2*pi*cols(3)*t);
handles.fC=sin(2*pi*rows(3)*t) + sin(2*pi*cols(4)*t);
handles.fa=sin(2*pi*rows(4)*t) + sin(2*pi*cols(1)*t);
handles.f0=sin(2*pi*rows(4)*t) + sin(2*pi*cols(2)*t);
handles.fn=sin(2*pi*rows(4)*t) + sin(2*pi*cols(3)*t);
handles.fD=sin(2*pi*rows(4)*t) + sin(2*pi*cols(4)*t);





% Update handles structure
guidata(hObject, handles);

% UIWAIT makes phone wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = phone_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.f3, handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.f6, handles);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.f9, handles);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.fn, handles);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.f2,handles);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.f5, handles);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.f8, handles);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.f0, handles);

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

get_number(handles.f1, handles);

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.f4, handles);

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.f7, handles);

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.fa, handles);

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.dial_input, 'String', '');

function get_number(input, handles)

player = audioplayer(input,handles.fs);
playblocking(player);
max_row = 0;
row_i = 1;
for i = 1:length(handles.rows)
    y=conv(input,handles.rows_filters{i,:});
    [peaks,~]=findpeaks(y);
    result = median(peaks);
    if result > max_row
        row_i = i;
        max_row = result;
    end
end
max_col = 0;
col_i = 1;
for i = 1:length(handles.cols)
    y=conv(input,handles.cols_filters{i,:});
    [peaks,~]=findpeaks(y);
    result = median(peaks);
    if result > max_col
        col_i = i;
        max_col = result;
    end
end
str = get(handles.dial_input, 'String');
set(handles.dial_input, 'String', strcat(str, handles.number(row_i,col_i)));


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.fA, handles);

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.fB, handles);

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.fC, handles);

% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get_number(handles.fD, handles);
