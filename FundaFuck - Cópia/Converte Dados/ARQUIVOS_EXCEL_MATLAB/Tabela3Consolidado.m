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
            'Dividendos e JCP a pagar';             % Inserido 13/03/2016
            'Provisões';
            'Passivos sobre Ativos Não-Correntes a Venda e Descontinuados';
            'Passivo Não Circulante';
            'Empréstimos e Financiamentos';
            'Outras Obrigações';
            'Tributos Diferidos';
            'Provisões';
            'Passivo sobre Ativos Não-Correntes a Venda e Descontinuados';
            'Lucro e Receitas a Apropriar';
            'Patrimônio Líquido Consolidado';       % Alterado 16/03/2016
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
             '2.01.05.02.01';                    % Inserido 13/03/2016
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
             '2.03.08';};


% -------------------------------------------------------------------------
% Modificação realizada em 01/04/2017. Foi plotado que alguns programas
% apresentam problemas relativos aos números da tabela.
m = size(file.dado.DFConsPassivo,2);
alfa = 0;
flag = 1;
for j=1:m
    posicao = file.dado.DFConsPassivo(1,j);
    if(isnan(posicao) == 0 && alfa == 0)
       flag = j;
       alfa = 1;
    end
end
file.dado.DFConsPassivo = file.dado.DFConsPassivo(1:end,flag:end);
% -------------------------------------------------------------------------         
         
         
Numero = file.texto.DFConsPassivo(3:end,1);
Texto  = file.texto.DFConsPassivo(3:end,2);
n = max(size(Texto));

for i=1:n
    str1 = Texto{i};
    
    if(strcmp(str1, 'Passivo Total'))
        if (strcmp(Numero{i},'2'))
            T3.PassivoTotal = file.dado.DFConsPassivo(i,1);
        end
    end 
    
    if(strcmp(str1, 'Passivo Circulante'))
        if (strcmp(Numero{i},'2.01'))
            T3.PassivoCirculante = file.dado.DFConsPassivo(i,1);
        end
    end 
    
    if(strcmp(str1, 'Obrigações Sociais e Trabalhistas'))
        if (strcmp(Numero{i},'2.01.01'))
            T3.ObrigacoesSociaisETrabalhistas = file.dado.DFConsPassivo(i,1);
        end
    end  
    
    if(strcmp(str1, 'Fornecedores'))
        if (strcmp(Numero{i},'2.01.02'))
            T3.Fornecedores = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Obrigações Fiscais'))
        if (strcmp(Numero{i},'2.01.03'))
            T3.ObrigacoesFiscais = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Empréstimos e Financiamentos'))
        if (strcmp(Numero{i},'2.01.04'))
            T3.EmprestimosEFinanciamentos = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Outras Obrigações'))
        if (strcmp(Numero{i},'2.01.05'))
            T3.OutrasObrigacoes = file.dado.DFConsPassivo(i,1);
        end
    end
    
% ------------------------------------------------------------------------- 
% Inserido 13/03/2016
    if(strcmp(str1, 'Dividendos e JCP a Pagar'))
            T3.DividendosEJCPAPagar = file.dado.DFConsPassivo(i,1);
    end
% -------------------------------------------------------------------------    

    if(strcmp(str1, 'Provisões'))
        if (strcmp(Numero{i},'2.01.06'))
            T3.Provisoes = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Passivos sobre Ativos Não-Correntes a Venda e Descontinuados'))
        if (strcmp(Numero{i},'2.01.07'))
            T3.PassivoSobreAtivosNaoCorrentesAVendaEDescontinuados = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Passivo Não Circulante'))
        if (strcmp(Numero{i},'2.02'))
            T3.PassivoNaoCirculante = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Empréstimos e Financiamentos'))
        if (strcmp(Numero{i},'2.02.01'))
            T3.EmprestimosEFinanciamentos2 = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Outras Obrigações'))
        if (strcmp(Numero{i},'2.02.02'))
            T3.OutrasObrigacoes2 = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Tributos Diferidos'))
        if (strcmp(Numero{i},'2.02.03'))
            T3.TributosDiferidos = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Provisões'))
        if (strcmp(Numero{i},'2.02.04'))
            T3.Provisoes2 = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Passivos sobre Ativos Não-Correntes a Venda e Descontinuados'))
        if (strcmp(Numero{i},'2.02.05'))
            T3.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados2 = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Lucros e Receitas a Apropriar'))
        if (strcmp(Numero{i},'2.02.06'))
            T3.LucrosEReceitasAApropriar = file.dado.DFConsPassivo(i,1);
        end
    end
     
    if(strcmp(str1, 'Patrimônio Líquido Consolidado'))   % Alterado 16/03/2016
        if (strcmp(Numero{i},'2.03'))
            T3.PatrimonioLiquido = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Capital Social Realizado'))
        if (strcmp(Numero{i},'2.03.01'))
            T3.CapitalSocialRealizado = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Reservas de Capital'))
        if (strcmp(Numero{i},'2.03.02'))
            T3.ReservaDeCapital = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Reservas de Reavaliação'))
        if (strcmp(Numero{i},'2.03.03'))
            T3.ReservasDeReavaliacao = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Reservas de Lucros'))
        if (strcmp(Numero{i},'2.03.04'))
            T3.ReservasDeLucros = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Lucros/Prejuízos Acumulados'))
        if (strcmp(Numero{i},'2.03.05'))
            T3.LucrosPrejuizosAcumulados = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Ajustes de Avaliação Patrimonial'))
        if (strcmp(Numero{i},'2.03.06'))
            T3.AjustesDeAvalicaoPatrimonial = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Ajustes Acumulados de Conversão'))
        if (strcmp(Numero{i},'2.03.07'))
            T3.AjustesAcumuladosDeConversao = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Outros Resultados Abrangentes'))
        if (strcmp(Numero{i},'2.03.08'))
            T3.OutrosResultadosAbrangentes = file.dado.DFConsPassivo(i,1);
        end
    end
end