function [] = plotaIndicador(o, varargin)

GrossuraLinha = 2;
n = max(size(varargin));
Indicador = varargin{1};

if (n >= 2)
    Cor       = varargin{2};
    if(n ==3)
       Indicador2 = varargin{3};
       Indicador2 = char(Indicador2);
    end
end

Indicador = char(Indicador);

if (n<=2)
    switch Indicador

        % ROE    
        case 'ROE'
            x = o.Indicador.ROE.x;
            y = o.Indicador.ROE.y;     
            plot(x, y, Cor, 'LineWidth', GrossuraLinha);
            title('ROE - Retorno sobre o Patrim�nio L�quido', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('%', 'FontSize', 14);


        % Lucro L�quido 
        case 'Lucro L�quido (Trimestre)'          
                    x = o.Indicador.LucroLiquido.Trimestre.x;
                    y = o.Indicador.LucroLiquido.Trimestre.y;
                    plot(x, y, Cor, 'LineWidth', GrossuraLinha);
                    title('Lucro L�quido (Trimestre)', 'FontSize', 14);
                    xlabel('Ano', 'FontSize', 14);
                    ylabel('Valor em milhares de R$', 'FontSize', 14);

        case 'Lucro L�quido (Ano)'          
                    x = o.Indicador.LucroLiquido.Ano.x;
                    y = o.Indicador.LucroLiquido.Ano.y;
                    plot(x, y, Cor, 'LineWidth', GrossuraLinha);
                    title('Lucro L�quido (Ano)', 'FontSize', 14);
                    xlabel('Ano', 'FontSize', 14);
                    ylabel('Valor em milhares de R$', 'FontSize', 14);                


        % �ndice de Liquidez Corrente
        case '�ndice de Liquidez Corrente'
            x = o.Indicador.IndiceLiquidezCorrente.x;
            y = o.Indicador.IndiceLiquidezCorrente.y;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('�ndice de Liquidez Corrente', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('');



        % Margem Bruta
        case 'Margem Bruta'
            x = o.Indicador.MargemBruta.x;
            y = o.Indicador.MargemBruta.y;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('Margem Bruta', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('%', 'FontSize', 14);  


        % Margem L�quida
        case 'Margem L�quida'
            x = o.Indicador.MargemLiquida.x;
            y = o.Indicador.MargemLiquida.y;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('Margem L�quida', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('%', 'FontSize', 14);



        % D�vida Bruta
        case 'D�vida Bruta'
            x = o.Indicador.DividaBruta.x;
            y = o.Indicador.DividaBruta.y;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('D�vida Bruta', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('Valor em milhares de R$', 'FontSize', 14);      


        % D�vida L�quida
        case 'D�vida L�quida'
            x = o.Indicador.DividaLiquida.x;
            y = o.Indicador.DividaLiquida.y;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('D�vida L�quida', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('Valor em milhares de R$', 'FontSize', 14); 


        % Margem EBIT
        case 'Margem EBIT'
            x = o.Indicador.MargemEBIT.x;
            y = o.Indicador.MargemEBIT.y;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('Margem EBIT', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('%');


        % VPA
        case 'VPA'
            x = o.Indicador.VPA.x;
            y = o.Indicador.VPA.y;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('VPA', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('');


        % Quantidade de a��es
        case 'Quant. de A��es'
            y = o.QuantAcoes;
            x = o.Data.TRIMESTRE;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('Quantidade de A��es', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('Em milhares');    


        % A��es em Tesouraria
        case 'A��es em Tesouraria'
            y = o.AcoesTesouraria;
            x = o.Data.TRIMESTRE;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('Quantidade de A��es em Tesouraria', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('Em milhares');         


        % Dividendos
        case 'Dividendos'
            y = o.Indicador.Dividendos.Ano.y;
            x = o.Indicador.Dividendos.Ano.x;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('Dividendos', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('Em milhares');


        % Despesas por Lucro Bruto
        case 'Despesas por Lucro Bruto'
            x = o.Indicador.DespesasPorLucroBruto.x;
            y = o.Indicador.DespesasPorLucroBruto.y;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('Despesas por Lucro Bruto', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('Em %');        


        % Lucro antes dos Impostos
        case 'Lucro antes dos Impostos'
            x = o.Indicador.LucroAntesDosImpostos.x;
            y = o.Indicador.LucroAntesDosImpostos.y;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('Lucro antes dos Impostos', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('Em milhares');        


        % Vendas Brutas
        case 'Vendas Brutas'
            x = o.Indicador.Vendas.x;
            y = o.Indicador.Vendas.y;
            plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
            title('Vendas Brutas', 'FontSize', 14);
            xlabel('Ano', 'FontSize', 14);
            ylabel('Em milhares');        
    end
else
    switch Indicador
    
        % ROE    
        case 'ROE'
            x = o.Indicador.ROE.x;
            y = o.Indicador.ROE.y;
            titulo1 = 'Em %'; 
            
        % Lucro L�quido 
        case 'Lucro L�quido (Trimestre)'          
                    x = o.Indicador.LucroLiquido.Trimestre.x;
                    y = o.Indicador.LucroLiquido.Trimestre.y;
                    titulo1 = 'Em milhares'; 
        case 'Lucro L�quido (Ano)'          
                    x = o.Indicador.LucroLiquido.Ano.x;
                    y = o.Indicador.LucroLiquido.Ano.y;
                    titulo1 = 'Em milhares'; 

        % �ndice de Liquidez Corrente
        case '�ndice de Liquidez Corrente'
            x = o.Indicador.IndiceLiquidezCorrente.x;
            y = o.Indicador.IndiceLiquidezCorrente.y;
            titulo1 = 'Em %'; 


        % Margem Bruta
        case 'Margem Bruta'
            x = o.Indicador.MargemBruta.x;
            y = o.Indicador.MargemBruta.y;
            titulo1 = 'Em %'; 

        % Margem L�quida
        case 'Margem L�quida'
            x = o.Indicador.MargemLiquida.x;
            y = o.Indicador.MargemLiquida.y;
            titulo1 = 'Em %'; 


        % D�vida Bruta
        case 'D�vida Bruta'
            x = o.Indicador.DividaBruta.x;
            y = o.Indicador.DividaBruta.y;
            titulo1 = 'Em milhares'; 

        % D�vida L�quida
        case 'D�vida L�quida'
            x = o.Indicador.DividaLiquida.x;
            y = o.Indicador.DividaLiquida.y;
            titulo1 = 'Em milhares'; 

        % Margem EBIT
        case 'Margem EBIT'
            x = o.Indicador.MargemEBIT.x;
            y = o.Indicador.MargemEBIT.y;
            titulo1 = 'Em %'; 

        % VPA
        case 'VPA'
            x = o.Indicador.VPA.x;
            y = o.Indicador.VPA.y;
            titulo1 = ''; 

        % Quantidade de a��es
        case 'Quant. de A��es'
            y = o.QuantAcoes;
            x = o.Data.TRIMESTRE;
            titulo1 = 'Em milhares'; 

        % A��es em Tesouraria
        case 'A��es em Tesouraria'
            y = o.AcoesTesouraria;
            x = o.Data.TRIMESTRE;       
            titulo1 = 'Em milhares'; 

        % Dividendos
        case 'Dividendos'
            y = o.Indicador.Dividendos.Ano.y;
            x = o.Indicador.Dividendos.Ano.x;
            titulo1 = 'Em milhares';    

        % Despesas por Lucro Bruto
        case 'Despesas por Lucro Bruto'
            x = o.Indicador.DespesasPorLucroBruto.x;
            y = o.Indicador.DespesasPorLucroBruto.y;       
            titulo1 = 'Em %'; 

        % Lucro antes dos Impostos
        case 'Lucro antes dos Impostos'
            x = o.Indicador.LucroAntesDosImpostos.x;
            y = o.Indicador.LucroAntesDosImpostos.y;       
            titulo1 = 'Em milhares'; 

        % Vendas Brutas
        case 'Vendas Brutas'
            x = o.Indicador.Vendas.x; 
            y = o.Indicador.Vendas.y;
            titulo1 = 'Em milhares'; 
    end
    
    
    
    switch Indicador2
    
        % ROE    
        case 'ROE'
            x2 = o.Indicador.ROE.x;
            y2 = o.Indicador.ROE.y; 
            titulo2 = 'Em %'; 

        % Lucro L�quido 
        case 'Lucro L�quido (Trimestre)'          
                    x2 = o.Indicador.LucroLiquido.Trimestre.x;
                    y2 = o.Indicador.LucroLiquido.Trimestre.y;
                    titulo2 = 'Em milhares'; 
                    
        case 'Lucro L�quido (Ano)'          
                    x2 = o.Indicador.LucroLiquido.Ano.x;
                    y2 = o.Indicador.LucroLiquido.Ano.y;
                    titulo2 = 'Em milhares'; 

        % �ndice de Liquidez Corrente
        case '�ndice de Liquidez Corrente'
            x2 = o.Indicador.IndiceLiquidezCorrente.x;
            y2 = o.Indicador.IndiceLiquidezCorrente.y;
            titulo2 = 'Em %'; 


        % Margem Bruta
        case 'Margem Bruta'
            x2 = o.Indicador.MargemBruta.x;
            y2 = o.Indicador.MargemBruta.y;
            titulo2 = 'Em %'; 

        % Margem L�quida
        case 'Margem L�quida'
            x2 = o.Indicador.MargemLiquida.x;
            y2 = o.Indicador.MargemLiquida.y;
            titulo2 = 'Em %'; 

        % D�vida Bruta
        case 'D�vida Bruta'
            x2 = o.Indicador.DividaBruta.x;
            y2 = o.Indicador.DividaBruta.y;
            titulo2 = 'Em milhares'; 

        % D�vida L�quida
        case 'D�vida L�quida'
            x2 = o.Indicador.DividaLiquida.x;
            y2 = o.Indicador.DividaLiquida.y;
            titulo2 = 'Em milhares'; 

        % Margem EBIT
        case 'Margem EBIT'
            x2 = o.Indicador.MargemEBIT.x;
            y2 = o.Indicador.MargemEBIT.y;
            titulo2 = 'Em %'; 

        % VPA
        case 'VPA'
            x2 = o.Indicador.VPA.x;
            y2 = o.Indicador.VPA.y;
            titulo2 = ''; 

        % Quantidade de a��es
        case 'Quant. de A��es'
            y2 = o.QuantAcoes;
            x2 = o.Data.TRIMESTRE;
            titulo2 = 'Em milhares'; 

        % A��es em Tesouraria
        case 'A��es em Tesouraria'
            y2 = o.AcoesTesouraria;
            x2 = o.Data.TRIMESTRE;       
            titulo2 = 'Em milhares'; 

        % Dividendos
        case 'Dividendos'
            y2 = o.Indicador.Dividendos.Ano.y;
            x2 = o.Indicador.Dividendos.Ano.x;
            titulo2 = 'Em milhares'; 

        % Despesas por Lucro Bruto
        case 'Despesas por Lucro Bruto'
            x2 = o.Indicador.DespesasPorLucroBruto.x;
            y2 = o.Indicador.DespesasPorLucroBruto.y;       
            titulo2 = 'Em %'; 

        % Lucro antes dos Impostos
        case 'Lucro antes dos Impostos'
            x2 = o.Indicador.LucroAntesDosImpostos.x;
            y2 = o.Indicador.LucroAntesDosImpostos.y;       
            titulo2 = 'Em milhares'; 

        % Vendas Brutas
        case 'Vendas Brutas'
            x2 = o.Indicador.Vendas.x; 
            y2 = o.Indicador.Vendas.y;
            titulo2 = 'Em milhares'; 
    end

    [graph, h1, h2] = plotyy(x, y, x2, y2);
    ylabel(graph(1), titulo1);
    ylabel(graph(2), titulo2);
    xlabel(graph(1), 'Ano');
    set(h1, 'Color', 'b');
    set(h2, 'Color', 'r');
    set(h1, 'LineWidth', 2);
    set(h2, 'LineWidth', 2);
    set(graph(1), 'Ycolor', 'b');
    set(graph(2), 'Ycolor', 'r');
    legend([h1;h2], Indicador, Indicador2);
end