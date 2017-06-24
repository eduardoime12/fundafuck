% clear all; close all; clc;
% 
% load('COMGAS_BALANCO.mat');
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