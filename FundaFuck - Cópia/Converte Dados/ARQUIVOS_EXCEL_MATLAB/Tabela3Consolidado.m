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
            'Dividendos e JCP a pagar';             % Inserido 13/03/2016
            'Provis�es';
            'Passivos sobre Ativos N�o-Correntes a Venda e Descontinuados';
            'Passivo N�o Circulante';
            'Empr�stimos e Financiamentos';
            'Outras Obriga��es';
            'Tributos Diferidos';
            'Provis�es';
            'Passivo sobre Ativos N�o-Correntes a Venda e Descontinuados';
            'Lucro e Receitas a Apropriar';
            'Patrim�nio L�quido Consolidado';       % Alterado 16/03/2016
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
% Modifica��o realizada em 01/04/2017. Foi plotado que alguns programas
% apresentam problemas relativos aos n�meros da tabela.
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
    
    if(strcmp(str1, 'Obriga��es Sociais e Trabalhistas'))
        if (strcmp(Numero{i},'2.01.01'))
            T3.ObrigacoesSociaisETrabalhistas = file.dado.DFConsPassivo(i,1);
        end
    end  
    
    if(strcmp(str1, 'Fornecedores'))
        if (strcmp(Numero{i},'2.01.02'))
            T3.Fornecedores = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Obriga��es Fiscais'))
        if (strcmp(Numero{i},'2.01.03'))
            T3.ObrigacoesFiscais = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Empr�stimos e Financiamentos'))
        if (strcmp(Numero{i},'2.01.04'))
            T3.EmprestimosEFinanciamentos = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Outras Obriga��es'))
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

    if(strcmp(str1, 'Provis�es'))
        if (strcmp(Numero{i},'2.01.06'))
            T3.Provisoes = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Passivos sobre Ativos N�o-Correntes a Venda e Descontinuados'))
        if (strcmp(Numero{i},'2.01.07'))
            T3.PassivoSobreAtivosNaoCorrentesAVendaEDescontinuados = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Passivo N�o Circulante'))
        if (strcmp(Numero{i},'2.02'))
            T3.PassivoNaoCirculante = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Empr�stimos e Financiamentos'))
        if (strcmp(Numero{i},'2.02.01'))
            T3.EmprestimosEFinanciamentos2 = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Outras Obriga��es'))
        if (strcmp(Numero{i},'2.02.02'))
            T3.OutrasObrigacoes2 = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Tributos Diferidos'))
        if (strcmp(Numero{i},'2.02.03'))
            T3.TributosDiferidos = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Provis�es'))
        if (strcmp(Numero{i},'2.02.04'))
            T3.Provisoes2 = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Passivos sobre Ativos N�o-Correntes a Venda e Descontinuados'))
        if (strcmp(Numero{i},'2.02.05'))
            T3.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados2 = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Lucros e Receitas a Apropriar'))
        if (strcmp(Numero{i},'2.02.06'))
            T3.LucrosEReceitasAApropriar = file.dado.DFConsPassivo(i,1);
        end
    end
     
    if(strcmp(str1, 'Patrim�nio L�quido Consolidado'))   % Alterado 16/03/2016
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
    
    if(strcmp(str1, 'Reservas de Reavalia��o'))
        if (strcmp(Numero{i},'2.03.03'))
            T3.ReservasDeReavaliacao = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Reservas de Lucros'))
        if (strcmp(Numero{i},'2.03.04'))
            T3.ReservasDeLucros = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Lucros/Preju�zos Acumulados'))
        if (strcmp(Numero{i},'2.03.05'))
            T3.LucrosPrejuizosAcumulados = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Ajustes de Avalia��o Patrimonial'))
        if (strcmp(Numero{i},'2.03.06'))
            T3.AjustesDeAvalicaoPatrimonial = file.dado.DFConsPassivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Ajustes Acumulados de Convers�o'))
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