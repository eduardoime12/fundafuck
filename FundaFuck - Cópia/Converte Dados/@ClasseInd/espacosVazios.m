function [o] = espacosVazios(o, varargin)
    
File  = varargin{1};
Quant = varargin{2};
   
for i = 1:Quant
   fprintf(File, ' ');
end

end