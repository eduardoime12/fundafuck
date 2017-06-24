function [o] = fnDividaBruta(o)

% Eduardo H. Santos
% Data: 16/03/2017
% 
%   Significado
%  -------------
%
%   DÍVIDA BRUTA é o valor total da dívida da empresa em determinado
%   momento da história. Ou seja, é o valor total devido pela empresa em um
%   determinado instante de tempo.
%
%
%   Cálculo
%  ----------
%
%     Dívida Total = Empréstimos e Financiamentos + Empréstimos e Financiamentos
%   
%
%   Localização dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     Código      |                  Descrição                          |
% -------------------------------------------------------------------------
% |'2.01.04'        | 'Empréstimos e Financiamentos'                      |
% |'2.02.01'        | 'Empréstimos e Financiamentos'                      |
% -------------------------------------------------------------------------


% 1.: Pega os valores disponibilizados 'Trimestre a Trimestre' na tabela do
%     Fundamentos.
CurtoPrazo           = o.Tabela2.EmprestimosEFinanciamentos;
LongoPrazo           = o.Tabela2.EmprestimosEFinanciamentos2;

% 2.: Agrupa o resultado
o.Indicador.DividaBruta.x = o.Data.TRIMESTRE;
o.Indicador.DividaBruta.y = CurtoPrazo + LongoPrazo;

end