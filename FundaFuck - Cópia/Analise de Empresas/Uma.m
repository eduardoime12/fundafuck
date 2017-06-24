function varargout = Uma(varargin)
% UMA MATLAB code for Uma.fig
%      UMA, by itself, creates a new UMA or raises the existing
%      singleton*.
%
%      H = UMA returns the handle to a new UMA or the handle to
%      the existing singleton*.
%
%      UMA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UMA.M with the given input arguments.
%
%      UMA('Property','Value',...) creates a new UMA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Uma_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Uma_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Uma

% Last Modified by GUIDE v2.5 03-Apr-2017 11:40:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Uma_OpeningFcn, ...
                   'gui_OutputFcn',  @Uma_OutputFcn, ...
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


% --- Executes just before Uma is made visible.
function Uma_OpeningFcn(hObject, eventdata, handles, varargin)
cla reset;
set(handles.TELA_Empresa, 'String', '');    
set(handles.TELA_Empresa, 'Enable','off'); 

set(handles.TELA_SeletorGrafico1b, 'Enable', 'off');    
set(handles.TELA_SeletorGrafico2b, 'Enable', 'off');    
set(handles.TELA_SeletorGrafico3b, 'Enable', 'off');    
set(handles.TELA_SeletorGrafico4b, 'Enable', 'off');    

% Choose default command line output for Uma
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Uma wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Uma_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in TELA_Carregar.
function TELA_Carregar_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Carregar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DiretorioRaiz = pwd;
% -------------------------------------------------------------------------
% (*) A segunda parte selecionará os arquivos '*.mat' dentro da pasta
%     selecionada. Essa seleção pode ser múltipla, bastando apenas segurar
%     o botão CTRL enquanto seleciona os arquivos.
% Jota = 'Selecione os arquivos *.mat references aos balanços trimestrais da empresa';
% [NomeArquivo, CaminhoArquivo, ~] = uigetfile(fullfile(raiz, '*.mat'), 'MultiSelect', 'on', Jota);
% rmpath([CaminhoArquivo]);
% addpath([CaminhoArquivo]); 

[Empresa, Caminho,~] = uigetfile('*.mat');
DiretorioRaiz = pwd;
addpath(DiretorioRaiz);
addpath(Caminho);


Empresa = cellstr(Empresa);
n       = max(size(Empresa));
if (n == 1)
    handles.Empresa{1} = load(Empresa{1});
end
handles.totalEmpresas = n;


set(handles.TELA_Empresa, 'String', handles.Empresa{1}.o.Nome);
set(handles.TELA_Empresa, 'Enable', 'on');   
set(handles.TELA_Empresa, 'BackGroundColor', 'white');   
set(handles.TELA_Empresa, 'ForegroundColor', 'red');  

% Choose default command line output for Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Executes on selection change in TELA_SeletorGrafico1a.
function TELA_SeletorGrafico1a_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

valor = get(handles.hold1, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico1b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico1a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico1a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico1);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico1b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico1a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico1a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico1b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico1b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico1);
    a(1).plotaIndicador(Indicador, 'b', Indicador2); 
    grid on;
end



% --- Executes during object creation, after setting all properties.
function TELA_SeletorGrafico1a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TELA_SeletorGrafico1a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in hold1.
function hold1_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

valor = get(handles.hold1, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico1b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico1a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico1a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico1);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico1b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico1a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico1a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico1b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico1b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico1);
    a(1).plotaIndicador(Indicador, 'b', Indicador2);  
    grid on;
end



% --- Executes on selection change in TELA_SeletorGrafico1b.
function TELA_SeletorGrafico1b_Callback(hObject, eventdata, handles)

% Pega os dados carregados.
handles = guidata(hObject);

valor = get(handles.hold1, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico1b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico1a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico1a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico1);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico1b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico1a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico1a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico1b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico1b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico1);
    a(1).plotaIndicador(Indicador, 'b', Indicador2);  
    grid on;
end





% --- Executes during object creation, after setting all properties.
function TELA_SeletorGrafico1b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TELA_SeletorGrafico1b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in TELA_SeletorGrafico2a.
function TELA_SeletorGrafico2a_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

valor = get(handles.hold2, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico2b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico2a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico2a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico2);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico1b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico2a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico2a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico2b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico2b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico2);
    a(1).plotaIndicador(Indicador, 'b', Indicador2); 
    grid on;
end



% --- Executes during object creation, after setting all properties.
function TELA_SeletorGrafico2a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TELA_SeletorGrafico2a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in hold2.
function hold2_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

valor = get(handles.hold2, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico2b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico2a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico2a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico2);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico2b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico2a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico2a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico2b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico2b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico2);
    a(1).plotaIndicador(Indicador, 'b', Indicador2);
    grid on;
end


% --- Executes on selection change in TELA_SeletorGrafico2b.
function TELA_SeletorGrafico2b_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

valor = get(handles.hold2, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico2b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico2a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico2a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico2);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico2b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico2a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico2a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico2b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico2b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico2);
    a(1).plotaIndicador(Indicador, 'b', Indicador2);
    grid on;
end


% --- Executes during object creation, after setting all properties.
function TELA_SeletorGrafico2b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TELA_SeletorGrafico2b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in TELA_SeletorGrafico3a.
function TELA_SeletorGrafico3a_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

valor = get(handles.hold3, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico3b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico3a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico3a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico3);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico3b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico3a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico3a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico3b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico3b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico3);
    a(1).plotaIndicador(Indicador, 'b', Indicador2);
    grid on;
end


% --- Executes during object creation, after setting all properties.
function TELA_SeletorGrafico3a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TELA_SeletorGrafico3a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in hold3.
function hold3_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

valor = get(handles.hold3, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico3b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico3a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico3a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico3);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico3b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico3a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico3a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico3b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico3b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico3);
    a(1).plotaIndicador(Indicador, 'b', Indicador2);
    grid on;
end


% --- Executes on selection change in TELA_SeletorGrafico3b.
function TELA_SeletorGrafico3b_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

valor = get(handles.hold3, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico3b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico3a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico3a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico3);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico3b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico3a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico3a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico3b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico3b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico3);
    a(1).plotaIndicador(Indicador, 'b', Indicador2);
    grid on;
end


% --- Executes during object creation, after setting all properties.
function TELA_SeletorGrafico3b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TELA_SeletorGrafico3b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in TELA_SeletorGrafico4a.
function TELA_SeletorGrafico4a_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

valor = get(handles.hold4, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico4b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico4a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico4a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico4);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico4b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico4a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico4a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico4b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico4b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico4);
    a(1).plotaIndicador(Indicador, 'b', Indicador2);
    grid on;
end


% --- Executes during object creation, after setting all properties.
function TELA_SeletorGrafico4a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TELA_SeletorGrafico4a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in hold4.
function hold4_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

valor = get(handles.hold4, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico4b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico4a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico4a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico4);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico4b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico4a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico4a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico4b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico4b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico4);
    a(1).plotaIndicador(Indicador, 'b', Indicador2);
    grid on;
end


% --- Executes on selection change in TELA_SeletorGrafico4b.
function TELA_SeletorGrafico4b_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

valor = get(handles.hold4, 'Value');
if (valor == 0)
    set(handles.TELA_SeletorGrafico4b, 'Enable', 'off'); 
    
     % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico4a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico4a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico4);
    
    a(1).plotaIndicador(Indicador, 'b');
    grid on;
    Legenda{1} = a(1).Nome;
else
    set(handles.TELA_SeletorGrafico4b, 'Enable', 'on'); 
    
    % Indicador 1
    Valor             = get(handles.TELA_SeletorGrafico4a, 'Value');
    StringIndicadores = get(handles.TELA_SeletorGrafico4a, 'String');
    Indicador         = StringIndicadores(Valor);
    
    % Seleciona o Indicador 2.
    Valor2              = get(handles.TELA_SeletorGrafico4b, 'Value');
    StringIndicadores2  = get(handles.TELA_SeletorGrafico4b, 'String');
    Indicador2          = StringIndicadores2(Valor2);
    
    % Puxa a empresa e seleciona onde que essas informações irão aparecer.
    a(1) = handles.Empresa{1}.o;
    axes(handles.TELA_Grafico4);
    a(1).plotaIndicador(Indicador, 'b', Indicador2);
    grid on;
end



% --- Executes during object creation, after setting all properties.
function TELA_SeletorGrafico4b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TELA_SeletorGrafico4b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
