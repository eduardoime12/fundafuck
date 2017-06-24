function [o] = fnResultadoDeVendas(o)

% Eduardo H. Santos
% Data: 18/03/2017
%
%   Significado
%  -------------
%
%   RESULTADO DE VENDAS BRUTAS faz a mensura��o de vendas ou n�o da
%   empresa.
%
%
%   C�lculo
%  ----------        
%
%
%   Localiza��o dos itens
%  -----------------------
%
% --------------------------------------------------------------------------------------
% |     C�digo    |                               Descri��o                            |
% --------------------------------------------------------------------------------------
% |     3.01      | 'Receita de Venda de Bens e/ou Servi�os'                           |
% |     3.05      | 'Resultado Resultado Antes do Resultado Financeiro e dos Tributos' |                                   |
% --------------------------------------------------------------------------------------
ReceitaDeVendasDeBensEOUServicos   = o.Tabela3.ReceitaDeVendaDeBensEOUServicos;

% 1.: Ser� calculado tomando-se sempre os 4 �ltimos trimestres.

% 2.: C�lculo do �ndice.
o.Indicador.Vendas.y = ReceitaDeVendasDeBensEOUServicos;
o.Indicador.Vendas.x = o.Data.TRIMESTRE;

end