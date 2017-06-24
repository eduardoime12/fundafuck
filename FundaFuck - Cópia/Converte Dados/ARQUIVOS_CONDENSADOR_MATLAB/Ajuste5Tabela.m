% -------------------------------------------------------------------------
% (*) Ajuste para o 4º Trimestre
% (*) No caso, eu irei verificar se existem quatro trimestres para um mesmo
%     ano. Se existir, eu tenho de fazer uma compensação em relação ao
%     último trimestre. Ou seja, o balanço do último trimestre tem que ser
%     o resultado do último trimestre subtraído dos três primeiros
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