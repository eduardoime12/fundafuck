clear all; close all; clc;

raiz    = pwd;
[NomeArquivo, CaminhoArquivo, ~] = uigetfile(fullfile(raiz, '*.mat'), 'MultiSelect', 'on');
rmpath([CaminhoArquivo]);
addpath([CaminhoArquivo]); 

TRI = cellstr(NomeArquivo);
n       = max(size(TRI));
if (n == 1)
    TRI{1} = load(TRI{1});
else
    for i=1:n
        TRI{i} = load(TRI{i});
    end
end


%  Montando a primeira Tabela.
% ----------------------------
NomeArquivo = 'testdata.xls';
n = max(size(TRI{1}.o.T1.texto));
m = size(TRI{1}.o.T1.data,1);

for i=1:n
    A{i,1} = TRI{1}.o.T1.texto{i};
    for j=2:(m+1)
        if(i == 1)
            % Escreve a data;
            A{i,j} = TRI{1}.o.T1.data(i,:);
        end
        if(i == 2)
            A{i,j} = TRI{1}.o.T1.totalAcoes(j-1);
        end
    end
end
xlswrite(NomeArquivo, A, 1, 'A1');


%  Montando a segunda Tabela.
% ----------------------------
NomeArquivo = 'testdata.xls';
n2 = max(size(TRI{1}.o.T2.texto));
m2 = max(size(TRI{1}.o.T2.AtivoTotal));

% Primeira linha
% --------------
A2{1,1} = '';
A2{1,2} = 'Descrição da Conta';
for i=1:(n2+1)
    if (i == 1)
        for j=3:(m2+2)
            % Escreve a data;
            A2{i,j} = TRI{1}.o.T1.data(j-2,:);
        end
    end
    
    if (i > 1)
        numero = num2str(cell2mat(TRI{1}.o.T2.numero(i-1)));
        texto  = num2str(cell2mat(TRI{1}.o.T2.texto(i-1)));
        A2{i,1} = numero;
        A2{i,2} = texto;
        
        % Ativo Total
        if (i == 2)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.AtivoTotal(j-2);
            end
        end
        
        % Ativo Circulante
        if (i == 3)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.AtivoCirculante(j-2);
            end
        end
        
        % Caixa e Equivalente de Caixa
        if (i == 4)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.CaixaEEquivalenteDeCaixa(j-2);
            end
        end
        
        % Aplicações Financeiras
        if (i == 5)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.AplicacoesFinanceiras(j-2);
            end
        end
        
        % Contasa a Receber
        if (i == 6)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.ContasAReceber(j-2);
            end
        end
        
        % Estoques
        if (i == 7)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.Estoques(j-2);
            end
        end
        
        % Ativos Biologicos
        if (i == 8)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.AtivosBiologicos(j-2);
            end
        end
        
        % Tributos a Recuperar
        if (i == 9)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.TributosARecuperar(j-2);
            end
        end
        
        % Despesas Antecipadas
        if (i == 10)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.DespesasAntecipadas(j-2);
            end
        end
         
        % Outros Ativos Circulantes
        if (i == 11)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.OutrosAtivosCirculantes(j-2);
            end
        end
         
        % Ativo Não Circulante
        if (i == 12)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.AtivoNaoCirculante(j-2);
            end
        end
         
        % Ativo Realizavel a LongoPrazo
        if (i == 13)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.AtivoRealizavelALongoPrazo(j-2);
            end
        end
        
        % Investimentos
        if (i == 14)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.Investimentos(j-2);
            end
        end
        
        % Imobilizado
        if (i == 15)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.Imobilizado(j-2);
            end
        end
        
        %  Intangivel
        if (i == 16)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.Intangivel(j-2);
            end
        end
        
        % Diferido
        if (i == 17)
            for j=3:(m2+2)
                A2{i,j} = TRI{1}.o.T2.Diferido(j-2);
            end
        end
    end
end
A2
xlswrite(NomeArquivo, A2, 2, 'A1');



%  Montando a terceira Tabela.
% ----------------------------
NomeArquivo = 'testdata.xls';
n3 = max(size(TRI{1}.o.T3.texto));
m3 = max(size(TRI{1}.o.T3.PassivoTotal));

% Primeira linha
% --------------
A3{1,1} = '';
A3{1,2} = 'Descrição da Conta';
for i=1:(n3+1)
    if (i == 1)
        for j=3:(m3+2)
            % Escreve a data;
            A3{i,j} = TRI{1}.o.T1.data(j-2,:);
        end
    end
    
    if (i > 1)
        numero  = num2str(cell2mat(TRI{1}.o.T3.numero(i-1)));
        texto   = num2str(cell2mat(TRI{1}.o.T3.texto(i-1)));
        A3{i,1} = numero;
        A3{i,2} = texto;
        
        % Passivo Total
        if (i == 2)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.PassivoTotal(j-2);
            end
        end
        
        % Passivo Circulante
        if (i == 3)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.PassivoCirculante(j-2);
            end
        end
        
        % Obrigacoes Sociais e Trabalhistas
        if (i == 4)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.ObrigacoesSociaisETrabalhistas(j-2);
            end
        end
        
        % Fornecedores
        if (i == 5)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.Fornecedores(j-2);
            end
        end
        
        % Obrigações Fiscais
        if (i == 6)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.ObrigacoesFiscais(j-2);
            end
        end
        
        % Emprestimos e Financiamentos
        if (i == 7)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.EmprestimosEFinanciamentos(j-2);
            end
        end
        
        % Outras Obrigações
        if (i == 8)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.OutrasObrigacoes(j-2);
            end
        end
        
        % Provisoes
        if (i == 9)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.Provisoes(j-2);
            end
        end
        
        % Passivo Sobre Ativos Nao-Correntes a Venda e Descontinuados
        if (i == 10)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.PassivoSobreAtivosNaoCorrentesAVendaEDescontinuados(j-2);
            end
        end
         
        % Passivo Não Circulante
        if (i == 11)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.PassivoNaoCirculante(j-2);
            end
        end
         
        % Emprestimos e Financiamentos
        if (i == 12)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.EmprestimosEFinanciamentos2(j-2);
            end
        end
         
        % Outras Obrigações
        if (i == 13)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.OutrasObrigacoes2(j-2);
            end
        end
        
        % Tributos Diferidos
        if (i == 14)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.TributosDiferidos(j-2);
            end
        end
        
        % Provisões
        if (i == 15)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.Provisoes2(j-2);
            end
        end
        
        %  Passivos Sobre Ativos Nao-Correntes a Venda e Descontinuados2
        if (i == 16)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados2(j-2);
            end
        end
        
        % Lucros e Receitas Apropriar
        if (i == 17)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.LucrosEReceitasAApropriar(j-2);
            end
        end
        
        % Patrimonio Líquido
        if (i == 18)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.PatrimonioLiquido(j-2);
            end
        end
        
        % Capital Social Realizado
        if (i == 19)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.CapitalSocialRealizado(j-2);
            end
        end
        
        % Reserva de Capital
        if (i == 20)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.ReservaDeCapital(j-2);
            end
        end
        
        % Reservas de Reavaliação
        if (i == 21)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.ReservasDeReavaliacao(j-2);
            end
        end
        
        % Reservas de Lucros
        if (i == 22)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.ReservasDeLucros(j-2);
            end
        end
        
        % Lucros Prejuizos Acumulados
        if (i == 23)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.LucrosPrejuizosAcumulados(j-2);
            end
        end
        
        % Ajustes de Avalição Patrimonial
        if (i == 24)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.AjustesDeAvalicaoPatrimonial(j-2);
            end
        end
        
        % Ajustes Acumulados de Conversão
        if (i == 25)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.AjustesAcumuladosDeConversao(j-2);
            end
        end
        
        % Outros Resultados Abrangentes
        if (i == 26)
            for j=3:(m3+2)
                A3{i,j} = TRI{1}.o.T3.OutrosResultadosAbrangentes(j-2);
            end
        end
    end
end
A3
xlswrite(NomeArquivo, A3, 3, 'A1');




%  Montando a Quarta Tabela.
% ----------------------------
NomeArquivo = 'testdata.xls';
n4 = max(size(TRI{1}.o.T4.texto));
m4 = max(size(TRI{1}.o.T4.ReceitaDeVendaDeBensEOUServicos));

% Primeira linha
% --------------
A4{1,1} = '';
A4{1,2} = 'Descrição da Conta';
for i=1:(n4+1)
    if (i == 1)
        for j=3:(m4+2)
            % Escreve a data;
            A4{i,j} = TRI{1}.o.T1.data(j-2,:);
        end
    end
    
    if (i > 1)
        numero  = num2str(cell2mat(TRI{1}.o.T4.numero(i-1)));
        texto   = num2str(cell2mat(TRI{1}.o.T4.texto(i-1)));
        A4{i,1} = numero;
        A4{i,2} = texto;
        
        % Receita de Venda de Bens e/ou Servicos
        if (i == 2)
            for j=3:(m4+2)
                A4{i,j} = TRI{1}.o.T4.ReceitaDeVendaDeBensEOUServicos(j-2);
            end
        end
        
        % Custo dos Bens e/ou Servicos Vendidos
        if (i == 3)
            for j=3:(m4+2)
                A4{i,j} = TRI{1}.o.T4.CustoDosBensEOUServicosVendidos(j-2);
            end
        end
        
        % Resultado Bruto
        if (i == 4)
            for j=3:(m4+2)
                A4{i,j} = TRI{1}.o.T4.ResultadoBruto(j-2);
            end
        end
        
        % Despesas/Receitas Operacionais
        if (i == 5)
            for j=3:(m4+2)
                A4{i,j} = TRI{1}.o.T4.DespesasReceitasOperacionais(j-2);
            end
        end
        
        % Resultado Antes do Resultado Financeiro e dos Tributos
        if (i == 6)
            for j=3:(m4+2)
                A4{i,j} = TRI{1}.o.T4.ResultadoAntesDoResultadoFinanceiroEDosTributos(j-2);
            end
        end
        
        % Resultado Financeiro
        if (i == 7)
            for j=3:(m4+2)
                A4{i,j} = TRI{1}.o.T4.ResultadoFinanceiro(j-2);
            end
        end
        
        % Resultado Antes dos Tributos Sobre o Lucro
        if (i == 8)
            for j=3:(m4+2)
                A4{i,j} = TRI{1}.o.T4.ResultadoAntesDosTributosSobreOLucro(j-2);
            end
        end
        
        % Imposto de Renda e Contribuição Social Sobre o Lucro
        if (i == 9)
            for j=3:(m4+2)
                A4{i,j} = TRI{1}.o.T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro(j-2);
            end
        end
        
        % Resultado Liquido das Operacoes Continuadas
        if (i == 10)
            for j=3:(m4+2)
                A4{i,j} = TRI{1}.o.T4.ResultadoLiquidoDasOperacoesContinuadas(j-2);
            end
        end
         
        % Resultado Liquido de Operacoes Descontinuadas
        if (i == 11)
            for j=3:(m4+2)
                A4{i,j} = TRI{1}.o.T4.ResultadoLiquidoDeOperacoesDescontinuadas(j-2);
            end
        end
         
        % LucroPrejuizoDoPeriodo
        if (i == 12)
            for j=3:(m4+2)
                A4{i,j} = TRI{1}.o.T4.LucroPrejuizoDoPeriodo(j-2);
            end
        end
    end
end
A4
xlswrite(NomeArquivo, A4, 4, 'A1');
