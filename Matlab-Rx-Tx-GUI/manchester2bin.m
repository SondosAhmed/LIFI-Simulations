function [ bin, warn] = manchester2bin( man_str )
%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   MANCHESTER2Bin(inputData) decodes manchester data to its corresponding 
%    binary sequence.
%
%   Example: 
%       >>bin = manchester2bin('01011010')
%       
%       bin =
%       1100
%
%   Other m-files required: none
%   Subfunctions: none
%   MAT-files required: none
%
%   Author: James Robert Marriott
%   email: jamesrobertmarriott@gmail.com 
%   July 2014; Last revision: 10-July-2014

    [~, bitlenth ] = size(man_str);
    
    
    ref = 0;
    
    
    
    for jj = 1:(bitlenth/2)
        
        if mod(bitlenth,2) == 0
            
            oldref = ref+1;
            ref = (2*jj);
            bitman = man_str(oldref:ref)  ;  

            if  bitman == '10';
                bitbin{jj} = '1';
            elseif bitman == '01';
                    bitbin{jj} = '0'    ;        
            else
                bitbin{jj} = '0';
                warn = 1;
                
            end
            
        else 
            error('invalid Manchester Code')
        end
  
    end

    bin = strcat(bitbin{1:bitlenth/2});
    
end
