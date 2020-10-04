function encodedData = bin2manchester(inputData)
%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   BIN2MANCHESTER(inputData) encodes binary data to its corresponding 
%   manchester binary sequence.
%
%   Encoding is done according to G.E. Thomas' convention 
%   ('1' = high-to-low: '01', '0' = low-to-high: '10'), assuming LSB first
%   transmission
%
%   Syntax: encodedData = BIN2MANCHESTER(inputData) 
%
%   Where:
%   inputData   =    string with binary values with the MSB at at the 
%                    left-most position (index = 1)
%   encodedData =    string with binary values which has twice the length
%                    of inputData with the MSB at the left-most position
%
%   Example: 
%       >>encodedData = bin2manchester('1100')
%       
%       encodedData =
%       01011010
%
%   Other m-files required: none
%   Subfunctions: none
%   MAT-files required: none
%
%   Author: Robert Brookhuis
%   email: r.a.brookhuis(at)gmail.com 
%   MAR 2009; Last revision: 02-Mar-2009

nBits = length(inputData); %lenght of input string (number of bits)


for i = nBits:-1:1
    if inputData(i) == '1'
        encodedData(2*i) = '0'; %preallocation not needed, index starts at max. value
        encodedData(2*i-1) = '1';
    else
        encodedData(2*i) = '1';
        encodedData(2*i-1) = '0';
    end
end
[rp, cp]=size(encodedData);
encodedData=char(reshape(encodedData',1,rp*cp)')';
%encodedData = char(n); %cast array of doubles to string
%encodedData= str2num(reshape(x',r,rp*cp));