function varargout = FRONTPAGE(varargin)
% FRONTPAGE MATLAB code for FRONTPAGE.fig
%      FRONTPAGE, by itself, creates a new FRONTPAGE or raises the existing
%      singleton*.
%
%      H = FRONTPAGE returns the handle to a new FRONTPAGE or the handle to
%      the existing singleton*.
%
%      FRONTPAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRONTPAGE.M with the given input arguments.
%
%      FRONTPAGE('Property','Value',...) creates a new FRONTPAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FRONTPAGE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FRONTPAGE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FRONTPAGE

% Last Modified by GUIDE v2.5 23-Feb-2023 20:16:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FRONTPAGE_OpeningFcn, ...
                   'gui_OutputFcn',  @FRONTPAGE_OutputFcn, ...
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


% --- Executes just before FRONTPAGE is made visible.
function FRONTPAGE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FRONTPAGE (see VARARGIN)

% Choose default command line output for FRONTPAGE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FRONTPAGE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FRONTPAGE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function netlist_file_reader1_Callback(hObject, eventdata, handles)
% hObject    handle to netlist_file_reader1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of netlist_file_reader1 as text
%        str2double(get(hObject,'String')) returns contents of netlist_file_reader1 as a double
%  fname=get(handles.netlist_file_reader1,'string');
%     fname=strcat(fname,'.txt');
%     fid = fopen(char(fname),'r');
%     %-----------------------------------
%     formatSpec = '%s';
%     tline = fgetl(fid);
%     matV = zeros(1,4);
%     matR = zeros(1,4);
%     matD = zeros(1,3);
%     matS = zeros(1,5); % ac er jonno matS=zeros(1,5)
%     %-----------------------------------
%     while ischar(tline)
%         if tline(1)=='V'
%             line = strrep(tline,'V_V',' ');
%             line = strrep(line,'k','e03');
%             line = strrep(line,'M','e06');
%             line = strrep(line,'m','e-03');
%             temp = str2num(line);
%             matV = [matV ; temp];
%         elseif tline(1)=='S'
%             line = strrep(tline,'S_S',' ');
%             line = strrep(line,'k','e3');
%             line = strrep(line,'M','e6');
%             line = strrep(line,'m','e-3');
%             temp = str2num(line);
%             matS = [matS ; temp];
%         elseif tline(1)=='R'
%             line = strrep(tline,'R_R',' ');
%             line = strrep(line,'k','e3');
%             line = strrep(line,'M','e6');
%             line = strrep(line,'m','e-3');
%             temp = str2num(line);
%             matR = [matR ; temp];
%             
%         else temp = str2num(tline(4:length(tline)-8));
%             matD = [ matD ; temp ];
%         end
%         tline = fgetl(fid);
%     end
%     matV = matV(2:end,:)
%     matR = matR(2:end,:)
%     matD = matD(2:end,:)
%     matS = matS(2:end,:)
%     ndiode=size(matD)
%     ndiode=ndiode(1)
%     node = max([max(matD(:,2:3)) max(matR(:,2:3)) max(matV(:,2:3)) max(matS(:,2:3))])
%     setappdata(0,'matD',matD)
%     setappdata(0,'matR',matR)
%     setappdata(0,'matV',matV)
%     setappdata(0,'matS',matS)
%     setappdata(0,'node',node) %  gui er 1 page to another page
% 
% 
% 
% 
% 
%% my attempt on reading INPUT

fname=get(handles.netlist_file_reader1,'string');
    fname=strcat(fname,'.txt');
    fid = fopen(char(fname),'r');
    %-----------------------------------
    formatSpec = '%s';
    letterline = fgetl(fid);
    matV = zeros(1,4);
    matR = zeros(1,4);
    matD = zeros(1,3);
    matS = zeros(1,5); % ac er jonno matS=zeros(1,5)
    %-----------------------------------
    while ischar(letterline)
        if letterline(1)=='V'&& letterline(2)=='D'&& letterline(3)=='C'
           
            line = strrep(letterline,'VDC_V',' ');
            line = strrep(line,'k','e03');
            line = strrep(line,'M','e06');
            line = strrep(line,'m','e-03');
            line = strrep(line,'u','e-06');
            line = strrep(line,'K','e03');
            line = strrep(line,'n','e-09');
            val_line = str2num(line);
            matV = [matV ; val_line];
        elseif letterline(1)=='V'&& letterline(2)=='S'&& letterline(3)=='I'&& letterline(4)=='N'
            line = strrep(letterline,'VSIN_V',' ');
            line = strrep(line,'k','e3');
            line = strrep(line,'M','e6');
            line = strrep(line,'m','e-3');
             line = strrep(line,'u','e-06');
            line = strrep(line,'K','e03');
            line = strrep(line,'n','e-09');
            val_line = str2num(line);
            matS = [matS ; val_line];
        elseif letterline(1)=='R'
            line = strrep(letterline,'R_R',' ');
            line = strrep(line,'k','e3');
            line = strrep(line,'M','e6');
            line = strrep(line,'m','e-3');
             line = strrep(line,'u','e-06');
            line = strrep(line,'K','e03');
            line = strrep(line,'n','e-09');
            val_line = str2num(line);
            matR = [matR ; val_line];
            
        else val_line = str2num(letterline(4:length(letterline)-8));
            matD = [ matD ; val_line ];
        end
        letterline = fgetl(fid);
    end
    
     
    matV = matV(2:end,:)
    matR = matR(2:end,:)
    matD = matD(2:end,:)
    matS = matS(2:end,:)
    ndiode=size(matD)
    ndiode=ndiode(1)
    node = max([max(matD(:,2:3)) max(matR(:,2:3)) max(matV(:,2:3)) max(matS(:,2:3))])
    setappdata(0,'matD',matD)
    setappdata(0,'matR',matR)
    setappdata(0,'matV',matV)
    setappdata(0,'matS',matS)
    setappdata(0,'node',node) %  gui er 1 page to another page



% --- Executes during object creation, after setting all properties.
function netlist_file_reader1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to netlist_file_reader1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_netlist_input1.
function pushbutton_netlist_input1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_netlist_input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

MyGUI
