function [o] = fnLucroLiquido(o)

% Eduardo H. Santos
% Data: 15/03/2017
% 
%   Significado
%  -------------
%
%   LUCRO LÍQUIDO é relativo a todo a receita obtida pela empresa já
%   tirando todas as obrigações.
%
%
%   Cálculo
%  ----------
%
% (*) O Lucro Líquido (Ano) será tomado a partir da soma dos 4 balanços do
%     ano completo.
%
% (*) O Lucro Líquido (Trimestre) se preocupará apenas com os valores
%     referente àquele trimestre considerado.
% 
% (*) É interessante que o valor seja crescente.
%
%
%   Localização dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     Código    |                  Descrição                            |
% -------------------------------------------------------------------------
% | 3.11.01       | 'Atribuído a Sócios da Empresa Controladora'          |
% -------------------------------------------------------------------------

% 1.: Realiza a conta direta em relação ao referido trimestre.
LucroTrimestre           = o.Tabela3.AtribuidoASociosDaEmpresaControladora;
o.Indicador.LucroLiquido.Trimestre.x = o.Data.TRIMESTRE;
o.Indicador.LucroLiquido.Trimestre.y = LucroTrimestre;

% 2.: Faz o cálculo para o ano.
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