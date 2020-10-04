function varargout = Transmitter(varargin)

% TRANSMITTER MATLAB code for Transmitter.fig
%      TRANSMITTER, by itself, creates a new TRANSMITTER or raises the existing
%      singleton*.
%
%      H = TRANSMITTER returns the handle to a new TRANSMITTER or the handle to
%      the existing singleton*.
%
%      TRANSMITTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSMITTER.M with the given input arguments.
%
%      TRANSMITTER('Property','Value',...) creates a new TRANSMITTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Transmitter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Transmitter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Transmitter

% Last Modified by GUIDE v2.5 18-Mar-2017 07:07:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Transmitter_OpeningFcn, ...
                   'gui_OutputFcn',  @Transmitter_OutputFcn, ...
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


% --- Executes just before Transmitter is made visible.
function Transmitter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Transmitter (see VARARGIN)

% Choose default command line output for Transmitter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Transmitter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Transmitter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function msg_Callback(hObject, eventdata, handles)
% hObject    handle to msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of msg as text
%        str2double(get(hObject,'String')) returns contents of msg as a double


% --- Executes during object creation, after setting all properties.
function msg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function binarymsg_Callback(hObject, eventdata, handles)
% hObject    handle to binarymsg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of binarymsg as text
%        str2double(get(hObject,'String')) returns contents of binarymsg as a double


% --- Executes during object creation, after setting all properties.
function binarymsg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to binarymsg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in send.
function send_Callback(hObject, eventdata, handles)
% hObject    handle to send (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=get(handles.msg,'String');
b=str2bin(a);
c=bin2manchester(b)
sendData(c);

set(handles.binarymsg,'String',c);




% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
impty='';
set(handles.msg,'String',impty);
set(handles.binarymsg,'String',impty);

