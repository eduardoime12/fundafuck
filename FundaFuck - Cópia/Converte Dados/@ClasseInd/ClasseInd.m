classdef ClasseInd
    
    properties
        Nome
        
        QuantAcoes
        AcoesTesouraria
        
        Data
        Tabela1
        Tabela2
        Tabela3
        
        Indicador
    end
    
    methods
        
        % -----------------------------------------------------------------
        %                           Construtor
        % -----------------------------------------------------------------
        function [o] = ClasseInd(name)
           o.Nome            = name.Empresa;
           o.Data            = name.Data;
           o.QuantAcoes      = name.QuantAcoes;
           o.AcoesTesouraria = name.AcoesTesouraria;
           o.Tabela1         = name.T1;
           o.Tabela2         = name.T2;
           o.Tabela3         = name.T3;
           
           %%%  Indicadores
           [o] = fnData(o);   
           [o] = fnROE(o);
           [o] = fnIndiceLiquidezCorrente(o);
           [o] = fnVPA(o);
           [o] = fnLucroLiquido(o);
           [o] = fnMargemLiquida(o);
           [o] = fnMargemBruta(o);
           [o] = fnMargemEBIT(o);
           [o] = fnDividendos(o);
           [o] = fnDespesasPorLucroBruto(o);
           [o] = fnLucroAntesDosImpostos(o);
           [o] = fnResultadoDeVendas(o);
           [o] = fnDividaBruta(o);
           [o] = fnDividaLiquida(o);

           %%% Cria o arquivo .txt
           criaTXT(o);
        end;
        
        
        % -----------------------------------------------------------------
        %                           Demais Métodos
        % -----------------------------------------------------------------
        [o] = fnData(o,varargin);
        [o] = fnROE(o);
        [o] = fnIndiceLiquidezCorrente(o);
        [o] = fnVPA(o);
        [o] = fnLucroLiquido(o);
        [o] = fnMargemBruta(o); 
        [o] = fnMargemEBIT(o);
        [o] = fnDividendos(o);
        [o] = fnDespesasPorLucroBruto(o);
        [o] = fnLucroAntesDosImpostos(o);
        [o] = fnResultadoDeVendas(o);
        [o] = fnDividaBruta(o);
        [o] = fnDividaLiquida(o);
        
        criaTXT(o);
        [] = espacosVazios(o, varargin);
    end
    
end

