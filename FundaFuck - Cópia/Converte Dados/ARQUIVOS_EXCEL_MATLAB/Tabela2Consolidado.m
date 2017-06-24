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
            'Intangível';};
        
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
             '1.02.04';}; 

% -------------------------------------------------------------------------
% Modificação realizada em 01/04/2017. Foi plotado que alguns programas
% apresentam problemas relativos aos números da tabela.
m = size(file.dado.DFConsAtivo,2);
alfa = 0;
flag = 1;
for j=1:m
    posicao = file.dado.DFConsAtivo(1,j);
    if(isnan(posicao) == 0 && alfa == 0)
       flag = j;
       alfa = 1;
    end
end
file.dado.DFConsAtivo = file.dado.DFConsAtivo(1:end,flag:end);
% -------------------------------------------------------------------------


Numero = file.texto.DFConsAtivo(3:end,1);
Texto  = file.texto.DFConsAtivo(3:end,2);
n = max(size(Texto));

for i=1:n
    str1 = Texto{i};
    
    if(strcmp(str1, 'Ativo Total'))
        if (strcmp(Numero{i},'1'))
            T2.AtivoTotal = file.dado.DFConsAtivo(i,1);
        end
    end    

    
    if(strcmp(str1, 'Ativo Circulante'))
        if (strcmp(Numero{i},'1.01'))
            T2.AtivoCirculante = file.dado.DFConsAtivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Caixa e Equivalentes de Caixa'))
        if (strcmp(Numero{i},'1.01.01'))
            T2.CaixaEEquivalenteDeCaixa = file.dado.DFConsAtivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Aplicações Financeiras'))
        if (strcmp(Numero{i},'1.01.02'))
            T2.AplicacoesFinanceiras = file.dado.DFConsAtivo(i,1); 
        end
    end
    
    if(strcmp(str1, 'Contas a Receber'))
        if (strcmp(Numero{i},'1.01.03'))
            T2.ContasAReceber = file.dado.DFConsAtivo(i,1); 
        end
    end
    
    if(strcmp(str1, 'Estoques'))
        if (strcmp(Numero{i},'1.01.04'))
            T2.Estoques = file.dado.DFConsAtivo(i,1); 
        end
    end
    
    if(strcmp(str1, 'Ativos Biológicos'))
        if (strcmp(Numero{i},'1.01.05'))
            T2.AtivosBiologicos = file.dado.DFConsAtivo(i,1);  
        end
    end
    
    if(strcmp(str1, 'Tributos a Recuperar'))
        if (strcmp(Numero{i},'1.01.06'))
            T2.TributosARecuperar = file.dado.DFConsAtivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Despesas Antecipadas'))
        if (strcmp(Numero{i},'1.01.07'))
            T2.DespesasAntecipadas = file.dado.DFConsAtivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Outros Ativos Circulantes'))
        if (strcmp(Numero{i},'1.01.08'))
            T2.OutrosAtivosCirculantes = file.dado.DFConsAtivo(i,1); 
        end
    end
    
    if(strcmp(str1, 'Ativo Não Circulante'))
        if (strcmp(Numero{i},'1.02'))
            T2.AtivoNaoCirculante = file.dado.DFConsAtivo(i,1); 
        end
    end
    
    if(strcmp(str1, 'Ativo Realizável a Longo Prazo'))
        if (strcmp(Numero{i},'1.02.01'))
            T2.AtivoRealizavelALongoPrazo = file.dado.DFConsAtivo(i,1);  
        end
    end
    
    if(strcmp(str1, 'Investimentos'))
        if (strcmp(Numero{i},'1.02.02'))
            T2.Investimentos = file.dado.DFConsAtivo(i,1);     
        end
    end
    
    if(strcmp(str1, 'Imobilizado'))
        if (strcmp(Numero{i},'1.02.03'))
            T2.Imobilizado = file.dado.DFConsAtivo(i,1);  
        end
    end
    
    if(strcmp(str1, 'Intangível'))
        if (strcmp(Numero{i},'1.02.04'))
            T2.Intangivel = file.dado.DFConsAtivo(i,1); 
        end
    end

end