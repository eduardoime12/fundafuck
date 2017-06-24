% -------------------------------------------------------------------------
% (*) Ajuste para o 4� Trimestre
% (*) No caso, eu irei verificar se existem quatro trimestres para um mesmo
%     ano. Se existir, eu tenho de fazer uma compensa��o em rela��o ao
%     �ltimo trimestre. Ou seja, o balan�o do �ltimo trimestre tem que ser
%     o resultado do �ltimo trimestre subtra�do dos tr�s primeiros
%     trimestres do ano.
data  = o.T1.data;
quant = size(data,1);
for i=1:quant
   D       = fnYYYYMMDD(data(i,:));
   ano{i}  = D(1:4);
   mes{i}  = D(5:6);
   dia{i}  = D(7:end);
end


for i=1:(quant-1)
    AnoTrabalhado = ano{i};     % ano atual.
    if(ano{i+1} == AnoTrabalhado)
       o.T5.DepreciacaoEAmortizacao(i) = o.T5.DepreciacaoEAmortizacao(i) - o.T5.DepreciacaoEAmortizacao(i+1);
    end
end