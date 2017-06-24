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
            'Despesas com Vendas';                      % Inserido 13/03/2016  
            'Despesas Gerais e Administrativas';        % Inserido 13/03/2016  
            'Resultado Antes do Resultado Financeiro e dos Tributos';
            'Resultado Financeiro';
            'Resultado Antes dos Tributos sobre o Lucro';
            'Imposto de Renda e Contribuição Social sobre o Lucro';
            'Resultado Líquido das Operações Continuadas';
            'Resultado Líquido de Operações Descontinuadas';
            'Lucro/Prejuízo Consolidado do Período';        % Alterado 16/03/2016
            'Atribuído a Sócios da Empresa Controladora';   % Inserido 14/03/2016  
            'Atribuído a Sócios Não Controladores';         % Inserido 14/03/2016  
            };
        
T4.numero = {'3.01';
             '3.02';
             '3.03';
             '3.04';
             '3.04.01';                     % Inserido 13/03/2016
             '3.04.02';                     % Inserido 13/03/2016
             '3.05';
             '3.06';
             '3.07';
             '3.08';
             '3.09';
             '3.10';
             '3.11';
             '3.11.01';                     % Inserido 14/03/2016
             '3.11.02';                     % Inserido 14/03/2016
             };                   


% -------------------------------------------------------------------------
% Modificação realizada em 01/04/2017. Foi plotado que alguns programas
% apresentam problemas relativos aos números da tabela.
m = size(file.dado.DFConsResultadoPeriodo,2);
alfa = 0;
flag = 1;
for j=1:m
    posicao = file.dado.DFConsResultadoPeriodo(1,j);
    if(isnan(posicao) == 0 && alfa == 0)
       flag = j;
       alfa = 1;
    end
end
file.dado.DFConsResultadoPeriodo = file.dado.DFConsResultadoPeriodo(1:end,flag:end);
% -------------------------------------------------------------------------          
         
         
Numero = file.texto.DFConsResultadoPeriodo(3:end,1);
Texto  = file.texto.DFConsResultadoPeriodo(3:end,2);
n = max(size(Texto));

for i=1:n
    str1 = Texto{i};
    
    if(strcmp(str1, 'Receita de Venda de Bens e/ou Serviços'))
        if (strcmp(Numero{i},'3.01'))
            T4.ReceitaDeVendaDeBensEOUServicos  = file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Custo dos Bens e/ou Serviços Vendidos'))
        if (strcmp(Numero{i},'3.02'))
            T4.CustoDosBensEOUServicosVendidos  = file.dado.DFConsResultadoPeriodo(i,1);
        end
    end 

    if(strcmp(str1, 'Resultado Bruto'))
        if (strcmp(Numero{i},'3.03'))
            T4.ResultadoBruto  = file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Despesas/Receitas Operacionais'))
        if (strcmp(Numero{i},'3.04'))
            T4.DespesasReceitasOperacionais  = file.dado.DFConsResultadoPeriodo(i,1);
        end
    end 
    
% -------------------------------------------------------------------------    
% Inserido 13/03/2016
    if(strcmp(str1, 'Despesas com Vendas'))
        if (strcmp(Numero{i},'3.04.01'))
            T4.DespesasComVendas  = file.dado.DFConsResultadoPeriodo(i,1);
        end
    end 

    if(strcmp(str1, 'Despesas Gerais e Administrativas'))
        if (strcmp(Numero{i},'3.04.02'))
            T4.DespesasGeraisEAdministrativas  = file.dado.DFConsResultadoPeriodo(i,1);
        end
    end 
% -------------------------------------------------------------------------    

    if(strcmp(str1, 'Resultado Antes do Resultado Financeiro e dos Tributos'))
        if (strcmp(Numero{i},'3.05'))
            T4.ResultadoAntesDoResultadoFinanceiroEDosTributos = ...
                file.dado.DFConsResultadoPeriodo(i,1);
            
        end
    end
    
    if(strcmp(str1, 'Resultado Financeiro'))
        if (strcmp(Numero{i},'3.06'))
            T4.ResultadoFinanceiro  = file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Resultado Antes dos Tributos sobre o Lucro'))
        if (strcmp(Numero{i},'3.07'))
            T4.ResultadoAntesDosTributosSobreOLucro  = file.dado.DFConsResultadoPeriodo(i,1);
        end
    end 
    
    if(strcmp(str1, 'Imposto de Renda e Contribuição Social sobre o Lucro'))
        if (strcmp(Numero{i},'3.08'))
            T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro  = ...
                file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Resultado Líquido das Operações Continuadas'))
        if (strcmp(Numero{i},'3.09'))
            T4.ResultadoLiquidoDasOperacoesContinuadas  = file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Resultado Líquido de Operações Descontinuadas'))
        if (strcmp(Numero{i},'3.10'))
            T4.ResultadoLiquidoDeOperacoesDescontinuadas  = file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Lucro/Prejuízo Consolidado do Período'))   % Alterado 16/03/2016
        if (strcmp(Numero{i},'3.11'))
            T4.LucroPrejuizoDoPeriodo  = file.dado.DFConsResultadoPeriodo(i,1);
        end
        
% -------------------------------------------------------------------------        
% Inserido dia 14/03/2016
        if (strcmp(Numero{i+1}, '3.11.01'))
            T4.AtribuidoASociosDaEmpresaControladora  = file.dado.DFConsResultadoPeriodo(i+1,1);
            T4.AtribuidoASociosNaoControladora        = file.dado.DFConsResultadoPeriodo(i+2,1);
        else
            T4.AtribuidoASociosDaEmpresaControladora  = file.dado.DFConsResultadoPeriodo(i,1);
            T4.AtribuidoASociosNaoControladora        = 0;
        end
% -------------------------------------------------------------------------      
    end   
end