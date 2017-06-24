clear all; close all; clc;

load('CCR_BRUTO.mat');

o = CCR_BRUTO;
o = ClasseInd(o);

o.plotaIndicador('ROE','r'); 
grid on;
figure

o.plotaIndicador('Lucro Líquido (Trimestre)','r'); 
grid on;
figure

o.plotaIndicador('Lucro Líquido (Ano)','r'); 
grid on;
figure

o.plotaIndicador('Índice de Liquidez Corrente','r'); 
grid on;
figure
% 
o.plotaIndicador('Margem Bruta','r'); 
grid on;
figure
% 
o.plotaIndicador('Margem Líquida','r'); 
grid on;
figure;

o.plotaIndicador('Margem EBIT','r'); 
figure;
clc;

o.plotaIndicador('VPA','r'); hold on;
% o.plotaIndicador('Quantidade de Ações','b'); 
grid on;
figure;

o.plotaIndicador('Dividendos','r'); hold on;
grid on;
figure;

o.plotaIndicador('Lucro antes dos Impostos','r'); hold on;
grid on;
figure;

o.plotaIndicador('Vendas Brutas','r'); hold on;
grid on;
