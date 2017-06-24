function [o] = fnLucroLiquido(o)

% Eduardo H. Santos
% Data: 15/03/2017
% 
%   Significado
%  -------------
%
%   LUCRO L�QUIDO � relativo a todo a receita obtida pela empresa j�
%   tirando todas as obriga��es.
%
%
%   C�lculo
%  ----------
%
% (*) O Lucro L�quido (Ano) ser� tomado a partir da soma dos 4 balan�os do
%     ano completo.
%
% (*) O Lucro L�quido (Trimestre) se preocupar� apenas com os valores
%     referente �quele trimestre considerado.
% 
% (*) � interessante que o valor seja crescente.
%
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo    |                  Descri��o                            |
% -------------------------------------------------------------------------
% | 3.11.01       | 'Atribu�do a S�cios da Empresa Controladora'          |
% -------------------------------------------------------------------------

% 1.: Realiza a conta direta em rela��o ao referido trimestre.
LucroTrimestre           = o.Tabela3.AtribuidoASociosDaEmpresaControladora;
o.Indicador.LucroLiquido.Trimestre.x = o.Data.TRIMESTRE;
o.Indicador.LucroLiquido.Trimestre.y = LucroTrimestre;

% 2.: Faz o c�lculo para o ano.
[SaidaX, SaidaY] = SomaAno(o, LucroTrimestre);
[flag, SaidaX2, SaidaY2] = SomaAcumuladaAnoIncompleto(o, LucroTrimestre);
if (flag == 1)    
    o.Indicador.LucroLiquido.Ano.x  = [SaidaX SaidaX2];
    o.Indicador.LucroLiquido.Ano.y  = [SaidaY SaidaY2];
else
    o.Indicador.LucroLiquido.Ano.x  = SaidaX;
    o.Indicador.LucroLiquido.Ano.y  = SaidaY;
end
end