function [o] = fnResultadoDeVendas(o)

% Eduardo H. Santos
% Data: 18/03/2017
%
%   Significado
%  -------------
%
%   RESULTADO DE VENDAS BRUTAS faz a mensuração de vendas ou não da
%   empresa.
%
%
%   Cálculo
%  ----------        
%
%
%   Localização dos itens
%  -----------------------
%
% --------------------------------------------------------------------------------------
% |     Código    |                               Descrição                            |
% --------------------------------------------------------------------------------------
% |     3.01      | 'Receita de Venda de Bens e/ou Serviços'                           |
% |     3.05      | 'Resultado Resultado Antes do Resultado Financeiro e dos Tributos' |                                   |
% --------------------------------------------------------------------------------------
ReceitaDeVendasDeBensEOUServicos   = o.Tabela3.ReceitaDeVendaDeBensEOUServicos;

% 1.: Será calculado tomando-se sempre os 4 últimos trimestres.

% 2.: Cálculo do Índice.
o.Indicador.Vendas.y = ReceitaDeVendasDeBensEOUServicos;
o.Indicador.Vendas.x = o.Data.TRIMESTRE;

end