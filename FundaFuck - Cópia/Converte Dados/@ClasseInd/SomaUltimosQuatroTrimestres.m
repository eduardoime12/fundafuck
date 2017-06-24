function [SaidaX, SaidaY] = SomaUltimosQuatroTrimestres(o, y)

% 1.: Verifica a quantidade de anos.
% -----------------------------------
Ano       = o.Data.Ano;
Mes       = o.Data.Mes;
Trimestre = o.Data.TRIMESTRE; 
n         = max(size(Ano));   % Quantos Trimestres dispon�veis?

% 2.: Realiza o somat�rio dos quatro �ltimos trimestres.
% ------------------------------------------------------
contador = 0;
if (n>=4)
    for i = 4:n
        soma     = 0;
        contador = contador + 1;
        for j = i:-1:(i-3)
            soma = soma + y(j);
        end
        SaidaX(contador) = Trimestre(i);
        SaidaY(contador) = soma;
    end
else
    SaidaX = Trimestre;
    SaidaY = y;
end
end