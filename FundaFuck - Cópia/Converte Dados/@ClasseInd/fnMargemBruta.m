function [o] = fnMargemBruta(o)

% Eduardo H. Santos
% Data: 15/03/2017
%
%   Significado
%  -------------
%
%   MARGEM BRUTA representa quanto � empresa obt�m de retorno das vendas,
%   retirando os custos das mercadorias venvidas e servi�os prestados. A
%   margem bruta representa quanto sobra ap�s considerar estes custos.
%
%
%   C�lculo
%  ----------        
%
%                                 Receita Bruta
%    Margem Bruta = ---------------------------------------- x 100%
%                     Receita de Venda de Bens e/ou Servi�os
%
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo    |                  Descri��o                            |
% -------------------------------------------------------------------------
% | 3.01          | 'Receita de Venda de Bens e/ou Servi�os'              |
% | 3.03          | 'Resultado Bruto'                                     |
% -------------------------------------------------------------------------
ResultadoBruto                       = o.Tabela3.ResultadoBruto;
ReceitaDeVendasDeBensEOUServicos     = o.Tabela3.ReceitaDeVendaDeBensEOUServicos;

% 1.: C�lculo do �ndice.
o.Indicador.MargemBruta.y = 100*(ResultadoBruto./ReceitaDeVendasDeBensEOUServicos);
o.Indicador.MargemBruta.x = o.Data.TRIMESTRE;

end