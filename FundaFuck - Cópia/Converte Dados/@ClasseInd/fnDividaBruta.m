function [o] = fnDividaBruta(o)

% Eduardo H. Santos
% Data: 16/03/2017
% 
%   Significado
%  -------------
%
%   D�VIDA BRUTA � o valor total da d�vida da empresa em determinado
%   momento da hist�ria. Ou seja, � o valor total devido pela empresa em um
%   determinado instante de tempo.
%
%
%   C�lculo
%  ----------
%
%     D�vida Total = Empr�stimos e Financiamentos + Empr�stimos e Financiamentos
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
% -------------------------------------------------------------------------


% 1.: Pega os valores disponibilizados 'Trimestre a Trimestre' na tabela do
%     Fundamentos.
CurtoPrazo           = o.Tabela2.EmprestimosEFinanciamentos;
LongoPrazo           = o.Tabela2.EmprestimosEFinanciamentos2;

% 2.: Agrupa o resultado
o.Indicador.DividaBruta.x = o.Data.TRIMESTRE;
o.Indicador.DividaBruta.y = CurtoPrazo + LongoPrazo;

end