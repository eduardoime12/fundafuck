% clear all; close all; clc;

function [Vetor] = fnOrdenaDatas(V)
% % Datas
% a1 = '30/09/2016';
% a2 = '30/06/2016';
% a3 = '31/03/2016';
% 
% % Converte para o número comparativo
% a1 = fnYYYYMMDD(a1);
% a2 = fnYYYYMMDD(a2);
% a3 = fnYYYYMMDD(a3);
% 
% % Agrupa as datas todas juntas e ordena na ordem DECRESCENTE;
% V = [a2; a3; a1];
V = str2num(V);
V = sort(V, 'descend');

% Converte as datas em STRING novamente.
Vetor = num2str(V);
end