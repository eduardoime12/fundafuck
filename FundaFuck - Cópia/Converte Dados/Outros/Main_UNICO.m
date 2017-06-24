clear all; close all; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eduardo H. Santos
%
% -------------------------------------------------------------------------
% |         Dia         |          In�cio         |         Fim           |         
% -------------------------------------------------------------------------
%       09/03/2017                  17:30h
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% -------------------------------------------------------------------------
%
%              NORMATIZA OS DADOS VINDOS DAS TABELA DO EXCEL
% 
% -------------------------------------------------------------------------

% 1.: Pega o diret�rio de onde o qual estamos carregando o programa. 
raiz    = pwd;

% 2.: Inclus�o das Planilhas .xls
[NomeArquivo_Excel, CaminhoArquivo] = uigetfile('*.xls');
rmpath(CaminhoArquivo);
addpath(CaminhoArquivo); 
file     = importdata(NomeArquivo_Excel);
AbaVelho = fieldnames(file.textdata);
[NomeArquivo_Matlab, remain] = strtok(NomeArquivo_Excel,'.');



% 3.: As abas do Excel carregadas pela fun��o 'uigetfile' inserem caracteres
%     que n�o s�o v�lidos no ambiente Matlab. No caso, eles s�o carregados
%     como hexadecimal. De forma a corrigir estes nomes de forma a ter menos
%     trabalho de identifica��o de qual arquivo estamos trabalhando, ser�o,
%     num primeiro momento, corrigido quaisquer problemas de migra��o de
%     dados. No caso, ser�o inseridos os dados sem cedinha ou acentos.
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
    % 4.1.: Corrige os par�metros de 'data'.
    if (isfield(file.data, AbaVelho{i}))
        [file.data.(AbaNovo{i})] = file.data.(AbaVelho{i});
%         file.data = rmfield(file.data,AbaVelho{i});
    end
    
    if (isfield(file.textdata, AbaVelho{i}))
    % 4.2.: Corrige os par�metros de 'textdata'.
        [file.textdata.(AbaNovo{i})] = file.textdata.(AbaVelho{i});
%         file.textdata = rmfield(file.textdata,AbaVelho{i});
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
%  (*) A parte de interesse aqui diz respeito � tabela intitulada
%     'Composi��o de Capital' do arquivo baixado do programa Empresa.net

%   a) Salvarei a 'data' do �ltimo dia do referido trimestre da tabela
%      importada.
trimestre = file.texto.ComposicaoDoCapital{1,2};
trimestre = strsplit(trimestre);
trimestre = trimestre{end};

% -------------------------------------------------------------------------
% Inserido dia 16/03/2017
ACOES  = file.texto.ComposicaoDoCapital(1,1);
ACOES  = char(ACOES)
texto1 = 'Uni'
texto2 = 'uni'
k1 = strfind(texto1, ACOES)
k2 = strfind(texto2, ACOES)
if (isempty(k1) || isempty(k2))
    multi = 1000;
else
    multi = 1;
end
% -------------------------------------------------------------------------


%   b) Procura em qual linha est� posicionada a vari�vel relativa �
%      quantidade de a��es da empresa.
%
% 1.: Elimina a primeira linha de texto, a qual faz refer�ncia � 'N�mero de
%     A��es (Mil' e tamb�m ao trimestre em an�lise.
file.texto.ComposicaoDoCapital = file.texto.ComposicaoDoCapital(2:end,1);
n = max(size(file.texto.ComposicaoDoCapital));
for i=1:n
    str1 = file.texto.ComposicaoDoCapital{i,1};
    str2 = 'Total - Do Capital Integralizado';
    compara = strcmp(str1, str2);
    if (compara == 1)
        % Uma vez encontrada a posi��o relativa ao total de a��es, pega
        % esta vari�vel na tabela de dados. Esta vari�vel precisa ser
        % multiplicada por 1000 (pois a primeira linha informa que tal
        % par�metros � multiplicado 1000).
        Quant = file.dado.ComposicaoDoCapital(i,1)*1000;
    end
end
T1.texto      = {'Data'; 'Total de A��es'};
T1.data       = trimestre;
T1.totalAcoes = Quant;




% 2.:  SEGUNDA TABELA
%     -----------------
% 
%  (*) A parte de interesse aqui diz respeito � tabela intitulada
%     'DF Ind. - Ativo' do arquivo baixado do programa Empresa.net
T2.texto = {'Ativo Total';
            'Ativo Circulante';
            'Caixa e Equivalentes de Caixa';
            'Aplica��es Financeiras';
            'Contas a Receber';
            'Estoques';
            'Ativos Biol�gicos';
            'Tributos a Recuperar';
            'Despesas Antecipadas';
            'Outros Ativos Circulantes';
            'Ativo N�o Circulante';
            'Ativo Realiz�vel a Longo Prazo';
            'Investimentos';
            'Imobilizado';
            'Intang�vel';
            'Diferido'};
        
T2.numero = {'1';
             '1.01';
             '1.01.01';
             '1.01.02';
             '1.01.03';
             '1.01.04';
             '1.01.05';
             '1.01.06';
             '1.01.07';
             '1.01.08';
             '1.02';
             '1.02.01';
             '1.02.02';
             '1.02.03';
             '1.02.04';
             '1.02.05';} 


Numero = file.texto.DFIndAtivo(3:end,1);
Texto  = file.texto.DFIndAtivo(3:end,2);
n = max(size(Texto));

for i=1:n
    str1 = Texto{i};
    
    if(strcmp(str1, 'Ativo Total'))
        if (strcmp(Numero{i},'1'))
            T2.AtivoTotal = file.dado.DFIndAtivo(i,1)*1000;
        end
    end    

    
    if(strcmp(str1, 'Ativo Circulante'))
        if (strcmp(Numero{i},'1.01'))
            T2.AtivoCirculante = file.dado.DFIndAtivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Caixa e Equivalentes de Caixa'))
        if (strcmp(Numero{i},'1.01.01'))
            T2.CaixaEEquivalenteDeCaixa = file.dado.DFIndAtivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Aplica��es Financeiras'))
        if (strcmp(Numero{i},'1.01.02'))
            T2.AplicacoesFinanceiras = file.dado.DFIndAtivo(i,1)*1000; 
        end
    end
    
    if(strcmp(str1, 'Contas a Receber'))
        if (strcmp(Numero{i},'1.01.03'))
            T2.ContasAReceber = file.dado.DFIndAtivo(i,1)*1000; 
        end
    end
    
    if(strcmp(str1, 'Estoques'))
        if (strcmp(Numero{i},'1.01.04'))
            T2.Estoques = file.dado.DFIndAtivo(i,1)*1000; 
        end
    end
    
    if(strcmp(str1, 'Ativos Biol�gicos'))
        if (strcmp(Numero{i},'1.01.05'))
            T2.AtivosBiologicos = file.dado.DFIndAtivo(i,1)*1000;  
        end
    end
    
    if(strcmp(str1, 'Tributos a Recuperar'))
        if (strcmp(Numero{i},'1.01.06'))
            T2.TributosARecuperar = file.dado.DFIndAtivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Despesas Antecipadas'))
        if (strcmp(Numero{i},'1.01.07'))
            T2.DespesasAntecipadas = file.dado.DFIndAtivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Outros Ativos Circulantes'))
        if (strcmp(Numero{i},'1.01.08'))
            T2.OutrosAtivosCirculantes = file.dado.DFIndAtivo(i,1)*1000; 
        end
    end
    
    if(strcmp(str1, 'Ativo N�o Circulante'))
        if (strcmp(Numero{i},'1.02'))
            T2.AtivoNaoCirculante = file.dado.DFIndAtivo(i,1)*1000; 
        end
    end
    
    if(strcmp(str1, 'Ativo Realiz�vel a Longo Prazo'))
        if (strcmp(Numero{i},'1.02.01'))
            T2.AtivoRealizavelALongoPrazo = file.dado.DFIndAtivo(i,1)*1000;  
        end
    end
    
    if(strcmp(str1, 'Investimentos'))
        if (strcmp(Numero{i},'1.02.02'))
            T2.Investimentos = file.dado.DFIndAtivo(i,1)*1000;     
        end
    end
    
    if(strcmp(str1, 'Imobilizado'))
        if (strcmp(Numero{i},'1.02.03'))
            T2.Imobilizado = file.dado.DFIndAtivo(i,1)*1000;  
        end
    end
    
    if(strcmp(str1, 'Intang�vel'))
        if (strcmp(Numero{i},'1.02.04'))
            T2.Intangivel = file.dado.DFIndAtivo(i,1)*1000; 
        end
    end
    
    if(strcmp(str1, 'Diferido'))
        if (strcmp(Numero{i},'1.02.05'))
            T2.Diferido  = file.dado.DFIndAtivo(i,1)*1000;  
        end
    end
end






% 3.:  TERCEIRA TABELA
%     -----------------
% 
%  (*) A parte de interesse aqui diz respeito � tabela intitulada
%     'DF Ind. - Passivo' do arquivo baixado do programa Empresa.net
T3.texto = {'Passivo Total';
            'Passivo Circulante';
            'Obriga��es Sociais e Trabalhistas';
            'Fornecedores';
            'Obriga��es Fiscais';
            'Empr�stimos e Financiamentos';
            'Outras Obriga��es';
            'Provis�es';
            'Passivos sobre Ativos N�o-Correntes a Venda e Descontinuados';
            'Passivo N�o Circulante';
            'Empr�stimos e Financiamentos';
            'Outras Obriga��es';
            'Tributos Diferidos';
            'Provis�es';
            'Passivo sobre Ativos N�o-Correntes a Venda e Descontinuados';
            'Lucro e Receitas a Apropriar';
            'Patrim�nio L�quido';
            'Capital Social Realizado';
            'Reservas de Capital';
            'Reservas de  Reavaliza��o';
            'Reservas de Lucros';
            'Lucro/Preju�zos Acumulados';
            'Ajustes de Avaliza��o Patrimonial';
            'Ajustes Acumulados de Convers�o';
            'Outros Resultados Abrangentes';};
T3.numero = {'2';
             '2.01';
             '2.01.01';
             '2.01.02';
             '2.01.03';
             '2.01.04';
             '2.01.05';
             '2.01.06';
             '2.01.07';
             '2.02';
             '2.02.01';
             '2.02.02';
             '2.02.03';
             '2.02.04';
             '2.02.05';
             '2.02.06';
             '2.03';
             '2.03.01';
             '2.03.02';
             '2.03.03';
             '2.03.04';
             '2.03.05';
             '2.03.06';
             '2.03.07';
             '2.03.08';}

Numero = file.texto.DFIndPassivo(3:end,1);
Texto  = file.texto.DFIndPassivo(3:end,2);
n = max(size(Texto));

for i=1:n
    str1 = Texto{i};
    
    if(strcmp(str1, 'Passivo Total'))
        if (strcmp(Numero{i},'2'))
            T3.PassivoTotal = file.dado.DFIndPassivo(i,1)*1000;
        end
    end 
    
    if(strcmp(str1, 'Passivo Circulante'))
        if (strcmp(Numero{i},'2.01'))
            T3.PassivoCirculante = file.dado.DFIndPassivo(i,1)*1000;
        end
    end 
    
    if(strcmp(str1, 'Obriga��es Sociais e Trabalhistas'))
        if (strcmp(Numero{i},'2.01.01'))
            T3.ObrigacoesSociaisETrabalhistas = file.dado.DFIndPassivo(i,1)*1000;
        end
    end  
    
    if(strcmp(str1, 'Fornecedores'))
        if (strcmp(Numero{i},'2.01.02'))
            T3.Fornecedores = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Obriga��es Fiscais'))
        if (strcmp(Numero{i},'2.01.03'))
            T3.ObrigacoesFiscais = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Empr�stimos e Financiamentos'))
        if (strcmp(Numero{i},'2.01.04'))
            T3.EmprestimosEFinanciamentos = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Outras Obriga��es'))
        if (strcmp(Numero{i},'2.01.05'))
            T3.OutrasObrigacoes = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Provis�es'))
        if (strcmp(Numero{i},'2.01.06'))
            T3.Provisoes = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Passivos sobre Ativos N�o-Correntes a Venda e Descontinuados'))
        if (strcmp(Numero{i},'2.01.07'))
            T3.PassivoSobreAtivosNaoCorrentesAVendaEDescontinuados = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Passivo N�o Circulante'))
        if (strcmp(Numero{i},'2.02'))
            T3.PassivoNaoCirculante = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Empr�stimos e Financiamentos'))
        if (strcmp(Numero{i},'2.02.01'))
            T3.EmprestimosEFinanciamentos2 = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Outras Obriga��es'))
        if (strcmp(Numero{i},'2.02.02'))
            T3.OutrasObrigacoes2 = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Tributos Diferidos'))
        if (strcmp(Numero{i},'2.02.03'))
            T3.TributosDiferidos = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Provis�es'))
        if (strcmp(Numero{i},'2.02.04'))
            T3.Provisoes2 = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Passivos sobre Ativos N�o-Correntes a Venda e Descontinuados'))
        if (strcmp(Numero{i},'2.02.05'))
            T3.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados2 = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Lucros e Receitas a Apropriar'))
        if (strcmp(Numero{i},'2.02.06'))
            T3.LucrosEReceitasAApropriar = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Patrim�nio L�quido'))
        if (strcmp(Numero{i},'2.03'))
            T3.PatrimonioLiquido = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Capital Social Realizado'))
        if (strcmp(Numero{i},'2.03.01'))
            T3.CapitalSocialRealizado = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Reservas de Capital'))
        if (strcmp(Numero{i},'2.03.02'))
            T3.ReservaDeCapital = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Reservas de Reavalia��o'))
        if (strcmp(Numero{i},'2.03.03'))
            T3.ReservasDeReavaliacao = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Reservas de Lucros'))
        if (strcmp(Numero{i},'2.03.04'))
            T3.ReservasDeLucros = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Lucros/Preju�zos Acumulados'))
        if (strcmp(Numero{i},'2.03.05'))
            T3.LucrosPrejuizosAcumulados = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Ajustes de Avalia��o Patrimonial'))
        if (strcmp(Numero{i},'2.03.06'))
            T3.AjustesDeAvalicaoPatrimonial = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Ajustes Acumulados de Convers�o'))
        if (strcmp(Numero{i},'2.03.07'))
            T3.AjustesAcumuladosDeConversao = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Outros Resultados Abrangentes'))
        if (strcmp(Numero{i},'2.03.08'))
            T3.OutrosResultadosAbrangentes = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
end




% 4.:  QUARTA TABELA
%     ---------------
% 
%  (*) A parte de interesse aqui diz respeito � tabela intitulada
%     'DF Ind. - Resultado Periodo' do arquivo baixado do programa 
%     Empresa.net
%  (*) Todos os subfields com o ultimo digito '2' diz respeito ao resultado
%      acumulado at� aquele per�odo. Ser� importante para o levantamento do
%      resultado do �ltimo trimestre do per�odo. Mesmo n�o sendo necess�rio
%      salvar todos os dados (o que seria interessante apenas para o
%      terceiro trimestre do ano), ser� salvo aqui todos os dados.
T4.texto = {'Receita de Vendas de Bens e/ou Servi�os';
            'Custo dos Bens e/ou Servi�os Vendidos';
            'Resultado Bruto';
            'Despesas/Receitas Operacionais';
            'Resultado Antes do Resultado Financeiro e dos Tributos';
            'Resultado Financeiro';
            'Resultado Antes dos Tributos sobre o Lucro';
            'Imposto de Renda e Contribui��o Social sobre o Lucro';
            'Resultado L�quido das Opera��es Continuadas';
            'Resultado L�quido de Opera��es Descontinuadas';
            'Lucro/Preju�zo do Per�odo';};
T4.numero = {'3.01';
             '3.02';
             '3.03';
             '3.04';
             '3.05';
             '3.06';
             '3.07';
             '3.08';
             '3.09';
             '3.10';
             '3.11';}


Numero = file.texto.DFIndResultadoPeriodo(3:end,1);
Texto  = file.texto.DFIndResultadoPeriodo(3:end,2);
n = max(size(Texto));

for i=1:n
    str1 = Texto{i};
    
    if(strcmp(str1, 'Receita de Venda de Bens e/ou Servi�os'))
        if (strcmp(Numero{i},'3.01'))
            T4.ReceitaDeVendaDeBensEOUServicos  = file.dado.DFIndResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Custo dos Bens e/ou Servi�os Vendidos'))
        if (strcmp(Numero{i},'3.02'))
            T4.CustoDosBensEOUServicosVendidos  = file.dado.DFIndResultadoPeriodo(i,1);
        end
    end 

    if(strcmp(str1, 'Resultado Bruto'))
        if (strcmp(Numero{i},'3.03'))
            T4.ResultadoBruto  = file.dado.DFIndResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Despesas/Receitas Operacionais'))
        if (strcmp(Numero{i},'3.04'))
            T4.DespesasReceitasOperacionais  = file.dado.DFIndResultadoPeriodo(i,1);
        end
    end 
    
    if(strcmp(str1, 'Resultado Antes do Resultado Financeiro e dos Tributos'))
        if (strcmp(Numero{i},'3.05'))
            T4.ResultadoAntesDoResultadoFinanceiroEDosTributos = ...
                file.dado.DFIndResultadoPeriodo(i,1);            
        end
    end
    
    if(strcmp(str1, 'Resultado Financeiro'))
        if (strcmp(Numero{i},'3.06'))
            T4.ResultadoFinanceiro  = file.dado.DFIndResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Resultado Antes dos Tributos sobre o Lucro'))
        if (strcmp(Numero{i},'3.07'))
            T4.ResultadoAntesDosTributosSobreOLucro  = file.dado.DFIndResultadoPeriodo(i,1);
        end
    end 
    
    if(strcmp(str1, 'Imposto de Renda e Contribui��o Social sobre o Lucro'))
        if (strcmp(Numero{i},'3.08'))
            T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro  = ...
                file.dado.DFIndResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Resultado L�quido das Opera��es Continuadas'))
        if (strcmp(Numero{i},'3.09'))
            T4.ResultadoLiquidoDasOperacoesContinuadas  = file.dado.DFIndResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Resultado L�quido de Opera��es Descontinuadas'))
        if (strcmp(Numero{i},'3.10'))
            T4.ResultadoLiquidoDeOperacoesDescontinuadas  = file.dado.DFIndResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Lucro/Preju�zo do Per�odo'))
        if (strcmp(Numero{i},'3.11'))
            T4.LucroPrejuizoDoPeriodo  = file.dado.DFIndResultadoPeriodo(i,1);
        end
        
% % -------------------------------------------------------------------------        
% % Inserido dia 14/03/2016
%         if (strcmp(Numero{i+1}, '3.11.01')
%             T4.AtribuidoASociosDaEmpresaControladora  = file.dado.DFIndResultadoPeriodo(i+1,1);
%             T4.AtribuidoASociosNaoControladora        = file.dado.DFIndResultadoPeriodo(i+2,1);
%         else
%             T4.AtribuidoASociosDaEmpresaControladora  = file.dado.DFIndResultadoPeriodo(i,1);
%             T4.AtribuidoASociosNaoControladora        = 0;
%         end
% % -------------------------------------------------------------------------        
    end
end



% -------------------------------------------------------------------------
N = max(size(CaminhoArquivo));
Contador = 0;
for i=1:N
   if (CaminhoArquivo(i) == '\')
       Contador = Contador + 1;
   end
end
remain = CaminhoArquivo;
for i=1:(Contador-1)
    [alfa, remain] = strtok(remain,'\')
end
Empresa = alfa;
% -------------------------------------------------------------------------

estrutura = struct('T1', T1, 'T2', T2, 'T3', T3, 'T4', T4);
eval(['o' '=estrutura;']);

File = strcat(Empresa, '_');
File = strcat(File, NomeArquivo_Matlab);
File = strcat(File, '.mat');
save(File, 'o');
clc;


