function varargout = MyGUI3AC(varargin)
% MYGUI3AC MATLAB code for MyGUI3AC.fig
%      MYGUI3AC, by itself, creates a new MYGUI3AC or raises the existing
%      singleton*.
%
%      H = MYGUI3AC returns the handle to a new MYGUI3AC or the handle to
%      the existing singleton*.
%
%      MYGUI3AC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYGUI3AC.M with the given input arguments.
%
%      MYGUI3AC('Property','Value',...) creates a new MYGUI3AC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MyGUI3AC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MyGUI3AC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MyGUI3AC

% Last Modified by GUIDE v2.5 22-Feb-2023 22:43:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MyGUI3AC_OpeningFcn, ...
                   'gui_OutputFcn',  @MyGUI3AC_OutputFcn, ...
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


% --- Executes just before MyGUI3AC is made visible.
function MyGUI3AC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MyGUI3AC (see VARARGIN)

% Choose default command line output for MyGUI3AC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MyGUI3AC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MyGUI3AC_OutputFcn(hObject, eventdata, handles) 
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
element=get(handles.edit1,'string');
element_name=element(1)
element_id=str2num(element(2))

matD=getappdata(0,'matD')
matR=getappdata(0,'matR')
matV=getappdata(0,'matV')
node=getappdata(0,'node');
ndiode=size(matD,1)
node1=zeros(length(t),1) 
node2=zeros(length(t),1) 


if element_name=='D'
        for i=1:size(matD,1)
            if matD(i,1)==element_id
                node1=matD(i,2)
                node2=matD(i,3)
                
            end
        end
       if node1==0 
           nodev1=0
           nodev2=ACvolts(:,node2)
       end
       if node2==0
           nodev2=0
           nodev1=ACvolts(:,node1)
       end
       if node1~=0 && node2~=0
           nodev1=ACvolts(:,node1)
           nodev2=ACvolts(:,node2)
       end 
      
      voltagediff=nodev1-nodev2
plot(t,voltagediff);
end
