function [o] = fnDividaLiquida(o)

% Eduardo H. Santos
% Data: 16/03/2017
% 
%   Significado
%  -------------
%
%   D�VIDA L�QUIDA � o valor total da d�vida da empresa em determinado
%   momento da hist�ria retirando algum poss�vel dinheiro que a empresa
%   tenha em Caixa e em Aplica��es Financeiroas. Ou seja, o que sobra da
%   d�vida da empresa depois de se pagar com o dinheiro de alta liquidez
%   dispon�vel.
%
%
%   C�lculo
%  ----------
%
%     D�vida L�quida = D�vida Bruta - Caixa e Equivalente de Caixa -
%                      Aplica��es Financeiras
%   
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo      |                  Descri��o                          |
% -------------------------------------------------------------------------
% |'2.01.04'        | 'Empr�stimos e Financiamentos'                      |
% |'2.02.01'        | 'Empr�stimos e Financiamentos'                      |
% |'1.01.01'        | 'Caixa e Equivalente de Caixa'                     |
% |'1.01.02'        | 'Aplica��es Financeiras'                            |
% -------------------------------------------------------------------------

% 1.: Pega os valores disponibilizados 'Trimestre a Trimestre' na tabela do
%     Fundamentos.
CurtoPrazo               = o.Tabela2.EmprestimosEFinanciamentos;
LongoPrazo               = o.Tabela2.EmprestimosEFinanciamentos2;
CaixaEEquivalenteDeCaixa = o.Tabela1.CaixaEEquivalenteDeCaixa; 
AplicacoesFinanceiras    = o.Tabela1.AplicacoesFinanceiras;

% 2.: Agrupa o resultado
o.Indicador.DividaLiquida.x = o.Data.TRIMESTRE;
o.Indicador.DividaLiquida.y = CurtoPrazo + LongoPrazo - ...
                              CaixaEEquivalenteDeCaixa - AplicacoesFinanceiras;

end