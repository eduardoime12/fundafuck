function [Saida] = fnYYYYMMDD2String(datas)
% clear all; close all; clc;
% (*) A ideia do algoritmo é pegar as datas, em STRING, e ordenar da MAIOR
%     para a MENOR.
% (*) Para fazer isso, eu primeiro irei quebrar todas as datas, em STRING,
%     para algo DIA - MES - ANO. Com isso, eu conseguirei ordenar da data
%     MAIOR para a data MENOR agrupando as variáveis da forma YYYYMMDD.
% (*) Por incrível que pareça, existe uma função no Matlab que faz isso, só
%     que disponível para a versão 2017a em diante...
% (*) Fazer a função então...

n = size(datas, 1);

% 1.: Pego a referida data (string) e a quebro em DIA, MÊS e ANO.
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
