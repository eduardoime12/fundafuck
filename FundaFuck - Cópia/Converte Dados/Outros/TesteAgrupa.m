% clear all; close all; clc;
% (*) Tentarei criar um grand vetor de dados, os quais pegam os nomes das
%     'FIELDs' da estrutura e agrupa as mesmas em uma estrutura de mesmo
%     nome, mas de tamanho sempre crescente.
% n: quantidade de Trimestre Carregados
CampoTabela1 = fields(TRI{1}.o.T1);
CampoTabela2 = fields(TRI{1}.o.T2);
CampoTabela3 = fields(TRI{1}.o.T3);
CampoTabela4 = fields(TRI{1}.o.T4);
n = max(size(TRI));


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
%            disp(TRI{j}.o.T1.data);
          
           %  Tabela 1
           % ----------
           % O campo 1 está reservado para 'texto'.
           T1.(CampoTabela1{2})(i,:) = TRI{j}.o.T1.data;
           T1.(CampoTabela1{3})(1,j) = TRI{j}.o.T1.totalAcoes;
           
           
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

o = struct('T1',T1,'T2',T2,'T3',T3,'T4',T4);

save(o);
% -------------------------------------------------------------------------
% Tentativa de criar uma Tabela Excel.
% filename = 'testdata.xls';
% A = {'Time','Temperature'; 12,98; 13,99; 14,97};
% sheet = 2;
% xlRange = 'E1';
% xlswrite(filename,A,sheet,xlRange)