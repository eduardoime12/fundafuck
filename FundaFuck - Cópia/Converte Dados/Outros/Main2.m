clear all; close all; clc;

% -------------------------------------------------------------------------
%                          Inclusão das Funções
% -------------------------------------------------------------------------
raiz    = pwd;
subRaiz = {'Funções'};

nMax = max(size(subRaiz));
for i = 1:nMax
    rmpath([raiz '\' subRaiz{i,:}]);
    addpath([raiz '\' subRaiz{i,:}]); 
end
clc;
% -------------------------------------------------------------------------
%                       Inclusão das Planilhas .xls
% -------------------------------------------------------------------------
TEXTO = 'Selecione os arquivos .xls com o balanço condensado da empresa';
[NomeArquivo_Excel, CaminhoArquivo, ~] = uigetfile(fullfile(raiz, '*.xls'), TEXTO);
rmpath([CaminhoArquivo]);
addpath([CaminhoArquivo]); 
file = importdata(NomeArquivo_Excel);

% Lendo os arquivos.
% ------------------
Plan1 = file.data.Plan1;  
Plan2 = file.data.Plan2;
Plan3 = file.data.Plan3;
Plan4 = file.data.Plan4;
% Corta apenas os valores positivos.
Plan2 = Plan2(:,3:end);
Plan3 = Plan3(:,3:end);
% Plan4 = Plan4(:,3:end);

cellDatas = file.textdata.Plan1(1,2:end);

% Quantos balanços trimestrais eu tenho?
% --------------------------------------
n1 = size(Plan1,1);        % Variáveis totais Tabela-1.      
n2 = size(Plan2,1);        % Variáveis totais Tabela-2.      
n3 = size(Plan3,1);        % Variáveis totais Tabela-3.      
n4 = size(Plan4,1);        % Variáveis totais Tabela-4.      
m  = size(cellDatas,2);    % Quantos balanços trimestrais existem?

% Deixando os balanços em ordem crescente de data.
% ------------------------------------------------
% Tabela 1.
for i=1:n1
    for j=1:m
        QuantAcoes(i,j) = Plan1(i,m-j+1);
    end
end

% Tabela 2.
for i=1:n2
    Temp = Plan2(i,1:end);
    Temp = wrev(Temp);
    for j=1:m
        Ativos(i,j) = Temp(1,j);
    end
end

% Tabela 3.
for i=1:n3
    Temp = Plan3(i,1:end);
    Temp = wrev(Temp);
    for j=1:m
        Passivos(i,j) = Temp(1,j);
    end
end

% Tabela 4.
for i=1:n4
    Temp = Plan4(i,1:end);
    Temp = wrev(Temp);
    for j=1:m
        DemonstracaoResultado(i,j) = Temp(1,j);
    end
end


% Convertendo datas.
for i=1:m
    numData(i) = datenum(cellDatas{i}, 'dd/mm/yyyy');
end
Data = wrev(numData); 

% -------------------------------------------------------------------------
%                           Dados Tabela 2
%
% -------------------------------------------------------------------------
Tabela1.AtivoTotal                       = Ativos(1,1:end);
Tabela1.AtivoCirculante                  = Ativos(2,1:end);
Tabela1.CaixaEEquivalenteDeCaixa         = Ativos(3,1:end);
Tabela1.AplicacoesFinanceiras            = Ativos(4,1:end);
Tabela1.ContasAReceber                   = Ativos(5,1:end);
Tabela1.Estoques                         = Ativos(6,1:end);
Tabela1.AtivosBiologicos                 = Ativos(7,1:end);
Tabela1.TributosARecuperar               = Ativos(8,1:end);
Tabela1.DespesasAntecipadas              = Ativos(9,1:end);
Tabela1.OutrosAtivosCirculantes          = Ativos(10,1:end);
Tabela1.AtivoNaoCirculantes              = Ativos(11,1:end);
Tabela1.AtivoRealizavelALongoPrazo       = Ativos(12,1:end);
Tabela1.Investimentos                    = Ativos(13,1:end);
Tabela1.Imobilizado                      = Ativos(14,1:end);
Tabela1.Intangivel                       = Ativos(15,1:end);
Tabela1.Diferido                         = Ativos(15,1:end);


% -------------------------------------------------------------------------
%                           Dados Tabela 3
%
% -------------------------------------------------------------------------
Tabela2.PassivoTotal                     = Passivos(1,1:end);
Tabela2.PassivoCirculante                = Passivos(2,1:end);
Tabela2.ObrigacoesSociaisETrabalhitas    = Passivos(3,1:end);
Tabela2.Fornecedores                     = Passivos(4,1:end);
Tabela2.ObrigacoesFiscais                = Passivos(5,1:end);
Tabela2.EmprestimosFinanciamentos        = Passivos(6,1:end);
Tabela2.OutrasObrigacoes                 = Passivos(7,1:end);
Tabela2.Provisoes                        = Passivos(8,1:end);
Tabela2.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados = Passivos(9,1:end);
Tabela2.PassivoNaoCirculante             = Passivos(10,1:end);
Tabela2.EmprestimosFinanciamentos2       = Passivos(11,1:end);
Tabela2.OutrasObrigacoes2                = Passivos(12,1:end);
Tabela2.TributosDiferidos                = Passivos(13,1:end);
Tabela2.Provisoes2                       = Passivos(14,1:end);
Tabela2.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados2 = Passivos(15,1:end);
Tabela2.LucroEReceitasAApropriar         = Passivos(16,1:end);
Tabela2.PatrimonioLiquido                = Passivos(17,1:end);
Tabela2.CapitalSocialRealizado           = Passivos(18,1:end);
Tabela2.ReservasDeCapital                = Passivos(19,1:end);
Tabela2.ReservasDeReavaliacao            = Passivos(20,1:end);
Tabela2.ReservasDeLucros                 = Passivos(21,1:end);
Tabela2.LucrosPrejuizosAcumulados        = Passivos(22,1:end);
Tabela2.AjustesDeAvaliacaoPatrimonial    = Passivos(23,1:end);
Tabela2.AjustesAcumuladosDeConversao     = Passivos(24,1:end);
Tabela2.OutrosResultadosAbrangentes      = Passivos(25,1:end);


% -------------------------------------------------------------------------
%                           Dados Tabela 4
%
% -------------------------------------------------------------------------
Tabela3.ReceitaDeVendaDeBensEOUServicos                        = DemonstracaoResultado(1,1:end);
Tabela3.CustoDosBensEOUServicosVendidos                        = DemonstracaoResultado(2,1:end);
Tabela3.ResultadoBruto                                         = DemonstracaoResultado(3,1:end);
Tabela3.DespesasReceitasOperacionais                           = DemonstracaoResultado(4,1:end);
Tabela3.ResultadoAntesDoResultadoFinanceiroEDOSTributos        = DemonstracaoResultado(5,1:end);
Tabela3.ResultadoFinanceiro                                    = DemonstracaoResultado(6,1:end);
Tabela3.ResultadoAntesDosTributosSobreOLucro                   = DemonstracaoResultado(7,1:end);
Tabela3.ImpostoDeRendaEContribuicaoSocialSobreOLucro           = DemonstracaoResultado(8,1:end);
Tabela3.ResultadoLiquidoDasOperacoesContinuadas                = DemonstracaoResultado(9,1:end);
Tabela3.ResultadoLiquidoDeOperacoesDescontinuadas              = DemonstracaoResultado(10,1:end);
Tabela3.LucroPrejuizoDoPeriodo                                 = DemonstracaoResultado(11,1:end);

% -------------------------------------------------------------------------
%                 NomeArquivo_Excel      Salvando os Dados da Empresa.
% -------------------------------------------------------------------------
% Concatena nome da Empresa.
Empresa = strtok(NomeArquivo_Excel,'.');
Empresa = upper(Empresa);
EmpresaBRUTO = strcat(Empresa, '_BRUTO');

% Datas dos balanços.
estrutura  = struct('D', Data, 'QuantAcoes', QuantAcoes,...
                    'T1', Tabela1, 'T2', Tabela2, 'T3', Tabela3);
eval([EmpresaBRUTO '=estrutura;']);
FileNameSaveBRUTO = strcat(EmpresaBRUTO, '.mat');
save(FileNameSaveBRUTO, EmpresaBRUTO);

% o = ClasseInd(estrutura);