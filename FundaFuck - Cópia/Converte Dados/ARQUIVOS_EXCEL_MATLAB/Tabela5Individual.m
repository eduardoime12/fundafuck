% 2.:  SEGUNDA TABELA
%     -----------------
% 
%  (*) A parte de interesse aqui diz respeito � tabela intitulada
%     'DF Ind. - Ativo' do arquivo baixado do programa Empresa.net
T5.texto  = {'Deprecia��o e Amortiza��o'};        
T5.numero = {'6.01.01.04';}; 
         
texto1 = 'Deprecia';     % de Deprecia��o.
texto2 = 'deprecia';

n = size(file.texto.DFIndFluxoDeCaixa, 1);
for i = 1:n
    TEXTO = file.texto.DFIndFluxoDeCaixa(i,2);
    TEXTO = char(TEXTO);
    k1 = strfind(TEXTO, texto1);
    k2 = strfind(TEXTO, texto2);
    if (~isempty(k1)|| ~isempty(k2))
%         X = ['Tem um cara na posi��o ', i];
%         disp(X);
        T5.DepreciacaoEAmortizacao = file.dado.DFIndFluxoDeCaixa(i-2, 1);
    else
%         disp('N�o tem ningu�m, brother');   
    end
end