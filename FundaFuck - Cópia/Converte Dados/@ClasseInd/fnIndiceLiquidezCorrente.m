function [o] = fnIndiceLiquidezCorrente(o)

% Eduardo H. Santos
% Data: 15/03/2017
%
%   Significado
%  -------------
%
%   �NDICE DE LIQUIDEZ CORRENTE toma a rela��o entre as receitas de curto
%   prazo da empresa (contas de caixa + bancos + estoques + clientes a
%   receber) e as d�vidas de curto prazo (empr�stimos, financiamentos,
%   impostos e fornecedores a pagar).
%
%
%   C�lculo
%  ----------        
% 
%                                  Ativo Circulante  
%     Indice Liquidez Corrente = --------------------
%                                 Passivo Circulante
%  
% (*) O Ativo Circulante ser� tomado trimestre a trimestre (pois ao
%     fechamento do balan�o, o ativo circulante � tomado no prazo
%     olhando-se um ano � frente).
%
% (*) Mesma considera��o dever� ser realizada para o Passivo Circulante
%
% (*) � interessante que este valor seja superior a 1.
% 
% (*) Estou utilizando a refer�ncia do site FUNDAMENTUS.
%
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo    |                  Descri��o                            |
% -------------------------------------------------------------------------
% | 1.01          | 'Ativo Circulante'                                    |
% | 2.01          | 'Passivo Circulante'                                  |
% -------------------------------------------------------------------------

AtivoCirculante   = o.Tabela1.AtivoCirculante;
PassivoCirculante = o.Tabela2.PassivoCirculante;

% 1.: C�lculo do �ndice.
o.Indicador.IndiceLiquidezCorrente.y = AtivoCirculante./PassivoCirculante;
o.Indicador.IndiceLiquidezCorrente.x = o.Data.TRIMESTRE;

end