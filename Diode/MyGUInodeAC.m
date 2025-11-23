function varargout = MyGUInodeAC(varargin)
% MYGUINODEAC MATLAB code for MyGUInodeAC.fig
%      MYGUINODEAC, by itself, creates a new MYGUINODEAC or raises the existing
%      singleton*.
%
%      H = MYGUINODEAC returns the handle to a new MYGUINODEAC or the handle to
%      the existing singleton*.
%
%      MYGUINODEAC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYGUINODEAC.M with the given input arguments.
%
%      MYGUINODEAC('Property','Value',...) creates a new MYGUINODEAC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MyGUInodeAC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MyGUInodeAC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MyGUInodeAC

% Last Modified by GUIDE v2.5 21-Feb-2023 23:46:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MyGUInodeAC_OpeningFcn, ...
                   'gui_OutputFcn',  @MyGUInodeAC_OutputFcn, ...
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


% --- Executes just before MyGUInodeAC is made visible.
function MyGUInodeAC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MyGUInodeAC (see VARARGIN)

% Choose default command line output for MyGUInodeAC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MyGUInodeAC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MyGUInodeAC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t=getappdata(0,'t')
ACvolts=getappdata(0,'ACvolts')
node_no=str2num(get(handles.edit1,'string'))
ACvolts(:,node_no)
plot(t,ACvolts(:,node_no))

