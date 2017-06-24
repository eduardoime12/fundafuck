function [MontaData] = fnYYYYMMDD(data)
% (*) A ideia do algoritmo é pegar as datas, em STRING, e ordenar da MAIOR
%     para a MENOR.
% (*) Para fazer isso, eu primeiro irei quebrar todas as datas, em STRING,
%     para algo DIA - MES - ANO. Com isso, eu conseguirei ordenar da data
%     MAIOR para a data MENOR agrupando as variáveis da forma YYYYMMDD.
% (*) Por incrível que pareça, existe uma função no Matlab que faz isso, só
%     que disponível para a versão 2017a em diante...
% (*) Fazer a função então...

% 1.: Pego a referida data (string) e a quebro em DIA, MÊS e ANO.
DataQuebrada = strsplit(data, '/'); 

% 2.: Concateno a string no formato YYYYMMDD
MontaData = strcat(DataQuebrada{3}, DataQuebrada{2});
MontaData = strcat(MontaData, DataQuebrada{1});
end
