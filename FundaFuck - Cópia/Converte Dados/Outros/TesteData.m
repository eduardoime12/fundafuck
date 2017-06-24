clear all; close all; clc

% -------------------------------------------------------------------------
% (*) A primeira parte do programa selecionará A PASTA a qual tem os
%     arquivos '*.mat'.
raiz    = pwd;
[NomeArquivo, CaminhoArquivo, ~] = uigetfile(fullfile(raiz, '*.mat'), 'MultiSelect', 'on');
rmpath([CaminhoArquivo]);
addpath([CaminhoArquivo]); 

% -------------------------------------------------------------------------
% (*) Abre um monte de arquivo '*.mat'
% (*) Para facilitar eu irei salver todas as variáveis em um vetor chamado
%     TRI, em referência à trimestre.
TRI = cellstr(NomeArquivo);
n       = max(size(TRI));
if (n == 1)
    TRI{1} = load(TRI{1});
else
    for i=1:n
        TRI{i} = load(TRI{i});
    end
end


% -------------------------------------------------------------------------
% (*) Ordenas as datas em ordem DECRESCENTE.
DATAS = [];
for i=1:n
   Data(i,:)    = TRI{i}.o.T1.data;
   DataYYYYMMDD = fnYYYYMMDD(Data(i,:));
   DATAS = [DATAS; DataYYYYMMDD];
end
DOrdenada = fnOrdenaDatas(DATAS);     % Datas ordenadas (no formato bruto)
DOrdenada = fnYYYYMMDD2String(DOrdenada);


% -------------------------------------------------------------------------
% (*) Comparativo entre as STRINGS de 'DOrdenada' com as STRINGS dos
%     trimestres
for i=1:n
    str1 = DOrdenada(i,:);
    for j=1:n
       if(strcmp(str1, TRI{j}.o.T1.data))
           disp(TRI{j}.o.T1.data);
       end
    end
end


