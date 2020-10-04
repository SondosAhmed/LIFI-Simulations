function varargout = Receiver(varargin)
% RECEIVER MATLAB code for Receiver.fig
%      RECEIVER, by itself, creates a new RECEIVER or raises the existing
%      singleton*.
%
%      H = RECEIVER returns the handle to a new RECEIVER or the handle to
%      the existing singleton*.
%
%      RECEIVER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECEIVER.M with the given input arguments.
%
%      RECEIVER('Property','Value',...) creates a new RECEIVER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Receiver_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Receiver_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Receiver

% Last Modified by GUIDE v2.5 18-Mar-2017 07:03:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Receiver_OpeningFcn, ...
                   'gui_OutputFcn',  @Receiver_OutputFcn, ...
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


% --- Executes just before Receiver is made visible.
function Receiver_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Receiver (see VARARGIN)

% Choose default command line output for Receiver
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Receiver wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Receiver_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in receive.
function receive_Callback(hObject, eventdata, handles)
% hObject    handle to receive (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%x=getData();
x=get(handles.binarymsg,'String');
c=manchester2bin(x);
b=bin2str(c);
set(handles.msg,'String',b);

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
impty='';
set(handles.msg,'String',impty);
set(handles.binarymsg,'String',impty);



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
