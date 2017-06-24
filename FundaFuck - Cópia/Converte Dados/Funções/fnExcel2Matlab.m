function [File] = fnExcel2Matlab(file, NomeArquivo_Excel, CaminhoArquivo)

% Atualizações
% -------------
%
% 1. Dia 13/03/2017
% 
%  (*) Inseri na estrutura de dados da Tabela 1, a seguinte variável:
%      -- 'T1.totalAcoesEmTesouraria' na 'Total - Em Tesouraria';
%
%  (*) Inseri na estrutura de dados da Tabela 3, a seguinte variável:
%      -- T3.DividendosEJCPAPagar na 'Dividendos e JCP a pagar';          
%
%  (*) Inseri na estrutura de dados da Tabela 3, as seguinte variáveis:
%      -- T4.DespesasComVendas na 'Despesas com Vendas';  e
%      -- T4.DespesasGeraisEAdministrativas na 'Despesas Gerais e Administrativas';  
%
%
% 2. Dia 14/03/2016
% 
% (*) Inseri na estrutura de dados da Tabela 3, as seguinte variáveis:
%      -- T4.AtribuidoASóciosDaEmpresaControladora na aba
%            'Atribuído a Sócios da Empresa Controladora'; e
%      -- T4.AtribuidoASociosNãoControladora na aba 
%            'Atribuído a Sócios Não Controladora';  
% 
% 3. Dia 16/03/2017
%  
% (*) Algumas empresas apresentam as suas ações as vezes em milhar e as
%     vezes em unidade. No caso, eu criarei uma rotina que verifica se a
%     quantidade de ações vem em unidades ou em milhar. Para tal, a ideia é
%     fazer uma procura por alguma string característica e se existir ela,
%     é porque existe alguma perpectiva de milhar ou não.
% -------------------------------------------------------------------------  

AbaVelho = fieldnames(file.textdata);
[NomeArquivo_Matlab, remain] = strtok(NomeArquivo_Excel,'.');


disp(['Convertendo o arquivo --- ' NomeArquivo_Excel ' ...']);
% 3.: As abas do Excel carregadas pela função 'uigetfile' inserem caracteres
%     que não são válidos no ambiente Matlab. No caso, eles são carregados
%     como hexadecimal. De forma a corrigir estes nomes de forma a ter menos
%     trabalho de identificação de qual arquivo estamos trabalhando, serão,
%     num primeiro momento, corrigido quaisquer problemas de migração de
%     dados. No caso, serão inseridos os dados sem cedinha ou acentos.
aspa = '';
Hexa2String = {'0xE7', 'c';
               '0xE3', 'a';
               '0x2E',  '';
               '0x2D',  '';
               '0xED', 'i';};
QuantAbas   = max(size(AbaVelho));
for i=1:QuantAbas
    AbaVelho{i} = strcat(aspa, AbaVelho{i});
    AbaVelho{i} = strcat(AbaVelho{i}, aspa);
    AbaNovo{i}  = AbaVelho{i};
    for j=1:max(size(Hexa2String))
        AbaNovo{i} = regexprep(AbaNovo{i}, Hexa2String{j,1}, Hexa2String{j,2});
    end
end


% 4.: Reescreve as abas internas da substruct 'data' quanto de 'textdata' 
%     do arquivo 'file'.
for i=1:QuantAbas
    % 4.1.: Corrige os parâmetros de 'data'.
    if (isfield(file.data, AbaVelho{i}))
        [file.data.(AbaNovo{i})] = file.data.(AbaVelho{i});
    end
    
    if (isfield(file.textdata, AbaVelho{i}))
    % 4.2.: Corrige os parâmetros de 'textdata'.
        [file.textdata.(AbaNovo{i})] = file.textdata.(AbaVelho{i});
    end
end

% 5.: Reescreve as abas internas da struct 'file'.
[file.('dado')]  = file.('data');
[file.('texto')] = file.('textdata');
file = rmfield(file,'data');
file = rmfield(file,'textdata');



% -------------------------------------------------------------------------
%
%                    CRIANDO A NOVA ESTRUTURA DE DADOS
% 
% -------------------------------------------------------------------------
%
% 1.:  PRIMEIRA TABELA
%     -----------------
% 
%  (*) A parte de interesse aqui diz respeito à tabela intitulada
%     'Composição de Capital' do arquivo baixado do programa Empresa.net

%   a) Salvarei a 'data' do último dia do referido trimestre da tabela
%      importada.
trimestre = file.texto.ComposicaoDoCapital{1,2};
trimestre = strsplit(trimestre);
trimestre = trimestre{end};

%   b) Procura em qual linha está posicionada a variável relativa à
%      quantidade de ações da empresa.
%
% 1.: Elimina a primeira linha de texto, a qual faz referência à 'Número de
%     Ações (Mil' e também ao trimestre em análise.

% -------------------------------------------------------------------------
% Inserido dia 16/03/2017
ACOES  = file.texto.ComposicaoDoCapital(1,1);
ACOES  = char(ACOES);
texto1 = 'Mil';
texto2 = 'mil';
texto3 = 'Uni';
texto4 = 'uni';
k1 = strfind(texto1, ACOES);
k2 = strfind(texto2, ACOES);
k3 = strfind(texto3, ACOES);
k4 = strfind(texto4, ACOES);
if (isempty(k4) || isempty(k4))
    multi = 0.001;
elseif(isempty(k1) || isempty(k2))
    multi = 1;
else
    multi = 1;
end
% -------------------------------------------------------------------------

file.texto.ComposicaoDoCapital = file.texto.ComposicaoDoCapital(2:end,1);
n    = max(size(file.texto.ComposicaoDoCapital));
str2 = 'Total - Do Capital Integralizado';
str3 = 'Total - Em Tesouraria';
for i=1:n
    str1     = file.texto.ComposicaoDoCapital{i,1}; 
    compara  = strcmp(str1, str2);
    compara2 = strcmp(str1, str3);
    if (compara == 1)
        Quant = file.dado.ComposicaoDoCapital(i,1);
    end
% -------------------------------------------------------------------------    
% Inserido 13/03/2016  
    if (compara2 == 1)
        QuantTesouraria = file.dado.ComposicaoDoCapital(i,1);
    end
% -------------------------------------------------------------------------    
end
T1.texto      = {'Número de Ações (Mil)'; 'Total de Ações'; 'Total - Em Tesouraria'};
T1.data       = trimestre;
T1.totalAcoes = Quant*multi;
T1.totalAcoesEmTesouraria = QuantTesouraria;          % Inserido 13/03/2016
% =========================================================================
% Modificação realizada no dia 29/03/2017.
flag = isfield(file.dado,'DFConsAtivo');
if (flag == 1)
    Tabela2Consolidado;
    Tabela3Consolidado;
    Tabela4Consolidado;
    Tabela5Consolidado;
else
    Tabela2Individual;
    Tabela3Individual;
    Tabela4Individual;
    Tabela5Individual;
end


% =========================================================================
N = max(size(CaminhoArquivo));
Contador = 0;
for i=1:N
   if (CaminhoArquivo(i) == '\')
       Contador = Contador + 1;
   end
end
remain = CaminhoArquivo;
for i=1:(Contador)
    [alfa, remain] = strtok(remain,'\');
end
Empresa = alfa;
% -------------------------------------------------------------------------

estrutura = struct('T1', T1, 'T2', T2, 'T3', T3, 'T4', T4, 'T5', T5);
eval(['o' '=estrutura;']);

File = strcat(Empresa, '_');
File = strcat(File, NomeArquivo_Matlab);
File = strcat(File, '.mat');
save(File, 'o');
disp(['Convertendo o arquivo --- ' NomeArquivo_Excel ' --- CONVERTIDO!']);

end