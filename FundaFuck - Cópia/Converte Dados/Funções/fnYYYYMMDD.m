function [MontaData] = fnYYYYMMDD(data)
% (*) A ideia do algoritmo � pegar as datas, em STRING, e ordenar da MAIOR
%     para a MENOR.
% (*) Para fazer isso, eu primeiro irei quebrar todas as datas, em STRING,
%     para algo DIA - MES - ANO. Com isso, eu conseguirei ordenar da data
%     MAIOR para a data MENOR agrupando as vari�veis da forma YYYYMMDD.
% (*) Por incr�vel que pare�a, existe uma fun��o no Matlab que faz isso, s�
%     que dispon�vel para a vers�o 2017a em diante...
% (*) Fazer a fun��o ent�o...

% 1.: Pego a referida data (string) e a quebro em DIA, M�S e ANO.
DataQuebrada = strsplit(data, '/'); 

% 2.: Concateno a string no formato YYYYMMDD
MontaData = strcat(DataQuebrada{3}, DataQuebrada{2});
MontaData = strcat(MontaData, DataQuebrada{1});
end
