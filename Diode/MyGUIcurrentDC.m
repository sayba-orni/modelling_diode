function varargout = MyGUIcurrentDC(varargin)
% MYGUICURRENTDC MATLAB code for MyGUIcurrentDC.fig
%      MYGUICURRENTDC, by itself, creates a new MYGUICURRENTDC or raises the existing
%      singleton*.
%
%      H = MYGUICURRENTDC returns the handle to a new MYGUICURRENTDC or the handle to
%      the existing singleton*.
%
%      MYGUICURRENTDC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYGUICURRENTDC.M with the given input arguments.
%
%      MYGUICURRENTDC('Property','Value',...) creates a new MYGUICURRENTDC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MyGUIcurrentDC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MyGUIcurrentDC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MyGUIcurrentDC

% Last Modified by GUIDE v2.5 21-Feb-2023 15:36:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MyGUIcurrentDC_OpeningFcn, ...
                   'gui_OutputFcn',  @MyGUIcurrentDC_OutputFcn, ...
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


% --- Executes just before MyGUIcurrentDC is made visible.
function MyGUIcurrentDC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MyGUIcurrentDC (see VARARGIN)

% Choose default command line output for MyGUIcurrentDC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MyGUIcurrentDC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MyGUIcurrentDC_OutputFcn(hObject, eventdata, handles) 
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

element=get(handles.edit1,'string');
element_name=element(1)
element_id=str2num(element(2))

ansnode=getappdata(0,'ansnewgui');
node=getappdata(0,'node');
ansnode
matD=getappdata(0,'matD')
matR=getappdata(0,'matR')
matV=getappdata(0,'matV')
diodecurr=getappdata(0,'diodecurr')
% noR=size(matR,1)
node1=0 
node2=0


 if element_name=='R'
        for i=1:size(matR,1)
            if matR(i,1)==element_id
                node1=matR(i,2)
                node2=matR(i,3)
                res=matR(i,4)
            end
        end
       if node1==0 
           nodev1=0
           nodev2=ansnode(node2)
       end
       if node2==0
           nodev2=0
           nodev1=ansnode(node1)
       end
       if node1~=0 && node2~=0
           nodev1=ansnode(node1)
           nodev2=ansnode(node2)
       end 
      current=(nodev1-nodev2)/res 
      set(handles.edit2,'string',current);

 elseif element_name=='V'
     
     current=(-1*ansnode(node+1,1));
     set(handles.edit2,'string',current);

 elseif element_name=='D'
     current=diodecurr(element_id)
     set(handles.edit2,'string',current);
 else
     set(handles.edit2,'string','ERROR!');


 end

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
