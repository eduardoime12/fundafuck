% clear all; close all; clc;

nomeDiretorio = strcat(raiz,'\');
Total = strcat(nomeDiretorio, NomeArquivo);
xlswrite(NomeArquivo,1);

e   = actxserver('Excel.Application');
ewb = e.Workbooks.Open(Total);
ewb.Worksheets.Item(1).Name = 'Acoes';
ewb.Worksheets.Item(2).Name = 'Ativos';
ewb.Worksheets.Item(3).Name = 'Passivos';
ewb.Worksheets.Item(4).Name = 'Dem. Resultados';
ewb.Save
ewb.Close(false)
e.Quit