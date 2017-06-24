clear all; close all; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eduardo H. Santos
%
% -------------------------------------------------------------------------
% |         Dia         |          Início         |         Fim           |         
% -------------------------------------------------------------------------
%       09/03/2017                  17:30h
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% -------------------------------------------------------------------------
%
%              NORMATIZA OS DADOS VINDOS DAS TABELA DO EXCEL
% 
% -------------------------------------------------------------------------

% 1.: Pega o diretório de onde o qual estamos carregando o programa. 
raiz    = pwd;

% 2.: Inclusão das Planilhas .xls
[NomeArquivo_Excel, CaminhoArquivo] = uigetfile('*.xls');
rmpath(CaminhoArquivo);
addpath(CaminhoArquivo); 
file     = importdata(NomeArquivo_Excel);
AbaVelho = fieldnames(file.textdata);
[NomeArquivo_Matlab, remain] = strtok(NomeArquivo_Excel,'.');



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
%         file.data = rmfield(file.data,AbaVelho{i});
    end
    
    if (isfield(file.textdata, AbaVelho{i}))
    % 4.2.: Corrige os parâmetros de 'textdata'.
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
%  (*) A parte de interesse aqui diz respeito à tabela intitulada
%     'Composição de Capital' do arquivo baixado do programa Empresa.net

%   a) Salvarei a 'data' do último dia do referido trimestre da tabela
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


%   b) Procura em qual linha está posicionada a variável relativa à
%      quantidade de ações da empresa.
%
% 1.: Elimina a primeira linha de texto, a qual faz referência à 'Número de
%     Ações (Mil' e também ao trimestre em análise.
file.texto.ComposicaoDoCapital = file.texto.ComposicaoDoCapital(2:end,1);
n = max(size(file.texto.ComposicaoDoCapital));
for i=1:n
    str1 = file.texto.ComposicaoDoCapital{i,1};
    str2 = 'Total - Do Capital Integralizado';
    compara = strcmp(str1, str2);
    if (compara == 1)
        % Uma vez encontrada a posição relativa ao total de ações, pega
        % esta variável na tabela de dados. Esta variável precisa ser
        % multiplicada por 1000 (pois a primeira linha informa que tal
        % parâmetros é multiplicado 1000).
        Quant = file.dado.ComposicaoDoCapital(i,1)*1000;
    end
end
T1.texto      = {'Data'; 'Total de Ações'};
T1.data       = trimestre;
T1.totalAcoes = Quant;




% 2.:  SEGUNDA TABELA
%     -----------------
% 
%  (*) A parte de interesse aqui diz respeito à tabela intitulada
%     'DF Ind. - Ativo' do arquivo baixado do programa Empresa.net
T2.texto = {'Ativo Total';
            'Ativo Circulante';
            'Caixa e Equivalentes de Caixa';
            'Aplicações Financeiras';
            'Contas a Receber';
            'Estoques';
            'Ativos Biológicos';
            'Tributos a Recuperar';
            'Despesas Antecipadas';
            'Outros Ativos Circulantes';
            'Ativo Não Circulante';
            'Ativo Realizável a Longo Prazo';
            'Investimentos';
            'Imobilizado';
            'Intangível';
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
    
    if(strcmp(str1, 'Aplicações Financeiras'))
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
    
    if(strcmp(str1, 'Ativos Biológicos'))
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
    
    if(strcmp(str1, 'Ativo Não Circulante'))
        if (strcmp(Numero{i},'1.02'))
            T2.AtivoNaoCirculante = file.dado.DFIndAtivo(i,1)*1000; 
        end
    end
    
    if(strcmp(str1, 'Ativo Realizável a Longo Prazo'))
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
    
    if(strcmp(str1, 'Intangível'))
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
%  (*) A parte de interesse aqui diz respeito à tabela intitulada
%     'DF Ind. - Passivo' do arquivo baixado do programa Empresa.net
T3.texto = {'Passivo Total';
            'Passivo Circulante';
            'Obrigações Sociais e Trabalhistas';
            'Fornecedores';
            'Obrigações Fiscais';
            'Empréstimos e Financiamentos';
            'Outras Obrigações';
            'Provisões';
            'Passivos sobre Ativos Não-Correntes a Venda e Descontinuados';
            'Passivo Não Circulante';
            'Empréstimos e Financiamentos';
            'Outras Obrigações';
            'Tributos Diferidos';
            'Provisões';
            'Passivo sobre Ativos Não-Correntes a Venda e Descontinuados';
            'Lucro e Receitas a Apropriar';
            'Patrimônio Líquido';
            'Capital Social Realizado';
            'Reservas de Capital';
            'Reservas de  Reavalização';
            'Reservas de Lucros';
            'Lucro/Prejuízos Acumulados';
            'Ajustes de Avalização Patrimonial';
            'Ajustes Acumulados de Conversão';
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
    
    if(strcmp(str1, 'Obrigações Sociais e Trabalhistas'))
        if (strcmp(Numero{i},'2.01.01'))
            T3.ObrigacoesSociaisETrabalhistas = file.dado.DFIndPassivo(i,1)*1000;
        end
    end  
    
    if(strcmp(str1, 'Fornecedores'))
        if (strcmp(Numero{i},'2.01.02'))
            T3.Fornecedores = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Obrigações Fiscais'))
        if (strcmp(Numero{i},'2.01.03'))
            T3.ObrigacoesFiscais = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Empréstimos e Financiamentos'))
        if (strcmp(Numero{i},'2.01.04'))
            T3.EmprestimosEFinanciamentos = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Outras Obrigações'))
        if (strcmp(Numero{i},'2.01.05'))
            T3.OutrasObrigacoes = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Provisões'))
        if (strcmp(Numero{i},'2.01.06'))
            T3.Provisoes = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Passivos sobre Ativos Não-Correntes a Venda e Descontinuados'))
        if (strcmp(Numero{i},'2.01.07'))
            T3.PassivoSobreAtivosNaoCorrentesAVendaEDescontinuados = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Passivo Não Circulante'))
        if (strcmp(Numero{i},'2.02'))
            T3.PassivoNaoCirculante = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Empréstimos e Financiamentos'))
        if (strcmp(Numero{i},'2.02.01'))
            T3.EmprestimosEFinanciamentos2 = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Outras Obrigações'))
        if (strcmp(Numero{i},'2.02.02'))
            T3.OutrasObrigacoes2 = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Tributos Diferidos'))
        if (strcmp(Numero{i},'2.02.03'))
            T3.TributosDiferidos = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Provisões'))
        if (strcmp(Numero{i},'2.02.04'))
            T3.Provisoes2 = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Passivos sobre Ativos Não-Correntes a Venda e Descontinuados'))
        if (strcmp(Numero{i},'2.02.05'))
            T3.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados2 = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Lucros e Receitas a Apropriar'))
        if (strcmp(Numero{i},'2.02.06'))
            T3.LucrosEReceitasAApropriar = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Patrimônio Líquido'))
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
    
    if(strcmp(str1, 'Reservas de Reavaliação'))
        if (strcmp(Numero{i},'2.03.03'))
            T3.ReservasDeReavaliacao = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Reservas de Lucros'))
        if (strcmp(Numero{i},'2.03.04'))
            T3.ReservasDeLucros = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Lucros/Prejuízos Acumulados'))
        if (strcmp(Numero{i},'2.03.05'))
            T3.LucrosPrejuizosAcumulados = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Ajustes de Avaliação Patrimonial'))
        if (strcmp(Numero{i},'2.03.06'))
            T3.AjustesDeAvalicaoPatrimonial = file.dado.DFIndPassivo(i,1)*1000;
        end
    end
    
    if(strcmp(str1, 'Ajustes Acumulados de Conversão'))
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
%  (*) A parte de interesse aqui diz respeito à tabela intitulada
%     'DF Ind. - Resultado Periodo' do arquivo baixado do programa 
%     Empresa.net
%  (*) Todos os subfields com o ultimo digito '2' diz respeito ao resultado
%      acumulado até aquele período. Será importante para o levantamento do
%      resultado do último trimestre do período. Mesmo não sendo necessário
%      salvar todos os dados (o que seria interessante apenas para o
%      terceiro trimestre do ano), será salvo aqui todos os dados.
T4.texto = {'Receita de Vendas de Bens e/ou Serviços';
            'Custo dos Bens e/ou Serviços Vendidos';
            'Resultado Bruto';
            'Despesas/Receitas Operacionais';
            'Resultado Antes do Resultado Financeiro e dos Tributos';
            'Resultado Financeiro';
            'Resultado Antes dos Tributos sobre o Lucro';
            'Imposto de Renda e Contribuição Social sobre o Lucro';
            'Resultado Líquido das Operações Continuadas';
            'Resultado Líquido de Operações Descontinuadas';
            'Lucro/Prejuízo do Período';};
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
    
    if(strcmp(str1, 'Receita de Venda de Bens e/ou Serviços'))
        if (strcmp(Numero{i},'3.01'))
            T4.ReceitaDeVendaDeBensEOUServicos  = file.dado.DFIndResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Custo dos Bens e/ou Serviços Vendidos'))
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
    
    if(strcmp(str1, 'Imposto de Renda e Contribuição Social sobre o Lucro'))
        if (strcmp(Numero{i},'3.08'))
            T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro  = ...
                file.dado.DFIndResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Resultado Líquido das Operações Continuadas'))
        if (strcmp(Numero{i},'3.09'))
            T4.ResultadoLiquidoDasOperacoesContinuadas  = file.dado.DFIndResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Resultado Líquido de Operações Descontinuadas'))
        if (strcmp(Numero{i},'3.10'))
            T4.ResultadoLiquidoDeOperacoesDescontinuadas  = file.dado.DFIndResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Lucro/Prejuízo do Período'))
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


