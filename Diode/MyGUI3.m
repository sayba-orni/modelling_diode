function varargout = MyGUI3(varargin)
% MYGUI3 MATLAB code for MyGUI3.fig
%      MYGUI3, by itself, creates a new MYGUI3 or raises the existing
%      singleton*.
%
%      H = MYGUI3 returns the handle to a new MYGUI3 or the handle to
%      the existing singleton*.
%
%      MYGUI3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYGUI3.M with the given input arguments.
%
%      MYGUI3('Property','Value',...) creates a new MYGUI3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MyGUI3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MyGUI3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MyGUI3

% Last Modified by GUIDE v2.5 20-Feb-2023 23:34:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MyGUI3_OpeningFcn, ...
                   'gui_OutputFcn',  @MyGUI3_OutputFcn, ...
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


% --- Executes just before MyGUI3 is made visible.
function MyGUI3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MyGUI3 (see VARARGIN)

% Choose default command line output for MyGUI3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MyGUI3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MyGUI3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function outputvolt_Callback(hObject, eventdata, handles)
% hObject    handle to outputvolt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outputvolt as text
%        str2double(get(hObject,'String')) returns contents of outputvolt as a double


% --- Executes during object creation, after setting all properties.
function outputvolt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputvolt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function outputcurr_Callback(hObject, eventdata, handles)
% hObject    handle to outputcurr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outputcurr as text
%        str2double(get(hObject,'String')) returns contents of outputcurr as a double


% --- Executes during object creation, after setting all properties.
function outputcurr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputcurr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function volterr_Callback(hObject, eventdata, handles)
% hObject    handle to volterr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of volterr as text
%        str2double(get(hObject,'String')) returns contents of volterr as a double


% --- Executes during object creation, after setting all properties.
function volterr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volterr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function currenterr_Callback(hObject, eventdata, handles)
% hObject    handle to currenterr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of currenterr as text
%        str2double(get(hObject,'String')) returns contents of currenterr as a double


% --- Executes during object creation, after setting all properties.
function currenterr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to currenterr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in simulate_pushbutton2.
function simulate_pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to simulate_pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

strV=getappdata(0,'strV');
strI=getappdata(0,'strI');
strErrV=getappdata(0,'strErrV');
strErrI=getappdata(0,'strErrI');
set(handles.outputvolt,'string',strV);
set(handles.outputcurr,'string',strI);
set(handles.volterr,'string',strErrV);
set(handles.currenterr,'string',strErrI);
