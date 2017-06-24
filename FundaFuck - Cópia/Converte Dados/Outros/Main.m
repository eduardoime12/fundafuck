clear all; close all; clc

% -------------------------------------------------------------------------
% 1.: Seleciona todos os arquivos '.xls' os quais eu gostaria de ler para
%     uma determinada empresa.
raiz    = pwd;
subRaiz = {'Funções'};

nMax = max(size(subRaiz));
for i = 1:nMax
    rmpath([raiz '\' subRaiz{i,:}]);
    addpath([raiz '\' subRaiz{i,:}]); 
end

Jota = 'Selecione os arquivos .xls references aos balanços trimestrais da empresa obtidos do programa Empresa.net';
[NomeArquivo_Excel, CaminhoArquivo, ~] = uigetfile(fullfile(raiz, '*.xls'), 'MultiSelect', 'on', Jota);
rmpath([CaminhoArquivo]);
addpath([CaminhoArquivo]); 


% -------------------------------------------------------------------------
% 2.: Ler os referidos arquivos e gera o seu respectivo arquivo '.mat'.
NomeArquivo_Excel = cellstr(NomeArquivo_Excel);
n = max(size(NomeArquivo_Excel));
theta  = waitbar(0, sprintf('Gerando os balanços trimestrais...', n));
if (n == 1)
    Empresa{1} = importdata(NomeArquivo_Excel{1});
    Arquivo{1} = fnExcel2Matlab(Empresa{1}, NomeArquivo_Excel{1}, CaminhoArquivo);
    waitbar(1); 
else
    for i=1:n
        Empresa{i} = importdata(NomeArquivo_Excel{i});
        Arquivo{i} = fnExcel2Matlab(Empresa{i}, NomeArquivo_Excel{i}, CaminhoArquivo);
        waitbar(i/n); 
    end
end
close(theta);


% -------------------------------------------------------------------------
% 3.: Carrega os arquivos '*.mat' recém criados com os balanços
%     trimestrais.
TRI = cellstr(Arquivo);
n       = max(size(TRI));
if (n == 1)
    TRI{1} = load(TRI{1});
else
    for i=1:n
        TRI{i} = load(TRI{i});
    end
end


% -------------------------------------------------------------------------
% 4.: Faz o ajuste de Datas.
%
% a).: Ordenas as datas em ordem DECRESCENTE.
DATAS = [];
for i=1:n
   Data(i,:)    = TRI{i}.o.T1.data;
   DataYYYYMMDD = fnYYYYMMDD(Data(i,:));
   DATAS = [DATAS; DataYYYYMMDD];
end
DOrdenada = fnOrdenaDatas(DATAS);     % Datas ordenadas (no formato bruto)
DOrdenada = fnYYYYMMDD2String(DOrdenada);


% -------------------------------------------------------------------------
% 5.: Monta um arquivo '*.mat' com o balanço da empresa recém analisada
CampoTabela1 = fields(TRI{1}.o.T1);
CampoTabela2 = fields(TRI{1}.o.T2);
CampoTabela3 = fields(TRI{1}.o.T3);
CampoTabela4 = fields(TRI{1}.o.T4);
n = max(size(TRI));

theta  = waitbar(0, sprintf('Condensando os balanços trimestrais da empresa...', n));
%  Pré-Load
% ----------
% Tabela 1
T1.(CampoTabela1{1}) = TRI{1}.o.T1.texto;

% Tabela 2
T2.(CampoTabela2{1}) = TRI{1}.o.T2.texto;
T2.(CampoTabela2{2}) = TRI{1}.o.T2.numero;


% Tabela 3
T3.(CampoTabela3{1}) = TRI{1}.o.T3.texto;
T3.(CampoTabela3{2}) = TRI{1}.o.T3.numero;

% Tabela 4
T4.(CampoTabela4{1}) = TRI{1}.o.T4.texto;
T4.(CampoTabela4{2}) = TRI{1}.o.T4.numero;
for i=1:n
    str1 = DOrdenada(i,:);
    for j=1:n
       if(strcmp(str1, TRI{j}.o.T1.data))
           %  Tabela 1
           % ----------
           % O campo 1 está reservado para 'texto'.
           T1.(CampoTabela1{2})(i,:) = TRI{j}.o.T1.data;
           T1.(CampoTabela1{3})(1,j) = TRI{j}.o.T1.totalAcoes;
           
           waitbar(1/10); 
           
           % Tabela 2
           % ----------
           % O campo 1 está reservado para 'texto'.
           % O campo 2 está reservado para 'numero'.
           T2.(CampoTabela2{3})(1,j) = TRI{j}.o.T2.AtivoTotal;
           T2.(CampoTabela2{4})(1,j) = TRI{j}.o.T2.AtivoCirculante;
           T2.(CampoTabela2{5})(1,j) = TRI{j}.o.T2.CaixaEEquivalenteDeCaixa;
           T2.(CampoTabela2{6})(1,j) = TRI{j}.o.T2.AplicacoesFinanceiras;
           T2.(CampoTabela2{7})(1,j) = TRI{j}.o.T2.ContasAReceber;
           T2.(CampoTabela2{8})(1,j) = TRI{j}.o.T2.Estoques;
           T2.(CampoTabela2{9})(1,j) = TRI{j}.o.T2.AtivosBiologicos;
           T2.(CampoTabela2{10})(1,j) = TRI{j}.o.T2.TributosARecuperar;
           T2.(CampoTabela2{11})(1,j) = TRI{j}.o.T2.DespesasAntecipadas;
           T2.(CampoTabela2{12})(1,j) = TRI{j}.o.T2.OutrosAtivosCirculantes;
           T2.(CampoTabela2{13})(1,j) = TRI{j}.o.T2.AtivoNaoCirculante;
           T2.(CampoTabela2{14})(1,j) = TRI{j}.o.T2.AtivoRealizavelALongoPrazo;
           T2.(CampoTabela2{15})(1,j) = TRI{j}.o.T2.Investimentos;
           T2.(CampoTabela2{16})(1,j) = TRI{j}.o.T2.Imobilizado;
           T2.(CampoTabela2{17})(1,j) = TRI{j}.o.T2.Intangivel;
           T2.(CampoTabela2{18})(1,j) = TRI{j}.o.T2.Diferido;
           waitbar(3/10);
           
           % Tabela 3
           % ----------
           % O campo 1 está reservado para 'texto'.
           % O campo 2 está reservado para 'numero'.
           T3.(CampoTabela3{3})(1,j) = TRI{j}.o.T3.PassivoTotal;
           T3.(CampoTabela3{4})(1,j) = TRI{j}.o.T3.PassivoCirculante;
           T3.(CampoTabela3{5})(1,j) = TRI{j}.o.T3.ObrigacoesSociaisETrabalhistas;
           T3.(CampoTabela3{6})(1,j) = TRI{j}.o.T3.Fornecedores;
           T3.(CampoTabela3{7})(1,j) = TRI{j}.o.T3.ObrigacoesFiscais;
           T3.(CampoTabela3{8})(1,j) = TRI{j}.o.T3.EmprestimosEFinanciamentos;
           T3.(CampoTabela3{9})(1,j) = TRI{j}.o.T3.OutrasObrigacoes;
           T3.(CampoTabela3{10})(1,j) = TRI{j}.o.T3.Provisoes;
           T3.(CampoTabela3{11})(1,j) = TRI{j}.o.T3.PassivoSobreAtivosNaoCorrentesAVendaEDescontinuados;
           T3.(CampoTabela3{12})(1,j) = TRI{j}.o.T3.PassivoNaoCirculante;
           T3.(CampoTabela3{13})(1,j) = TRI{j}.o.T3.EmprestimosEFinanciamentos2;
           T3.(CampoTabela3{14})(1,j) = TRI{j}.o.T3.OutrasObrigacoes2;
           T3.(CampoTabela3{15})(1,j) = TRI{j}.o.T3.TributosDiferidos;
           T3.(CampoTabela3{16})(1,j) = TRI{j}.o.T3.Provisoes2;
           T3.(CampoTabela3{17})(1,j) = TRI{j}.o.T3.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados2;
           T3.(CampoTabela3{18})(1,j) = TRI{j}.o.T3.LucrosEReceitasAApropriar;
           T3.(CampoTabela3{19})(1,j) = TRI{j}.o.T3.PatrimonioLiquido;
           T3.(CampoTabela3{20})(1,j) = TRI{j}.o.T3.CapitalSocialRealizado;
           T3.(CampoTabela3{21})(1,j) = TRI{j}.o.T3.ReservaDeCapital;
           T3.(CampoTabela3{22})(1,j) = TRI{j}.o.T3.ReservasDeReavaliacao;
           T3.(CampoTabela3{23})(1,j) = TRI{j}.o.T3.ReservasDeLucros;
           T3.(CampoTabela3{24})(1,j) = TRI{j}.o.T3.LucrosPrejuizosAcumulados;
           T3.(CampoTabela3{25})(1,j) = TRI{j}.o.T3.AjustesDeAvalicaoPatrimonial;
           T3.(CampoTabela3{26})(1,j) = TRI{j}.o.T3.AjustesAcumuladosDeConversao;
           T3.(CampoTabela3{27})(1,j) = TRI{j}.o.T3.OutrosResultadosAbrangentes;     
           waitbar(7/10);
           
           % Tabela 4
           % ----------
           % O campo 1 está reservado para 'texto'.
           % O campo 2 está reservado para 'numero'.
           T4.(CampoTabela4{3})(1,j) = TRI{j}.o.T4.ReceitaDeVendaDeBensEOUServicos;
           T4.(CampoTabela4{4})(1,j) = TRI{j}.o.T4.CustoDosBensEOUServicosVendidos;
           T4.(CampoTabela4{5})(1,j) = TRI{j}.o.T4.ResultadoBruto;
           T4.(CampoTabela4{6})(1,j) = TRI{j}.o.T4.DespesasReceitasOperacionais;
           T4.(CampoTabela4{7})(1,j) = TRI{j}.o.T4.ResultadoAntesDoResultadoFinanceiroEDosTributos;
           T4.(CampoTabela4{8})(1,j) = TRI{j}.o.T4.ResultadoFinanceiro;
           T4.(CampoTabela4{9})(1,j) = TRI{j}.o.T4.ResultadoAntesDosTributosSobreOLucro;
           T4.(CampoTabela4{10})(1,j) = TRI{j}.o.T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro;
           T4.(CampoTabela4{11})(1,j) = TRI{j}.o.T4.ResultadoLiquidoDasOperacoesContinuadas;
           T4.(CampoTabela4{12})(1,j) = TRI{j}.o.T4.ResultadoLiquidoDeOperacoesDescontinuadas;
           T4.(CampoTabela4{13})(1,j) = TRI{j}.o.T4.LucroPrejuizoDoPeriodo;
           waitbar(9/10);
       end
    end
end


% Flipa para a Tabela 1.
T1.totalAcoes = fliplr(T1.totalAcoes);

% Flipa para a Tabela 2.
T2.AtivoTotal                 = fliplr(T2.AtivoTotal);
T2.AtivoCirculante            = fliplr(T2.AtivoCirculante);
T2.CaixaEEquivalenteDeCaixa   = fliplr(T2.CaixaEEquivalenteDeCaixa);
T2.AplicacoesFinanceiras      = fliplr(T2.AplicacoesFinanceiras);
T2.ContasAReceber             = fliplr(T2.ContasAReceber);
T2.Estoques                   = fliplr(T2.Estoques);
T2.AtivosBiologicos           = fliplr(T2.AtivosBiologicos);
T2.TributosARecuperar         = fliplr(T2.TributosARecuperar);
T2.DespesasAntecipadas        = fliplr(T2.DespesasAntecipadas);
T2.OutrosAtivosCirculantes    = fliplr(T2.OutrosAtivosCirculantes);
T2.AtivoNaoCirculante         = fliplr(T2.AtivoNaoCirculante);
T2.AtivoRealizavelALongoPrazo = fliplr(T2.AtivoRealizavelALongoPrazo);
T2.Investimentos              = fliplr(T2.Investimentos);
T2.Imobilizado                = fliplr(T2.Imobilizado);
T2.Intangivel                 = fliplr(T2.Intangivel);
T2.Diferido                   = fliplr(T2.Diferido);


% Flipa para a Tabela 3.
T3.PassivoTotal                                          = fliplr(T3.PassivoTotal);
T3.PassivoCirculante                                     = fliplr(T3.PassivoCirculante);
T3.ObrigacoesSociaisETrabalhistas                        = fliplr(T3.ObrigacoesSociaisETrabalhistas);
T3.Fornecedores                                          = fliplr(T3.Fornecedores);
T3.ObrigacoesFiscais                                     = fliplr(T3.ObrigacoesFiscais);
T3.EmprestimosEFinanciamentos                            = fliplr(T3.EmprestimosEFinanciamentos);
T3.OutrasObrigacoes                                      = fliplr(T3.OutrasObrigacoes);
T3.Provisoes                                             = fliplr(T3.Provisoes);
T3.PassivoSobreAtivosNaoCorrentesAVendaEDescontinuados   = fliplr(T3.PassivoSobreAtivosNaoCorrentesAVendaEDescontinuados);
T3.PassivoNaoCirculante                                  = fliplr(T3.PassivoNaoCirculante);
T3.EmprestimosEFinanciamentos2                           = fliplr(T3.EmprestimosEFinanciamentos2);
T3.OutrasObrigacoes2                                     = fliplr(T3.OutrasObrigacoes2);
T3.TributosDiferidos                                     = fliplr(T3.TributosDiferidos);
T3.Provisoes2                                            = fliplr(T3.Provisoes2);
T3.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados2 = fliplr(T3.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados2);
T3.LucrosEReceitasAApropriar                             = fliplr(T3.LucrosEReceitasAApropriar);
T3.PatrimonioLiquido                                     = fliplr(T3.PatrimonioLiquido);
T3.CapitalSocialRealizado                                = fliplr(T3.CapitalSocialRealizado);
T3.ReservaDeCapital                                      = fliplr(T3.ReservaDeCapital);
T3.ReservasDeReavaliacao                                 = fliplr(T3.ReservasDeReavaliacao);
T3.ReservasDeLucros                                      = fliplr(T3.ReservasDeLucros);
T3.LucrosPrejuizosAcumulados                             = fliplr(T3.LucrosPrejuizosAcumulados);
T3.AjustesDeAvalicaoPatrimonial                          = fliplr(T3.AjustesDeAvalicaoPatrimonial);
T3.AjustesAcumuladosDeConversao                          = fliplr(T3.AjustesAcumuladosDeConversao);
T3.OutrosResultadosAbrangentes                           = fliplr(T3.OutrosResultadosAbrangentes);
waitbar(10/10);

% Flipa para a Tabela 4.
T4.ReceitaDeVendaDeBensEOUServicos                  = fliplr(T4.ReceitaDeVendaDeBensEOUServicos);
T4.CustoDosBensEOUServicosVendidos                  = fliplr(T4.CustoDosBensEOUServicosVendidos);
T4.ResultadoBruto                                   = fliplr(T4.ResultadoBruto);
T4.DespesasReceitasOperacionais                     = fliplr(T4.DespesasReceitasOperacionais);
T4.ResultadoAntesDoResultadoFinanceiroEDosTributos  = fliplr(T4.ResultadoAntesDoResultadoFinanceiroEDosTributos);
T4.ResultadoFinanceiro                              = fliplr(T4.ResultadoFinanceiro);
T4.ResultadoAntesDosTributosSobreOLucro             = fliplr(T4.ResultadoAntesDosTributosSobreOLucro);
T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro     = fliplr(T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro);
T4.ResultadoLiquidoDasOperacoesContinuadas          = fliplr(T4.ResultadoLiquidoDasOperacoesContinuadas);
T4.ResultadoLiquidoDeOperacoesDescontinuadas        = fliplr(T4.ResultadoLiquidoDeOperacoesDescontinuadas);
T4.LucroPrejuizoDoPeriodo                           = fliplr(T4.LucroPrejuizoDoPeriodo);
close(theta);

o = struct('T1', T1, 'T2', T2, 'T3', T3, 'T4', T4);
% -------------------------------------------------------------------------
% (*) Ajuste para o 4º Trimestre
data  = o.T1.data;
quant = size(data,1);
for i=1:quant
   D       = fnYYYYMMDD(data(i,:));
   ano{i}  = D(1:4);
   mes{i}  = D(5:6);
   dia{i}  = D(7:end);
end
for i=1:quant
    % Verifica se tem balanço do 4º trimestre
    if(mes{i} == '12')
        % Se tiver, vamos verificar se há 3 trimestres do respectivo ano
        % ainda com os balanços.
        anoTrabalhado = ano{i}
        % Os três trimestres subsequentes estão no mesmo ano?
        cont = 0;
        for j=(i+1):(i+3)
           if(ano{j} == anoTrabalhado)
               cont = cont+1
           end
        end
        
        % Se existem três balanços seguidos, relativo aos três primeiros
        % semestres do ano, o que a gente irá fazer é pegar o valor do 4
        % trimestre e subtrair o valor dos primeiros três. 
        index = i;
        if (cont == 3)
            Um     = 0;
            Dois   = 0;
            Tres   = 0;
            Quatro = 0;
            Cinco  = 0;
            Seis   = 0;
            Sete   = 0;
            Oito   = 0;
            Nove   = 0;
            Dez    = 0;
            Onze   = 0;
            for k=(i+1):(i+3)
                Um     = Um + o.T4.ReceitaDeVendaDeBensEOUServicos(k);  
                Dois   = Dois + o.T4.CustoDosBensEOUServicosVendidos(k);
                Tres   = Tres + o.T4.ResultadoBruto(k);
                Quatro = Quatro + o.T4.DespesasReceitasOperacionais(k);
                Cinco  = Cinco +  o.T4.ResultadoAntesDoResultadoFinanceiroEDosTributos(k);
                Seis   = Seis + o.T4.ResultadoFinanceiro(k);
                Sete   = Sete + o.T4.ResultadoAntesDosTributosSobreOLucro(k);
                Oito   = Oito + o.T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro(k);
                Nove   = Nove + o.T4.ResultadoLiquidoDasOperacoesContinuadas(k);
                Dez    = Dez + o.T4.ResultadoLiquidoDeOperacoesDescontinuadas(k);
                Onze   = Onze + o.T4.LucroPrejuizoDoPeriodo(k);
            end
            o.T4.ReceitaDeVendaDeBensEOUServicos(index) = o.T4.ReceitaDeVendaDeBensEOUServicos(index) - Um;                
            o.T4.CustoDosBensEOUServicosVendidos(index) = o.T4.CustoDosBensEOUServicosVendidos(index) - Dois;                 
            o.T4.ResultadoBruto(index)                  = o.T4.ResultadoBruto(index) - Tres;                                  
            o.T4.DespesasReceitasOperacionais(index)    = o.T4.DespesasReceitasOperacionais(index) - Quatro;                     
            o.T4.ResultadoAntesDoResultadoFinanceiroEDosTributos(index)  = o.T4.ResultadoAntesDoResultadoFinanceiroEDosTributos(index) - Cinco;
            o.T4.ResultadoFinanceiro(index)             = o.T4.ResultadoFinanceiro(index) - Seis;                
            o.T4.ResultadoAntesDosTributosSobreOLucro(index) = o.T4.ResultadoAntesDosTributosSobreOLucro(index) - Sete;            
            o.T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro(index) = o.T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro(index) - Oito;    
            o.T4.ResultadoLiquidoDasOperacoesContinuadas(index) = o.T4.ResultadoLiquidoDasOperacoesContinuadas(index) - Nove;         
            o.T4.ResultadoLiquidoDeOperacoesDescontinuadas(index) = o.T4.ResultadoLiquidoDeOperacoesDescontinuadas(index) - Dez;        
            o.T4.LucroPrejuizoDoPeriodo(index)          = o.T4.LucroPrejuizoDoPeriodo(index) - Onze;     
       end
    end
end
% -------------------------------------------------------------------------
nomeCompanhia = Arquivo{1};
[principal, remain] = strtok(nomeCompanhia,'_');
ResultadoCondensado = strcat(principal,'_BALANCO.mat');
save(ResultadoCondensado, 'o');


% -------------------------------------------------------------------------
% 7.: Gera o arquivo Excel (apenas para análise).
%
%  Montando a primeira Tabela.
% ----------------------------
NomeArquivo = strcat(principal,'.xls');
n = max(size(o.T1.texto));
m = size(o.T1.data,1);

theta  = waitbar(0, sprintf('Gerando o arquivo em Excel...', n));
for i=1:n
    A{i,1} = o.T1.texto{i};        
    if (i == 1)
        for j=2:(m+1)
            % Escreve a data;
            A{i,j} = o.T1.data(j-1,:);
        end
    end
    
    if (i > 1)
        for j=2:(m+1)
            A{i,j} = o.T1.totalAcoes(j-1);
        end
    end
end
waitbar(1/10);
xlswrite(NomeArquivo, A, 1, 'A1');


%  Montando a segunda Tabela.
% ----------------------------
n2 = max(size(o.T2.texto));
m2 = max(size(o.T2.AtivoTotal));

% Primeira linha
% --------------
A2{1,1} = '';
A2{1,2} = 'Descrição da Conta';
for i=1:(n2+1)
    if (i == 1)
        for j=3:(m2+2)
            % Escreve a data;
            A2{i,j} = o.T1.data(j-2,:);
        end
    end
    
    if (i > 1)
        numero = num2str(cell2mat(o.T2.numero(i-1)));
        Jota  = num2str(cell2mat(o.T2.texto(i-1)));
        A2{i,1} = numero;
        A2{i,2} = Jota;
        
        % Ativo Total
        if (i == 2)
            for j=3:(m2+2)
                A2{i,j} = o.T2.AtivoTotal(j-2);
            end
        end
        
        % Ativo Circulante
        if (i == 3)
            for j=3:(m2+2)
                A2{i,j} = o.T2.AtivoCirculante(j-2);
            end
        end
        
        % Caixa e Equivalente de Caixa
        if (i == 4)
            for j=3:(m2+2)
                A2{i,j} = o.T2.CaixaEEquivalenteDeCaixa(j-2);
            end
        end
        
        % Aplicações Financeiras
        if (i == 5)
            for j=3:(m2+2)
                A2{i,j} = o.T2.AplicacoesFinanceiras(j-2);
            end
        end
        
        % Contasa a Receber
        if (i == 6)
            for j=3:(m2+2)
                A2{i,j} = o.T2.ContasAReceber(j-2);
            end
        end
        
        % Estoques
        if (i == 7)
            for j=3:(m2+2)
                A2{i,j} = o.T2.Estoques(j-2);
            end
        end
        
        % Ativos Biologicos
        if (i == 8)
            for j=3:(m2+2)
                A2{i,j} = o.T2.AtivosBiologicos(j-2);
            end
        end
        
        % Tributos a Recuperar
        if (i == 9)
            for j=3:(m2+2)
                A2{i,j} = o.T2.TributosARecuperar(j-2);
            end
        end
        
        % Despesas Antecipadas
        if (i == 10)
            for j=3:(m2+2)
                A2{i,j} = o.T2.DespesasAntecipadas(j-2);
            end
        end
         
        % Outros Ativos Circulantes
        if (i == 11)
            for j=3:(m2+2)
                A2{i,j} = o.T2.OutrosAtivosCirculantes(j-2);
            end
        end
         
        % Ativo Não Circulante
        if (i == 12)
            for j=3:(m2+2)
                A2{i,j} = o.T2.AtivoNaoCirculante(j-2);
            end
        end
         
        % Ativo Realizavel a LongoPrazo
        if (i == 13)
            for j=3:(m2+2)
                A2{i,j} = o.T2.AtivoRealizavelALongoPrazo(j-2);
            end
        end
        
        % Investimentos
        if (i == 14)
            for j=3:(m2+2)
                A2{i,j} = o.T2.Investimentos(j-2);
            end
        end
        
        % Imobilizado
        if (i == 15)
            for j=3:(m2+2)
                A2{i,j} = o.T2.Imobilizado(j-2);
            end
        end
        
        %  Intangivel
        if (i == 16)
            for j=3:(m2+2)
                A2{i,j} = o.T2.Intangivel(j-2);
            end
        end
        
        % Diferido
        if (i == 17)
            for j=3:(m2+2)
                A2{i,j} = o.T2.Diferido(j-2);
            end
        end
    end
end
waitbar((3.5)/10);
xlswrite(NomeArquivo, A2, 2, 'A1');



%  Montando a terceira Tabela.
% ----------------------------
n3 = max(size(o.T3.texto));
m3 = max(size(o.T3.PassivoTotal));

% Primeira linha
% --------------
A3{1,1} = '';
A3{1,2} = 'Descrição da Conta';
for i=1:(n3+1)
    if (i == 1)
        for j=3:(m3+2)
            % Escreve a data;
            A3{i,j} = o.T1.data(j-2,:);
        end
    end
    
    if (i > 1)
        numero  = num2str(cell2mat(o.T3.numero(i-1)));
        Jota   = num2str(cell2mat(o.T3.texto(i-1)));
        A3{i,1} = numero;
        A3{i,2} = Jota;
        
        % Passivo Total
        if (i == 2)
            for j=3:(m3+2)
                A3{i,j} = o.T3.PassivoTotal(j-2);
            end
        end
        
        % Passivo Circulante
        if (i == 3)
            for j=3:(m3+2)
                A3{i,j} = o.T3.PassivoCirculante(j-2);
            end
        end
        
        % Obrigacoes Sociais e Trabalhistas
        if (i == 4)
            for j=3:(m3+2)
                A3{i,j} = o.T3.ObrigacoesSociaisETrabalhistas(j-2);
            end
        end
        
        % Fornecedores
        if (i == 5)
            for j=3:(m3+2)
                A3{i,j} = o.T3.Fornecedores(j-2);
            end
        end
        
        % Obrigações Fiscais
        if (i == 6)
            for j=3:(m3+2)
                A3{i,j} = o.T3.ObrigacoesFiscais(j-2);
            end
        end
        
        % Emprestimos e Financiamentos
        if (i == 7)
            for j=3:(m3+2)
                A3{i,j} = o.T3.EmprestimosEFinanciamentos(j-2);
            end
        end
        
        % Outras Obrigações
        if (i == 8)
            for j=3:(m3+2)
                A3{i,j} = o.T3.OutrasObrigacoes(j-2);
            end
        end
        
        % Provisoes
        if (i == 9)
            for j=3:(m3+2)
                A3{i,j} = o.T3.Provisoes(j-2);
            end
        end
        
        % Passivo Sobre Ativos Nao-Correntes a Venda e Descontinuados
        if (i == 10)
            for j=3:(m3+2)
                A3{i,j} = o.T3.PassivoSobreAtivosNaoCorrentesAVendaEDescontinuados(j-2);
            end
        end
         
        % Passivo Não Circulante
        if (i == 11)
            for j=3:(m3+2)
                A3{i,j} = o.T3.PassivoNaoCirculante(j-2);
            end
        end
         
        % Emprestimos e Financiamentos
        if (i == 12)
            for j=3:(m3+2)
                A3{i,j} = o.T3.EmprestimosEFinanciamentos2(j-2);
            end
        end
         
        % Outras Obrigações
        if (i == 13)
            for j=3:(m3+2)
                A3{i,j} = o.T3.OutrasObrigacoes2(j-2);
            end
        end
        
        % Tributos Diferidos
        if (i == 14)
            for j=3:(m3+2)
                A3{i,j} = o.T3.TributosDiferidos(j-2);
            end
        end
        
        % Provisões
        if (i == 15)
            for j=3:(m3+2)
                A3{i,j} = o.T3.Provisoes2(j-2);
            end
        end
        
        %  Passivos Sobre Ativos Nao-Correntes a Venda e Descontinuados2
        if (i == 16)
            for j=3:(m3+2)
                A3{i,j} = o.T3.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados2(j-2);
            end
        end
        
        % Lucros e Receitas Apropriar
        if (i == 17)
            for j=3:(m3+2)
                A3{i,j} = o.T3.LucrosEReceitasAApropriar(j-2);
            end
        end
        
        % Patrimonio Líquido
        if (i == 18)
            for j=3:(m3+2)
                A3{i,j} = o.T3.PatrimonioLiquido(j-2);
            end
        end
        
        % Capital Social Realizado
        if (i == 19)
            for j=3:(m3+2)
                A3{i,j} = o.T3.CapitalSocialRealizado(j-2);
            end
        end
        
        % Reserva de Capital
        if (i == 20)
            for j=3:(m3+2)
                A3{i,j} = o.T3.ReservaDeCapital(j-2);
            end
        end
        
        % Reservas de Reavaliação
        if (i == 21)
            for j=3:(m3+2)
                A3{i,j} = o.T3.ReservasDeReavaliacao(j-2);
            end
        end
        
        % Reservas de Lucros
        if (i == 22)
            for j=3:(m3+2)
                A3{i,j} = o.T3.ReservasDeLucros(j-2);
            end
        end
        
        % Lucros Prejuizos Acumulados
        if (i == 23)
            for j=3:(m3+2)
                A3{i,j} = o.T3.LucrosPrejuizosAcumulados(j-2);
            end
        end
        
        % Ajustes de Avalição Patrimonial
        if (i == 24)
            for j=3:(m3+2)
                A3{i,j} = o.T3.AjustesDeAvalicaoPatrimonial(j-2);
            end
        end
        
        % Ajustes Acumulados de Conversão
        if (i == 25)
            for j=3:(m3+2)
                A3{i,j} = o.T3.AjustesAcumuladosDeConversao(j-2);
            end
        end
        
        % Outros Resultados Abrangentes
        if (i == 26)
            for j=3:(m3+2)
                A3{i,j} = o.T3.OutrosResultadosAbrangentes(j-2);
            end
        end
    end
end
waitbar(8/10);
xlswrite(NomeArquivo, A3, 3, 'A1');




%  Montando a Quarta Tabela.
% ----------------------------
n4 = max(size(o.T4.texto));
m4 = max(size(o.T4.ReceitaDeVendaDeBensEOUServicos));

% Primeira linha
% --------------
A4{1,1} = '';
A4{1,2} = 'Descrição da Conta';
for i=1:(n4+1)
    if (i == 1)
        for j=3:(m4+2)
            % Escreve a data;
            A4{i,j} =o.T1.data(j-2,:);
        end
    end
    
    if (i > 1)
        numero  = num2str(cell2mat(o.T4.numero(i-1)));
        Jota   = num2str(cell2mat(o.T4.texto(i-1)));
        A4{i,1} = numero;
        A4{i,2} = Jota;
        
        % Receita de Venda de Bens e/ou Servicos
        if (i == 2)
            for j=3:(m4+2)
                A4{i,j} = o.T4.ReceitaDeVendaDeBensEOUServicos(j-2);
            end
        end
        
        % Custo dos Bens e/ou Servicos Vendidos
        if (i == 3)
            for j=3:(m4+2)
                A4{i,j} = o.T4.CustoDosBensEOUServicosVendidos(j-2);
            end
        end
        
        % Resultado Bruto
        if (i == 4)
            for j=3:(m4+2)
                A4{i,j} = o.T4.ResultadoBruto(j-2);
            end
        end
        
        % Despesas/Receitas Operacionais
        if (i == 5)
            for j=3:(m4+2)
                A4{i,j} = o.T4.DespesasReceitasOperacionais(j-2);
            end
        end
        
        % Resultado Antes do Resultado Financeiro e dos Tributos
        if (i == 6)
            for j=3:(m4+2)
                A4{i,j} = o.T4.ResultadoAntesDoResultadoFinanceiroEDosTributos(j-2);
            end
        end
        
        % Resultado Financeiro
        if (i == 7)
            for j=3:(m4+2)
                A4{i,j} = o.T4.ResultadoFinanceiro(j-2);
            end
        end
        
        % Resultado Antes dos Tributos Sobre o Lucro
        if (i == 8)
            for j=3:(m4+2)
                A4{i,j} = o.T4.ResultadoAntesDosTributosSobreOLucro(j-2);
            end
        end
        
        % Imposto de Renda e Contribuição Social Sobre o Lucro
        if (i == 9)
            for j=3:(m4+2)
                A4{i,j} = o.T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro(j-2);
            end
        end
        
        % Resultado Liquido das Operacoes Continuadas
        if (i == 10)
            for j=3:(m4+2)
                A4{i,j} = o.T4.ResultadoLiquidoDasOperacoesContinuadas(j-2);
            end
        end
         
        % Resultado Liquido de Operacoes Descontinuadas
        if (i == 11)
            for j=3:(m4+2)
                A4{i,j} = o.T4.ResultadoLiquidoDeOperacoesDescontinuadas(j-2);
            end
        end
         
        % LucroPrejuizoDoPeriodo
        if (i == 12)
            for j=3:(m4+2)
                A4{i,j} = o.T4.LucroPrejuizoDoPeriodo(j-2);
            end
        end
    end
end
waitbar(1);
close(theta);
xlswrite(NomeArquivo, A4, 4, 'A1');
clc;
