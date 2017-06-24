clear all; close all; clc;

load('CCR_BRUTO.mat');

o = CCR_BRUTO;
o = ClasseInd(o);

o.plotaIndicador('ROE','r'); 
grid on;
figure

o.plotaIndicador('Lucro L�quido (Trimestre)','r'); 
grid on;
figure

o.plotaIndicador('Lucro L�quido (Ano)','r'); 
grid on;
figure

o.plotaIndicador('�ndice de Liquidez Corrente','r'); 
grid on;
figure
% 
o.plotaIndicador('Margem Bruta','r'); 
grid on;
figure
% 
o.plotaIndicador('Margem L�quida','r'); 
grid on;
figure;

o.plotaIndicador('Margem EBIT','r'); 
figure;
clc;

o.plotaIndicador('VPA','r'); hold on;
% o.plotaIndicador('Quantidade de A��es','b'); 
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
