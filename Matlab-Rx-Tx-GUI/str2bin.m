%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function a=str2bin(char)
bintext=dec2bin(double(char));
[rp,cp]=size(bintext);
%a=dec2bin(double(char));
a=num2str(reshape(bintext',cp*rp,1)');
%a=str2num(reshape(bintext',1,rp*cp)');
