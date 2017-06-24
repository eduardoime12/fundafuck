function [] = criaTXT(o)
    
    %%% Nome do arquivo .txt a ser gerado.
    nomeArquivo = o.Nome;
    nomeArquivo = strcat(nomeArquivo, '.txt');
    File = fopen(nomeArquivo, 'w');
    
    Data       = -linspace(1,10,10)';
    QuantAcoes = 3*linspace(1,10,10)';
    ROA        = 2*linspace(1,10,10)';
    
    %%% Cabe�alho
    fprintf(File,'\r\n Empresa: %s \r\n', o.Nome);
    FormatoCabecalho = ' --------\r\n \r\n \r\n';
    fprintf(File,FormatoCabecalho);
   
    
    %%% Legenda
    fprintf(File, ' Legenda da tabela \r\n');
    fprintf(File, ' ----------------- \r\n\r\n');
    fprintf(File, '  Data       -- Data do balan�o.\r\n');
    fprintf(File, '  Qnt. A��es -- Quantidade de a��es dispon�veis no Mercado Secund�rio.\r\n');
    fprintf(File, '  A��es Tes. -- Quantidade de a��es em Tesouraria.\r\n');
    fprintf(File, '  ROE        -- Return On Equity.\r\n');
    fprintf(File, '\r\n\r\n');
    
    
    %%% Indicadores Fundamentalistas
    Indicadores = {'Data'; 
                   'Qnt. A��es'; 
                   'A��es Tes.';
                   'ROE';};
    PadraoEscrita = 16;              % Espa�o reservado para os caracteres 
                                     % dos indicadores na tabela a ser
                                     % gerada.
                                     
    %%% Separador da linha de cima do t�tulo da tabela.
    for i=1:max(size(Indicadores));
        for j=1:PadraoEscrita
            LinhaIndicadores = '-';
            fprintf(File,LinhaIndicadores);
        end
    end
    LinhaIndicadores = '\r\n';
    fprintf(File,LinhaIndicadores);                                     
    
    %%% Aloca��o dos Indicadores como t�tulos da tabela.
    for i=1:max(size(Indicadores));
        % Contador de caracteres.
        qntCaracteres = max(size(Indicadores{i}));
        Espaco{i} = PadraoEscrita - qntCaracteres - 1;
        x = floor(Espaco{i}/2);

        for j=1:x
            fprintf(File,' ');
        end
        fprintf(File,'%s',Indicadores{i});
        for j=1:(PadraoEscrita - qntCaracteres - x - 1)
            fprintf(File,' ');
        end
        fprintf(File,'|');
    end
    LinhaIndicadores = '\r\n';
    fprintf(File,LinhaIndicadores);
    
    %%% Separador da linha de baixo do t�tulo da tabela.
    for i=1:max(size(Indicadores));
        for j=1:PadraoEscrita
            LinhaIndicadores = '-';
            fprintf(File,LinhaIndicadores);
        end
    end
    LinhaIndicadores = '\r\n';
    fprintf(File,LinhaIndicadores);
    
    %%% Valores num�ricos dos Indicadores na tabela.
    dados = max(size(o.Data.Mes));
    espacoVazio = PadraoEscrita - 9;        % Eu vou considerar o sinal (+ ou -).
    
    % Determina��o dos espa�os vazios -- ANTES.
    if (mod(espacoVazio,2) == 1) 
       ANTES = (floor(espacoVazio/2)+1);
       DEPOIS = PadraoEscrita - 9 - (floor(espacoVazio/2)+1);
    else
       ANTES  = floor(espacoVazio/2);
       DEPOIS = (PadraoEscrita - 9 - (floor(espacoVazio/2)));
    end
    
    
    
    % Prepara��o da data no formato padr�o.
    for i=1:dados
       if(o.Data.Mes(i) < 10)
           offset  = '0';
           mes     = num2str(o.Data.Mes(i));
           ano     = num2str(o.Data.Ano(i));
           p1      = strcat(offset, mes);
           p2      = strcat(p1, '/');
           data{i} = strcat(p2, ano);
       else
           mes     = num2str(o.Data.Mes(i));
           ano     = num2str(o.Data.Ano(i));
           p1      = strcat(mes, '/');
           data{i} = strcat(p1, ano);
       end
    end
    
    
    for i=1:dados
        o.espacosVazios(File, ANTES);
        fprintf(File, '%s', data{i});    
        o.espacosVazios(File, DEPOIS);
        o.espacosVazios(File, ANTES);
        fprintf(File, '%+.3E', o.QuantAcoes(i));
        o.espacosVazios(File, DEPOIS);
        o.espacosVazios(File, ANTES);
        fprintf(File, '%+.3E', o.AcoesTesouraria(i));
        o.espacosVazios(File, DEPOIS);
        o.espacosVazios(File, ANTES);
        fprintf(File, '%+.3E', o.Indicador.ROE.y(i));
        fprintf(File, '\r\n');
    end
end