function [o] = fnROE(o)

% Eduardo H. Santos
% Data: 15/03/2017
% 
%   Significado
%  -------------
%
%   ROE � um indicador financeiro PERCENTUAL que se refere � capacidade de
% uma empresa em agregar valor a ela mesma utilizando os seus pr�prios
% recursos. Isto �, quanto ela consegue crescer usando nada al�m daquilo
% que ela j� tem.
%
%
%   C�lculo
%  ----------
%                              
%                                 Lucro L�quido
%                       ROE  = --------------------
%                               Patrim�nio L�quido
% 
% (*) No caso do presente programa, o que c�lculo ser� tomado utilizando-se
%     os �ltimos 12 meses, calculados a cada trimestre. Ou seja, em
%     cada trimestre, eu irei olhar os resultados do trimestre atual e dos
%     �ltimos 3 para fechar o balan�o;
%
% (*) O Patrim�nio L�quido ser� tomado a partir do valor disponibilizado no
%     �ltimo balan�o;
%
% (*) O Lucro L�quido ser� tomado a partir da soma dos 4 �ltimos balan�os
%     disponibilizados;
%
% (*) Ap�s a obten��o do valor, multiplica-se o mesmo por 100% para obter o
%     o seu valor em '%';
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
% | 2.03          | 'Patrim�nio L�quido'                                  |
% | 3.11.01       | 'Atribu�do a S�cios da Empresa Controladora'          |
% -------------------------------------------------------------------------

% 1.: Pega os valores aos quais ser�o calculados no objeto.
LucroTrimestre    = o.Tabela3.AtribuidoASociosDaEmpresaControladora;
PatrimonioLiquido = o.Tabela2.PatrimonioLiquido;
n = max(size(o.Data.Ano));

% 2.: Obten��o do resultado dos Lucro dos 4 �ltimos trimestres.
[Trimestre, Lucro4UltimosTrimestres] = SomaUltimosQuatroTrimestres(o, LucroTrimestre);

% 3.: M�dia do patrim�nio L�quido dos 4 �ltimos trimestres.
Patrimonio4UltimosTrimestres = PatrimonioLiquido(4:end);

% 4.: Resultado da Opera��o.
ROE = Lucro4UltimosTrimestres./Patrimonio4UltimosTrimestres;

% 5.: C�lculo do ROE em %.
ROE = 100*ROE;

% 6.: Salva o indicador.
o.Indicador.ROE.x = Trimestre;
o.Indicador.ROE.y = ROE;
end