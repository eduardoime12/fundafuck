function [o] = fnDividendos(o)

% Eduardo H. Santos
% Data: 16/03/2017
% 
%   Significado
%  -------------
%
%   DIVIDENDOS é o quanto a empresa retorna aos acionistas a partir dos
%   lucros obtidos no período. Aqui está sendo considerado tanto o 'Juros
%   Sobre o Capital Próprio' (o qual existe a incidência de Imposto) bem
%   como o 'dividendos' (sem impostos).
%
%
%   Cálculo
%  ----------
%
%
%   Localização dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     Código      |                  Descrição                          |
% -------------------------------------------------------------------------
% |'2.01.05.02.01'  | Dividendos e JCP a pagar'                           |
% -------------------------------------------------------------------------

% 1.: Realiza a conta direta em relação ao referido trimestre.
Dividendos           = o.Tabela2.DividendosEJCPAPagar;

% 2.: Faz o cálculo para o ano.
[SaidaX, SaidaY] = SomaAno(o, Dividendos);
[flag, SaidaX2, SaidaY2] = SomaAcumuladaAnoIncompleto(o, Dividendos);
if (flag == 1)    
    o.Indicador.Dividendos.Ano.x  = [SaidaX SaidaX2];
    o.Indicador.Dividendos.Ano.y  = [SaidaY SaidaY2];
else
    o.Indicador.Dividendos.Ano.x  = SaidaX;
    o.Indicador.Dividendos.Ano.y  = SaidaY;
end
end