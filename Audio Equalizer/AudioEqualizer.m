function varargout = AudioEqualizer(varargin)
% AUDIOEQUALIZER MATLAB code for AudioEqualizer.fig
%      AUDIOEQUALIZER, by itself, creates a new AUDIOEQUALIZER or raises the existing
%      singleton*.
%
%      H = AUDIOEQUALIZER returns the handle to a new AUDIOEQUALIZER or the handle to
%      the existing singleton*.
%
%      AUDIOEQUALIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUDIOEQUALIZER.M with the given input arguments.
%
%      AUDIOEQUALIZER('Property','Value',...) creates a new AUDIOEQUALIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AudioEqualizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AudioEqualizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AudioEqualizer

% Last Modified by GUIDE v2.5 29-May-2022 19:02:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AudioEqualizer_OpeningFcn, ...
                   'gui_OutputFcn',  @AudioEqualizer_OutputFcn, ...
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


% --- Executes just before AudioEqualizer is made visible.
function AudioEqualizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AudioEqualizer (see VARARGIN)

% Choose default command line output for AudioEqualizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AudioEqualizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AudioEqualizer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
global num1;
global num2;
global num3;
global num4;
global num5;
global num6;
global num7;
global num8;
global num9;
global den1;
global den2;
global den3;
global den4;
global den5;
global den6;
global den7;
global den8;
global den9;
global g1;
global g2;
global g3;
global g4;
global g5;
global g6;
global g7;
global g8;
global g9;
global y1;
global y2;
global y3;
global y4;
global y5;
global y6;
global y7;
global y8;
global y9;
global type;
global filename;
global Y;
global X;
[filename pathname] = uigetfile({'*.wav'},'File Selector');
handles.fullpathname = strcat(pathname, filename);
set(handles.edit1, 'String',handles.fullpathname)
[X,Fs]=audioread(filename);
type = get(handles.filtertype,'value');
switch(type)
    case 1
        %fir filters
        [num1,den1] = fir1(100,170/Fs,'low');
        [num1,den1] = eqtflength(num1,den1);
        [num2,den2] = fir1(100,[170/Fs 310/Fs],'bandpass');
        [num2,den2] = eqtflength(num2,den2);
        [num3,den3] = fir1(100,[310/Fs 600/Fs],'bandpass');
        [num3,den3] = eqtflength(num3,den3);
        [num4,den4] = fir1(100,[600/Fs 1000/Fs],'bandpass');
        [num4,den4] = eqtflength(num4,den4);
        [num5,den5] = fir1(100,[1000/Fs 3000/Fs],'bandpass');
        [num5,den5] = eqtflength(num5,den5);
        [num6,den6] = fir1(100,[3000/Fs 6000/Fs],'bandpass');
        [num6,den6] = eqtflength(num6,den6);
        [num7,den7] = fir1(100,[6000/Fs 12000/Fs],'bandpass');
        [num7,den7] = eqtflength(num7,den7);
        [num8,den8] = fir1(100,[12000/Fs 14000/Fs],'bandpass');
        [num8,den8] = eqtflength(num8,den8);
        [num9,den9] = fir1(100,[14000/Fs 16000/Fs],'bandpass');
        [num9,den9] = eqtflength(num9,den9);
    case 2
        %iir filters
        Fs=2*Fs;
        Fm=Fs/2;
        [num1,den1]=butter(4,170/Fm,'low');
        [num2,den2]=butter(4,[170/Fm 310/Fm],'bandpass');
        [num3,den3]=butter(4,[310/Fm 600/Fm],'bandpass');
        [num4,den4]=butter(4,[600/Fm 1000/Fm],'bandpass');
        [num5,den5]=butter(4,[1000/Fm 3000/Fm],'bandpass');
        [num6,den6]=butter(4,[3000/Fm 6000/Fm],'bandpass');
        [num7,den7]=butter(4,[6000/Fm 12000/Fm],'bandpass');
        [num8,den8]=butter(4,[12000/Fm 14000/Fm],'bandpass');
        [num9,den9]=butter(4,[14000/Fm 16000/Fm],'bandpass');
        fprintf('\nInput sampling rate doubled to use IIR filters\n');
end
y1=filter(num1,den1,X);
y2=filter(num2,den2,X);
y3=filter(num3,den3,X);
y4=filter(num4,den4,X);
y5=filter(num5,den5,X);
y6=filter(num6,den6,X);
y7=filter(num7,den7,X);
y8=filter(num8,den8,X);
y9=filter(num9,den9,X);
fprintf('Input Sampling Rate = %d',Fs);

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


% --- Executes on selection change in filtertype.
function filtertype_Callback(hObject, eventdata, handles)
% hObject    handle to filtertype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filtertype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filtertype


% --- Executes during object creation, after setting all properties.
function outputfs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputfs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global g1;
g1 = get(hObject,'Value');
set (handles.edit3,'String',num2str(g1));


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global g2;
g2 = get(hObject,'Value');
set (handles.edit4,'String',num2str(g2));


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global g3;
g3 = get(hObject,'Value');
set (handles.edit5,'String',num2str(g3));


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global g4;
g4 = get(hObject,'Value');
set (handles.edit6,'String',num2str(g4));


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global g5;
g5 = get(hObject,'Value');
set (handles.edit7,'String',num2str(g5));


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global g6;
g6 = get(hObject,'Value');
set (handles.edit8,'String',num2str(g6));


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global g7;
g7 = get(hObject,'Value');
set (handles.edit9,'String',num2str(g7));


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global g8;
g8 = get(hObject,'Value');
set (handles.edit10,'String',num2str(g8));


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global g9;
g9 = get(hObject,'Value');
set (handles.edit11,'String',num2str(g9));


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global g1;
g1=str2num(get(hObject,'String'));
minn=get(handles.slider1,'Min');
maxx=get(handles.slider1,'Max');
if(g1<minn || g1>maxx)
    g1=get(handles.slider1,'Value');
    set(hObject,'String',num2str(0));
else
    set(handles.slider1,'Value',g1);
end


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
global g2;
g2=str2num(get(hObject,'String'));
minn=get(handles.slider2,'Min');
maxx=get(handles.slider2,'Max');
if(g2<minn || g2>maxx)
    g2=get(handles.slider2,'Value');
    set(hObject,'String',num2str(0));
else
    set(handles.slider2,'Value',g2);
end


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
global g3;
g3=str2num(get(hObject,'String'));
minn=get(handles.slider3,'Min');
maxx=get(handles.slider3,'Max');
if(g3<minn || g3>maxx)
    g3=get(handles.slider3,'Value');
    set(hObject,'String',num2str(0));
else
    set(handles.slider3,'Value',g3);
end


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


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
global g4;
g4=str2num(get(hObject,'String'));
minn=get(handles.slider4,'Min');
maxx=get(handles.slider4,'Max');
if(g4<minn || g4>maxx)
    g4=get(handles.slider4,'Value');
    set(hObject,'String',num2str(0));
else
    set(handles.slider4,'Value',g4);
end


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
global g5;
g5=str2num(get(hObject,'String'));
minn=get(handles.slider5,'Min');
maxx=get(handles.slider5,'Max');
if(g5<minn || g5>maxx)
    g5=get(handles.slider5,'Value');
    set(hObject,'String',num2str(0));
else
    set(handles.slider5,'Value',g5);
end


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
global g6;
g6=str2num(get(hObject,'String'));
minn=get(handles.slider6,'Min');
maxx=get(handles.slider6,'Max');
if(g6<minn || g6>maxx)
    g6=get(handles.slider6,'Value');
    set(hObject,'String',num2str(0));
else
    set(handles.slider6,'Value',g6);
end


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
global g7;
g7=str2num(get(hObject,'String'));
minn=get(handles.slider7,'Min');
maxx=get(handles.slider7,'Max');
if(g7<minn || g7>maxx)
    g7=get(handles.slider7,'Value');
    set(hObject,'String',num2str(0));
else
    set(handles.slider7,'Value',g7);
end


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
global g8;
g8=str2num(get(hObject,'String'));
minn=get(handles.slider8,'Min');
maxx=get(handles.slider8,'Max');
if(g8<minn || g8>maxx)
    g8=get(handles.slider8,'Value');
    set(hObject,'String',num2str(0));
else
    set(handles.slider8,'Value',g8);
end


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



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
global g9;
g9=str2num(get(hObject,'String'));
minn=get(handles.slider9,'Min');
maxx=get(handles.slider9,'Max');
if(g9<minn || g9>maxx)
    g9=get(handles.slider9,'Value');
    set(hObject,'String',num2str(0));
else
    set(handles.slider9,'Value',g9);
end


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


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
global player;
global Y;
global X;
global Fs;
global FsO;
global g1;
global g2;
global g3;
global g4;
global g5;
global g6;
global g7;
global g8;
global g9;
global y1;
global y2;
global y3;
global y4;
global y5;
global y6;
global y7;
global y8;
global y9;
[X,Fs]=audioread(filename);
Y=g1*y1+g2*y2+g3*y3+g4*y4+g5*y5+g6*y6+g7*y7+g8*y8+g9*y9;
if (strcmp(get(handles.edit12,'String'),'Default'));
        FsO = Fs; 
        fprintf('\nOutput Sample Rate = %d\n',Fs);
else
        FsO= str2num(get(handles.edit12,'String'));
        fprintf('\nOutput Sample Rate = %d\n',FsO);
end    
player = audioplayer(Y,FsO);
play(player)
audiowrite('Project_Output.wav',Y,FsO);


% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
pause(player)


% --- Executes on button press in resume.
function resume_Callback(hObject, eventdata, handles)
% hObject    handle to resume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
resume(player)


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
stop(player)


% --- Executes on slider movement.
function slider23_Callback(hObject, eventdata, handles)
% hObject    handle to slider23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
global Y;
global Fs;
global FsO;
audiowrite('Project_Output.wav',Y,FsO);


% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
global Y;
global X;
global Fs;
global FsO;
global g1;
global g2;
global g3;
global g4;
global g5;
global g6;
global g7;
global g8;
global g9;
global y1;
global y2;
global y3;
global y4;
global y5;
global y6;
global y7;
global y8;
global y9;
global N;
global t1;
global t2;
global f;
Y=g1*y1+g2*y2+g3*y3+g4*y4+g5*y5+g6*y6+g7*y7+g8*y8+g9*y9;
[X,Fs]=audioread(filename);
N=length(X);
t1=linspace(0,N/Fs,N);
t2=linspace(0,N/FsO,N);
f=linspace(-Fs/2,Fs/2,N);
F=fftshift(fft(X/Fs));
Z=fftshift(fft(Y/Fs));
figure()
subplot(3,2,1)
plot(t1,X);
title('Input Signal');
xlabel('Time');
ylabel('Magnitude');
grid on;
subplot(3,2,2)
plot(t2,Y);
title('Output Signal');
xlabel('Time');
ylabel('Magnitude');
grid on;
subplot(3,2,3)
plot(f,abs(F));
xlabel('Frequency');
ylabel('Magnitude');
grid on;
subplot(3,2,4)
plot(f,abs(Z));
xlabel('Frequency');
ylabel('Magnitude');
grid on;
subplot(3,2,5)
plot(f,angle(F));
xlabel('Frequency');
ylabel('Phase');
grid on;
subplot(3,2,6)
plot(f,angle(Z));
xlabel('Frequency');
ylabel('Phase');
grid on;


% --- Executes during object creation, after setting all properties.
function filtertype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filtertype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
global Y;
global X;
global Fs;
global FsO;
global num1;
global num2;
global num3;
global num4;
global num5;
global num6;
global num7;
global num8;
global num9;
global den1;
global den2;
global den3;
global den4;
global den5;
global den6;
global den7;
global den8;
global den9;
global g1;
global g2;
global g3;
global g4;
global g5;
global g6;
global g7;
global g8;
global g9;
global y1;
global y2;
global y3;
global y4;
global y5;
global y6;
global y7;
global y8;
global y9;
global N;
global t1;
global t2;
global f;
Y=g1*y1+g2*y2+g3*y3+g4*y4+g5*y5+g6*y6+g7*y7+g8*y8+g9*y9;
v=get(handles.popupmenu1,'Value');
switch (v)
    case 1
        out=y1;
        a=den1;
        b=num1;
    case 2
        out=y2;
        a=den2;
        b=num2;
    case 3
        out=y3;
        a=den3;
        b=num3;
    case 4
        out=y4 
        a=den4;
        b=num4;                
    case 5
        out=y5;
        a=den5;
        b=num5;
    case 6
        out=y6;
        a=den6;
        b=num6;            
    case 7
        out=y7;
        a=den7;
        b=num7;                
    case 8
        out=y8;
        a=den8;
        b=num8;
    case 9
        out=y9;
        a=den9;
        b=num9;    
end
OUT=fftshift(fft(out/Fs));
N=length(X);
t2=linspace(0,N/FsO,N);
f=linspace(-Fs/2,Fs/2,N);
axes(handles.axes1);
plot(t2,out);
title('Time Domain');
xlabel('Time'); 
ylabel('Magnitude');
axis tight;
zoom xon;
grid on;
axes(handles.axes2);
plot(f,abs(OUT))
title('Frequency Domain');
xlabel('Frequency'); 
ylabel('Magnitude');
axis tight;
zoom xon;
grid on;
axes(handles.axes3);
plot(f,angle(OUT))
xlabel('Frequency'); 
ylabel('Phase');
axis tight;
zoom xon;
grid on;
TF = tf(b,a);
figure();
title('Magnitude and Phase');
freqz(b,a,N);
figure();
title('Filter Analysis');
subplot(3,1,1);
pzmap(TF);
grid on;
subplot(3,1,2);
impulse(TF);
grid on;
subplot(3,1,3);
step(TF);
grid on;
[z,p,k] = tf2zp(b,a);
fprintf('Gain = %d\n',k);


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
