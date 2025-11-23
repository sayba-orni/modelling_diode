function varargout = MyGUI(varargin)
% MYGUI MATLAB code for MyGUI.fig
%      MYGUI, by itself, creates a new MYGUI or raises the existing
%      singleton*.
%
%      H = MYGUI returns the handle to a new MYGUI or the handle to
%      the existing singleton*.
%
%      MYGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYGUI.M with the given input arguments.
%
%      MYGUI('Property','Value',...) creates a new MYGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MyGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MyGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MyGUI

% Last Modified by GUIDE v2.5 20-Feb-2023 21:18:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @MyGUI_OpeningFcn, ...
    'gui_OutputFcn',  @MyGUI_OutputFcn, ...
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


% --- Executes just before MyGUI is made visible.
function MyGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MyGUI (see VARARGIN)

% Choose default command line output for MyGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MyGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MyGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in exponential.
function exponential_Callback(hObject, eventdata, handles)
% hObject    handle to exponential (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

matD=getappdata(0,'matD');
matR=getappdata(0,'matR');
matV=getappdata(0,'matV');
matS=getappdata(0,'matS');
node=getappdata(0,'node');
ndiode=size(matD,1)

check=nnz(matS)

if check==0

    [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=myexpo(matD,matR,matV,node)
    % ans=myMNA_EXP(matD,matR,matV,node)
    if ansnew==[0]
        ansnewgui=ans_from_func
    else
        ansnewgui=ansnew

    end

    setappdata(0,'strI',stringI);
    setappdata(0,'strV',stringV);
    setappdata(0,'strErrI',stringErrI);
    setappdata(0,'strErrV',stringErrV);
    setappdata(0,'ansnewgui',ansnewgui);
    setappdata(0,'node',node);
    setappdata(0,'matD',matD);
    setappdata(0,'matR',matR);
    setappdata(0,'matV',matV);
    setappdata(0,'diodecurr',diodecurr);
    GUIoutDC

else %AC part

    amp=matS(4);
    w=matS(5);
    period=2*3.1415/w
    per=5*period
    t=linspace(0,per,100)
    matAC=amp*sin(w*t)

    len=length(t)

    ACvolts=zeros(len,node)
    ACsourceCurr=zeros(len,1)
    diodecurrent=zeros(len,ndiode)

    for j=1:len
        matS(4)=matAC(j)
        [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=myexpo(matD,matR,matS,node)
        if ansnew==[0]
            ansnewgui=ans_from_func
        else
            ansnewgui=ansnew

        end

        ACvolts(j,:)=ansnewgui(1:node)
        vnode=node+1
        %       ACsourceCurr(i)=ansnewgui(vnode,1)

        ACsourceCurrval=ansnewgui(node+1)
        ACsourceCurr(j)=ACsourceCurrval
        diodecurrent(j,:)=diodecurr(1:ndiode)
    end
    ACvolts
    ACsourceCurr
    diodecurrent

    setappdata(0,'ACvolts',ACvolts);
    setappdata(0,'t',t);
    setappdata(0,'node',node);
    setappdata(0,'matD',matD);
    setappdata(0,'matR',matR);
    setappdata(0,'matV',matV);
    setappdata(0,'ACsourceCurr',ACsourceCurr);
    setappdata(0,'diodecurrent',diodecurrent);
    GUIoutAC

    % setappdata(0,'matAC',matAC);
    % setappdata(0,'t',t);
    % setappdata(0,'diodevoltageAC',diodevoltageAC);

end

% --- Executes on button press in piecewiselinear.
function piecewiselinear_Callback(hObject, eventdata, handles)
% hObject    handle to piecewiselinear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

matD=getappdata(0,'matD');
matR=getappdata(0,'matR');
matV=getappdata(0,'matV');
node=getappdata(0,'node');
matS=getappdata(0,'matS');
ndiode=size(matD,1)


check=nnz(matS)

if check==0
    [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=mypwl(matD,matR,matV,node)
    % ans=myMNA_PWL(matD,matR,matV)
    if ansnew==[0]
        ansnewgui=ans_from_func
    else
        ansnewgui=ansnew

    end

    setappdata(0,'strI',stringI);
    setappdata(0,'strV',stringV);
    setappdata(0,'strErrI',stringErrI);
    setappdata(0,'strErrV',stringErrV);
    setappdata(0,'ansnewgui',ansnewgui);
    setappdata(0,'node',node);
    setappdata(0,'matD',matD);
    setappdata(0,'matR',matR);
    setappdata(0,'matV',matV);
    setappdata(0,'diodecurr',diodecurr);

    GUIoutDC

else %AC part

    amp=matS(4);
    w=matS(5);
    period=2*3.1415/w
    per=5*period
    t=linspace(0,per,100)
    matAC=amp*sin(w*t)

    len=length(t)

    ACvolts=zeros(len,node)
    ACsourceCurr=zeros(len,1)
    diodecurrent=zeros(len,ndiode)

    for j=1:len
        matS(4)=matAC(j)
        [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=mypwl(matD,matR,matS,node)
        if ansnew==[0]
            ansnewgui=ans_from_func
        else
            ansnewgui=ansnew

        end

        ACvolts(j,:)=ansnewgui(1:node)
        ACsourceCurr(j)=ansnewgui(node+1)
        diodecurrent(j,:)=diodecurr(1:ndiode)

    end
    ACvolts
    ACsourceCurr
    diodecurrent

    setappdata(0,'ACvolts',ACvolts);
    setappdata(0,'t',t);
    setappdata(0,'node',node);
    setappdata(0,'matD',matD);
    setappdata(0,'matR',matR);
    setappdata(0,'matV',matV);
    setappdata(0,'ACsourceCurr',ACsourceCurr);
    setappdata(0,'diodecurrent',diodecurrent);
    GUIoutAC
end
% --- Executes on button press in constantvoltagedrop.
function constantvoltagedrop_Callback(hObject, eventdata, handles)
% hObject    handle to constantvoltagedrop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
matD=getappdata(0,'matD');
matR=getappdata(0,'matR');
matV=getappdata(0,'matV');
node=getappdata(0,'node');
ndiode=size(matD,1)


matS=getappdata(0,'matS');

check=nnz(matS)

if check==0


    [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=mycvd(matD,matR,matV,node)
    % ans=myMNA_CVD(matD,matR,matV)
    % ansofcvd=myMNA_CVD(matD,matR,matV)
    if ansnew==[0]
        ansnewgui=ans_from_func
    else
        ansnewgui=ansnew

    end
    setappdata(0,'strI',stringI);
    setappdata(0,'strV',stringV);
    setappdata(0,'strErrI',stringErrI);
    setappdata(0,'strErrV',stringErrV);
    setappdata(0,'ansnewgui',ansnewgui);
    setappdata(0,'node',node);
    setappdata(0,'matD',matD);
    setappdata(0,'matR',matR);
    setappdata(0,'matV',matV);
    setappdata(0,'diodecurr',diodecurr);

    GUIoutDC

else %AC part


    amp=matS(4);
    w=matS(5);
    period=2*3.1415/w
    per=5*period
    t=linspace(0,per,100)
    matAC=amp*sin(w*t)

    len=length(t)

    ACvolts=zeros(len,node)
    ACsourceCurr=zeros(len,1)
    diodecurrent=zeros(len,ndiode)

    for j=1:len
        matS(4)=matAC(j)
        matNewS=matS(:,1:4)



        [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=mycvd(matD,matR,matNewS,node)
        if ansnew==[0]
            ansnewgui=ans_from_func
        else
            ansnewgui=ansnew

        end

        ACvolts(j,:)=ansnewgui(1:node)
        ACsourceCurr(j)=ansnewgui(node+1)
        diodecurrent(j,:)=diodecurr(1:ndiode)


    end
    ACvolts
    ACsourceCurr
    diodecurrent

    setappdata(0,'ACvolts',ACvolts);
    setappdata(0,'t',t);
    setappdata(0,'node',node);
    setappdata(0,'matD',matD);
    setappdata(0,'matR',matR);
    setappdata(0,'matV',matV);
    setappdata(0,'ACsourceCurr',ACsourceCurr);
    setappdata(0,'diodecurrent',diodecurrent);
    GUIoutAC
end
% --- Executes on button press in ideal.
function ideal_Callback(hObject, eventdata, handles)
% hObject    handle to ideal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


matD=getappdata(0,'matD');
matR=getappdata(0,'matR');
matV=getappdata(0,'matV');
node=getappdata(0,'node');
ndiode=size(matD,1)

matS=getappdata(0,'matS');

check=nnz(matS)

if check==0

    [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=myidm(matD,matR,matV,node)
    % ans=myMNA_IDM(matD,matR,matV)
    if ansnew==[0]
        ansnewgui=ans_from_func
    else
        ansnewgui=ansnew

    end
    setappdata(0,'strI',stringI);
    setappdata(0,'strV',stringV);
    setappdata(0,'strErrI',stringErrI);
    setappdata(0,'strErrV',stringErrV);
    setappdata(0,'ansnewgui',ansnewgui);
    setappdata(0,'node',node);
    setappdata(0,'matD',matD);
    setappdata(0,'matR',matR);
    setappdata(0,'matV',matV);
    setappdata(0,'diodecurr',diodecurr);
    GUIoutDC

else %AC part

    amp=matS(4);
    w=matS(5);
    period=2*3.1415/w
    per=5*period
    t=linspace(0.0001,per,100)

    matAC=(amp*sin(w*t))
    % matAC=-5*t

    len=length(t)

    ACvolts=zeros(len,node)
    ACsourceCurr=zeros(len,1)
    diodecurrent=zeros(len,ndiode)
    for j=1:len

        if matAC(j)<0

            matS(4)=abs(matAC(j))
            matNewS=matS(:,1:4)
            [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=myidmAC(matD,matR,matNewS,node)
            if ansnew==[0]
                ansnewgui=ans_from_func
            else
                ansnewgui=ansnew

            end

            ACvolts(j,:)=(-1)*ansnewgui(1:node)
            ACsourceCurr(j)=(-1)*ansnewgui(node+1,1)
            diodecurrent(j,:)=diodecurr(1:ndiode)
        else

            matS(4)=matAC(j)
            matNewS=matS(:,1:4)
            [stringV,stringI,stringErrV,stringErrI,ans_from_func,ansnew,diodecurr]=myidm(matD,matR,matNewS,node)
            if ansnew==[0]
                ansnewgui=ans_from_func
            else
                ansnewgui=ansnew

            end

            ACvolts(j,:)=ansnewgui(1:node)
            ACsourceCurr(j)=ansnewgui(node+1,1)
            diodecurrent(j,:)=diodecurr(1:ndiode)
        end

    end
    ACvolts
    ACsourceCurr
    diodecurrent

    setappdata(0,'ACvolts',ACvolts);
    setappdata(0,'t',t);
    setappdata(0,'node',node);
    setappdata(0,'matD',matD);
    setappdata(0,'matR',matR);
    setappdata(0,'matV',matV);
    setappdata(0,'ACsourceCurr',ACsourceCurr);
    setappdata(0,'diodecurrent',diodecurrent);
    GUIoutAC

end
