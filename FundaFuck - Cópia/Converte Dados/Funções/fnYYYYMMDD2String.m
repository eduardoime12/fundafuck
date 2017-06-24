function [Saida] = fnYYYYMMDD2String(datas)
% clear all; close all; clc;
% (*) A ideia do algoritmo � pegar as datas, em STRING, e ordenar da MAIOR
%     para a MENOR.
% (*) Para fazer isso, eu primeiro irei quebrar todas as datas, em STRING,
%     para algo DIA - MES - ANO. Com isso, eu conseguirei ordenar da data
%     MAIOR para a data MENOR agrupando as vari�veis da forma YYYYMMDD.
% (*) Por incr�vel que pare�a, existe uma fun��o no Matlab que faz isso, s�
%     que dispon�vel para a vers�o 2017a em diante...
% (*) Fazer a fun��o ent�o...

n = size(datas, 1);

% 1.: Pego a referida data (string) e a quebro em DIA, M�S e ANO.
Saida = [];
for i=1:n
    D    = datas(i,:);
    ano  = D(1:4);
    mes  = D(5:6);
    dia  = D(7:end);
    
    MontaData = strcat(dia,'/');
    MontaData = strcat(MontaData, mes);
    MontaData = strcat(MontaData, '/');
    MontaData = strcat(MontaData, ano);
    
    Saida = [Saida; MontaData];
end

end
