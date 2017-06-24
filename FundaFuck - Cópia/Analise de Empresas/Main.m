function varargout = Main(varargin)
% MAIN MATLAB code for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 27-Mar-2017 11:01:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
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


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

cla reset;
set(handles.TELA_Caixa1, 'String', '');    
set(handles.TELA_Caixa1, 'Enable','off'); 
set(handles.TELA_Caixa1, 'Value',0); 
set(handles.TELA_Caixa2, 'String', '');    
set(handles.TELA_Caixa2, 'Enable','off');  
set(handles.TELA_Caixa2, 'Value',0); 
set(handles.TELA_Caixa3, 'String', '');    
set(handles.TELA_Caixa3, 'Enable','off');    
set(handles.TELA_Caixa3, 'Value',0); 
set(handles.TELA_Caixa4, 'String', '');    
set(handles.TELA_Caixa4, 'Enable','off');    
set(handles.TELA_Caixa4, 'Value',0); 
set(handles.TELA_Caixa5, 'String', '');    
set(handles.TELA_Caixa5, 'Enable','off');    
set(handles.TELA_Caixa5, 'Value',0); 
set(handles.TELA_Caixa6, 'String', '');    
set(handles.TELA_Caixa6, 'Enable','off');
set(handles.TELA_Caixa6, 'Value',0); 
set(handles.TELA_Caixa7, 'String', '');    
set(handles.TELA_Caixa7, 'Enable','off');    
set(handles.TELA_Caixa7, 'Value',0); 
set(handles.TELA_Caixa8, 'String', '');    
set(handles.TELA_Caixa8, 'Enable','off'); 
set(handles.TELA_Caixa8, 'Value',0); 
set(handles.TELA_Caixa9, 'String', '');    
set(handles.TELA_Caixa9, 'Enable','off');    
set(handles.TELA_Caixa9, 'Value',0); 
set(handles.TELA_Caixa10, 'String', '');    
set(handles.TELA_Caixa10, 'Enable','off');
set(handles.TELA_Caixa10, 'Value',0); 
set(handles.TELA_Caixa11, 'String', '');    
set(handles.TELA_Caixa11, 'Enable','off');    
set(handles.TELA_Caixa11, 'Value',0); 
set(handles.TELA_Caixa12, 'String', '');    
set(handles.TELA_Caixa12, 'Enable','off'); 
set(handles.TELA_Caixa12, 'Value',0); 
set(handles.TELA_Caixa13, 'String', '');    
set(handles.TELA_Caixa13, 'Enable','off');    
set(handles.TELA_Caixa13, 'Value',0); 
set(handles.TELA_Caixa14, 'String', '');    
set(handles.TELA_Caixa14, 'Enable','off');    
set(handles.TELA_Caixa14, 'Value',0); 
set(handles.TELA_Caixa15, 'String', '');    
set(handles.TELA_Caixa15, 'Enable','off');    
set(handles.TELA_Caixa15, 'Value',0); 
set(handles.TELA_Caixa16, 'String', '');    
set(handles.TELA_Caixa16, 'Enable','off');  
set(handles.TELA_Caixa16, 'Value',0); 
set(handles.TELA, 'Visible', 'off');

% Choose default command line output for Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in TELA_BotaoCarregaEmpresas.
function TELA_BotaoCarregaEmpresas_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_BotaoCarregaEmpresas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% -------------------------------------------------------------------------
% (*) Prepara a tela para análise.
cla reset;
set(handles.TELA_Caixa1, 'String', '');    
set(handles.TELA_Caixa1, 'Enable','off'); 
set(handles.TELA_Caixa1, 'Value',0); 
set(handles.TELA_Caixa2, 'String', '');    
set(handles.TELA_Caixa2, 'Enable','off');  
set(handles.TELA_Caixa2, 'Value',0); 
set(handles.TELA_Caixa3, 'String', '');    
set(handles.TELA_Caixa3, 'Enable','off');    
set(handles.TELA_Caixa3, 'Value',0); 
set(handles.TELA_Caixa4, 'String', '');    
set(handles.TELA_Caixa4, 'Enable','off');    
set(handles.TELA_Caixa4, 'Value',0); 
set(handles.TELA_Caixa5, 'String', '');    
set(handles.TELA_Caixa5, 'Enable','off');    
set(handles.TELA_Caixa5, 'Value',0); 
set(handles.TELA_Caixa6, 'String', '');    
set(handles.TELA_Caixa6, 'Enable','off');
set(handles.TELA_Caixa6, 'Value',0); 
set(handles.TELA_Caixa7, 'String', '');    
set(handles.TELA_Caixa7, 'Enable','off');    
set(handles.TELA_Caixa7, 'Value',0); 
set(handles.TELA_Caixa8, 'String', '');    
set(handles.TELA_Caixa8, 'Enable','off'); 
set(handles.TELA_Caixa8, 'Value',0); 
set(handles.TELA_Caixa9, 'String', '');    
set(handles.TELA_Caixa9, 'Enable','off');    
set(handles.TELA_Caixa9, 'Value',0); 
set(handles.TELA_Caixa10, 'String', '');    
set(handles.TELA_Caixa10, 'Enable','off');
set(handles.TELA_Caixa10, 'Value',0); 
set(handles.TELA_Caixa11, 'String', '');    
set(handles.TELA_Caixa11, 'Enable','off');    
set(handles.TELA_Caixa11, 'Value',0); 
set(handles.TELA_Caixa12, 'String', '');    
set(handles.TELA_Caixa12, 'Enable','off'); 
set(handles.TELA_Caixa12, 'Value',0); 
set(handles.TELA_Caixa13, 'String', '');    
set(handles.TELA_Caixa13, 'Enable','off');    
set(handles.TELA_Caixa13, 'Value',0); 
set(handles.TELA_Caixa14, 'String', '');    
set(handles.TELA_Caixa14, 'Enable','off');    
set(handles.TELA_Caixa14, 'Value',0); 
set(handles.TELA_Caixa15, 'String', '');    
set(handles.TELA_Caixa15, 'Enable','off');    
set(handles.TELA_Caixa15, 'Value',0); 
set(handles.TELA_Caixa16, 'String', '');    
set(handles.TELA_Caixa16, 'Enable','off');  
set(handles.TELA_Caixa16, 'Value',0); 
set(handles.TELA, 'Visible', 'off');


% -------------------------------------------------------------------------
% (*) A primeira parte do programa selecionará A PASTA a qual tem os
%     arquivos '*.mat'.
DiretorioRaiz = pwd;

% -------------------------------------------------------------------------
% (*) A segunda parte selecionará os arquivos '*.mat' dentro da pasta
%     selecionada. Essa seleção pode ser múltipla, bastando apenas segurar
%     o botão CTRL enquanto seleciona os arquivos.
% Jota = 'Selecione os arquivos *.mat references aos balanços trimestrais da empresa';
% [NomeArquivo, CaminhoArquivo, ~] = uigetfile(fullfile(raiz, '*.mat'), 'MultiSelect', 'on', Jota);
% rmpath([CaminhoArquivo]);
% addpath([CaminhoArquivo]); 



[Empresa, Caminho,~] = uigetfile('*.mat', 'MultiSelect', 'on');
DiretorioRaiz = pwd;
addpath(DiretorioRaiz);
addpath(Caminho);
% clear DiretorioRaiz;

% -------------------------------------------------------------------------
% (*) Verifica a quantidade máxima de empresas selecionadas e já abre o GUI
%     para a seleção do 'Indicador' desejado e do período levado em conta.
Empresa = cellstr(Empresa);
n       = max(size(Empresa));
if (n == 1)
    handles.Empresa{1} = load(Empresa{1});
else
    for i=1:n
        handles.Empresa{i} = load(Empresa{i});
    end
end
handles.totalEmpresas = n;

% -------------------------------------------------------------------------
% (*) Definição do sistemas de Cores
handles.Cor = {'b-o','g-o','r-o','c-o','m-o','y-o','k-o','b-.o','g-.o','r-.o','c-.o','m-.o','y-.o',...
               'k-.o'}; 
   
% -------------------------------------------------------------------------
% (*) Flag para saber se tem a quantidade de empresas listadas. 
flag = linspace(0,0,16);
for i=1:n
    flag(i) = 1;
end
% handles.flag = flag;
    
% -------------------------------------------------------------------------
% (*) Preenche as posições com os nomes das empresas.
%
% 1º Posição
if (flag(1) == 1)
    set(handles.TELA_Caixa1, 'String', handles.Empresa{1}.o.Nome);
    set(handles.TELA_Caixa1, 'Enable','on');   
else
    set(handles.TELA_Caixa1, 'Enable','off');    
end

% 2º Posição
if (flag(2) == 1)
    set(handles.TELA_Caixa2, 'String', handles.Empresa{2}.o.Nome);    
    set(handles.TELA_Caixa2, 'Enable','on');   
else
    set(handles.TELA_Caixa2, 'Enable','off');    
end
    
% 3º Posição
if (flag(3) == 1)
    set(handles.TELA_Caixa3, 'String', handles.Empresa{3}.o.Nome);    
    set(handles.TELA_Caixa3, 'Enable','on');   
else
    set(handles.TELA_Caixa3, 'Enable','off');    
end

% 4º Posição
if (flag(4) == 1)
    set(handles.TELA_Caixa4, 'String', handles.Empresa{4}.o.Nome);
    set(handles.TELA_Caixa4, 'Enable','on');   
else
    set(handles.TELA_Caixa4, 'Enable','off');    
end

% 5º Posição
if (flag(5) == 1)
    set(handles.TELA_Caixa5, 'String', handles.Empresa{5}.o.Nome);
    set(handles.TELA_Caixa5, 'Enable','on');   
else
    set(handles.TELA_Caixa5, 'Enable','off');    
end

% 6º Posição
if (flag(6) == 1)
    set(handles.TELA_Caixa6, 'String', handles.Empresa{6}.o.Nome);    
    set(handles.TELA_Caixa6, 'Enable','on');   
else
    set(handles.TELA_Caixa6, 'Enable','off');    
end

% 7º Posição
if (flag(7) == 1)
    set(handles.TELA_Caixa7, 'String', handles.Empresa{7}.o.Nome);    
    set(handles.TELA_Caixa7, 'Enable','on');   
else
    set(handles.TELA_Caixa7, 'Enable','off');    
end

% 8º Posição
if (flag(8) == 1)
    set(handles.TELA_Caixa8, 'String', handles.Empresa{8}.o.Nome);    
    set(handles.TELA_Caixa8, 'Enable','on');   
else
    set(handles.TELA_Caixa8, 'Enable','off');    
end

% 9º Posição
if (flag(9) == 1)
    set(handles.TELA_Caixa9, 'String', handles.Empresa{9}.o.Nome);    
    set(handles.TELA_Caixa9, 'Enable','on');   
else
    set(handles.TELA_Caixa9, 'Enable','off');    
end

% 10º Posição
if (flag(10) == 1)
    set(handles.TELA_Caixa10, 'String', handles.Empresa{10}.o.Nome);    
    set(handles.TELA_Caixa10, 'Enable','on');   
else
    set(handles.TELA_Caixa10, 'Enable','off');    
end

% 11º Posição
if (flag(11) == 1)
    set(handles.TELA_Caixa11, 'String', handles.Empresa{11}.o.Nome);    
    set(handles.TELA_Caixa11, 'Enable','on');   
else
    set(handles.TELA_Caixa11, 'Enable','off');    
end

% 12º Posição
if (flag(12) == 1)
    set(handles.TELA_Caixa12, 'String', handles.Empresa{12}.o.Nome);    
    set(handles.TELA_Caixa12, 'Enable','on');   
else
    set(handles.TELA_Caixa12, 'Enable','off');    
end

% 13º Posição
if (flag(13) == 1)
    set(handles.TELA_Caixa13, 'String', handles.Empresa{13}.o.Nome);  
    set(handles.TELA_Caixa13, 'Enable','on');   
else
    set(handles.TELA_Caixa13, 'Enable','off');    
end

% 14º Posição
if (flag(14) == 1)
    set(handles.TELA_Caixa14, 'String', handles.Empresa{14}.o.Nome);    
    set(handles.TELA_Caixa14, 'Enable','on');   
else
    set(handles.TELA_Caixa14, 'Enable','off');    
end

% 15º Posição
if (flag(15) == 1)
    set(handles.TELA_Caixa15, 'String', handles.Empresa{15}.o.Nome); 
    set(handles.TELA_Caixa15, 'Enable','on');   
else
    set(handles.TELA_Caixa15, 'Enable','off');    
end

% 16º Posição
if (flag(16) == 1)
    set(handles.TELA_Caixa16, 'String', handles.Empresa{16}.o.Nome); 
    set(handles.TELA_Caixa16, 'Enable','on');   
else
    set(handles.TELA_Caixa16, 'Enable','off');    
end

% -------------------------------------------------------------------------
% Choose default command line output for BovespaFundamentus
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);




% --- Executes during object creation, after setting all properties.
function TELA_Periodo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TELA_Periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TELA_Grafico.
function TELA_Grafico_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Grafico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in TELA_Caixa1.
function TELA_Caixa1_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa1


% --- Executes on button press in TELA_Caixa2.
function TELA_Caixa2_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa2


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in TELA_Caixa3.
function TELA_Caixa3_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa3


% --- Executes on button press in TELA_Caixa4.
function TELA_Caixa4_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa4


% --- Executes on button press in TELA_Caixa5.
function TELA_Caixa5_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa5


% --- Executes on button press in TELA_Caixa6.
function TELA_Caixa6_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa6


% --- Executes on button press in TELA_Caixa7.
function TELA_Caixa7_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa7


% --- Executes on button press in TELA_Caixa8.
function TELA_Caixa8_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa8


% --- Executes on button press in TELA_Caixa9.
function TELA_Caixa9_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa9


% --- Executes on button press in TELA_Caixa10.
function TELA_Caixa10_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa10


% --- Executes on button press in TELA_Caixa11.
function TELA_Caixa11_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa11


% --- Executes on button press in TELA_Caixa12.
function TELA_Caixa12_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa12


% --- Executes on button press in TELA_Caixa13.
function TELA_Caixa13_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa13


% --- Executes on button press in TELA_Caixa14.
function TELA_Caixa14_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa14


% --- Executes on button press in TELA_Caixa15.
function TELA_Caixa15_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa15


% --- Executes on button press in TELA_Caixa16.
function TELA_Caixa16_Callback(hObject, eventdata, handles)
% hObject    handle to TELA_Caixa16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TELA_Caixa16



% --- Executes on selection change in Indicadores.
function Indicadores_Callback(hObject, eventdata, handles)
% hObject    handle to Indicadores (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% -------------------------------------------------------------------------
% (*) Pega todos os dados salvos pelo 'guidata', ou seja, leio eles 
%     OBRIGATÓRIO SE EXISTIR ATUALIZAÇÃO DE VARIÁVEIS GLOBAIS.
handles = guidata(hObject);

set(handles.TELA, 'Visible', 'on');

% Indicador 1
Valor             = get(handles.Indicadores, 'Value');
StringIndicadores = get(handles.Indicadores, 'String');
Indicador         = StringIndicadores(Valor);


% -------------------------------------------------------------------------
% (*) Verifica qual a empresa que está selecionada.
flag(1)  = get(handles.TELA_Caixa1,'Value');
flag(2)  = get(handles.TELA_Caixa2,'Value');
flag(3)  = get(handles.TELA_Caixa3,'Value');
flag(4)  = get(handles.TELA_Caixa4,'Value');
flag(5)  = get(handles.TELA_Caixa5,'Value');
flag(6)  = get(handles.TELA_Caixa6,'Value');
flag(7)  = get(handles.TELA_Caixa7,'Value');
flag(8)  = get(handles.TELA_Caixa8,'Value');
flag(9)  = get(handles.TELA_Caixa9,'Value');
flag(10) = get(handles.TELA_Caixa10,'Value');
flag(11) = get(handles.TELA_Caixa11,'Value');
flag(12) = get(handles.TELA_Caixa12,'Value');
flag(13) = get(handles.TELA_Caixa13,'Value');
flag(14) = get(handles.TELA_Caixa14,'Value');
flag(15) = get(handles.TELA_Caixa15,'Value');
flag(16) = get(handles.TELA_Caixa16,'Value');


% -------------------------------------------------------------------------
% (*) Existe alguma empresa selecionada?
contador = 0;
for i=1:16
    if(flag(i) == 1)
        contador = contador + 1;
    end
end
axis.YAxisPosition = 'left';
% (*) Se existir, faça o gráfico imprimir o referido Indicador no gráfico
if (contador > 0)
    cla reset;
    % Legenda  = {};
    contador = 0;
    for i=1:16
        if (flag(i) == 1)
            contador    = contador + 1;
            a(contador) = handles.Empresa{i}.o;
        end   
    end

    % (*) Plota o resultado no gráfico
    Legenda = {};
    for i=1:contador
        a(i).plotaIndicador(Indicador, handles.Cor{i});
        hold on;
        Legenda{i} = a(i).Nome;
    end
    legend(Legenda, 'Location', 'NorthEastOutside');
    grid on;
else
    cla reset;
end


% --- Executes during object creation, after setting all properties.
function Indicadores_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Indicadores (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BOTAO_Hold.
function BOTAO_Hold_Callback(hObject, eventdata, handles)
% hObject    handle to BOTAO_Hold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of BOTAO_Hold


% --- Executes on selection change in Indicadores2.
function Indicadores2_Callback(hObject, eventdata, handles)
% hObject    handle to Indicadores2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% -------------------------------------------------------------------------
% (*) Pega todos os dados salvos pelo 'guidata', ou seja, leio eles 
%     OBRIGATÓRIO SE EXISTIR ATUALIZAÇÃO DE VARIÁVEIS GLOBAIS.
handles = guidata(hObject);

set(handles.TELA, 'Visible', 'on');

% Indicador 1
Valor             = get(handles.Indicadores, 'Value');
StringIndicadores = get(handles.Indicadores, 'String');
Indicador         = StringIndicadores(Valor);

% Indicador 2
Valor              = get(handles.Indicadores2, 'Value');
StringIndicadores  = get(handles.Indicadores2, 'String');
Indicador2         = StringIndicadores(Valor);

% Botão hold
Botao_hold         = get(handles.BOTAO_Hold, 'Value');


% -------------------------------------------------------------------------
% (*) Verifica qual a empresa que está selecionada.
flag(1)  = get(handles.TELA_Caixa1,'Value');
flag(2)  = get(handles.TELA_Caixa2,'Value');
flag(3)  = get(handles.TELA_Caixa3,'Value');
flag(4)  = get(handles.TELA_Caixa4,'Value');
flag(5)  = get(handles.TELA_Caixa5,'Value');
flag(6)  = get(handles.TELA_Caixa6,'Value');
flag(7)  = get(handles.TELA_Caixa7,'Value');
flag(8)  = get(handles.TELA_Caixa8,'Value');
flag(9)  = get(handles.TELA_Caixa9,'Value');
flag(10) = get(handles.TELA_Caixa10,'Value');
flag(11) = get(handles.TELA_Caixa11,'Value');
flag(12) = get(handles.TELA_Caixa12,'Value');
flag(13) = get(handles.TELA_Caixa13,'Value');
flag(14) = get(handles.TELA_Caixa14,'Value');
flag(15) = get(handles.TELA_Caixa15,'Value');
flag(16) = get(handles.TELA_Caixa16,'Value');



% -------------------------------------------------------------------------
% (*) Existe alguma empresa selecionada?
contador = 0;
for i=1:16
    if(flag(i) == 1)
        contador = contador + 1;
    end
end

if (Botao_hold == 0);
    axis.YAxisPosition = 'left';
    % (*) Se existir, faça o gráfico imprimir o referido Indicador no gráfico
    if (contador > 0)
        cla reset;
        % Legenda  = {};
        contador = 0;
        for i=1:16
            if (flag(i) == 1)
                contador    = contador + 1;
                a(contador) = handles.Empresa{i}.o;
            end   
        end

        % (*) Plota o resultado no gráfico
        Legenda = {};
        for i=1:contador
            a(i).plotaIndicador(Indicador, handles.Cor{i});
            hold on;
            Legenda{i} = a(i).Nome;
        end
        legend(Legenda, 'Location', 'NorthEastOutside');
        grid on;
    else
        cla reset;
    end
elseif (Botao_hold == 1) 
    
    % (*) Se existir, faça o gráfico imprimir o referido Indicador no gráfico
    if (contador == 1)
        cla reset;
        contador = 0;
        for i=1:16
            if (flag(i) == 1)
                contador    = contador + 1;
                a(contador) = handles.Empresa{i}.o;
            end   
        end
        
        a(1).plotaIndicador(Indicador, handles.Cor{1}, Indicador2);
%         % (*) Plota o resultado no gráfico - Eixo Esquerdo
%         Legenda = {}; 
%         a(1).plotaIndicador(Indicador, handles.Cor{1});
%         hold on;
%         Legenda{1} = a(1).Nome;
%         
%         % (*) Plota o resultado no gráfico - Eixo Direito
%         axis.YAxisPosition = 'right';
%         a(1).plotaIndicador(Indicador2, handles.Cor{2});
%         Legenda{2} = a(1).Nome;
%         
%         legend(Legenda, 'Location', 'NorthEastOutside');
%         grid on;
    else
        msgbox('Possivelmente não há nenhuma empresa selecionada ou mais de uma.');
        cla reset;
    end
end






% --- Executes during object creation, after setting all properties.
function Indicadores2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Indicadores2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function variasEmpresas_Callback(hObject, eventdata, handles)
% hObject    handle to variasEmpresas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function umaEmpresa_Callback(hObject, eventdata, handles)
% hObject    handle to umaEmpresa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Uma
