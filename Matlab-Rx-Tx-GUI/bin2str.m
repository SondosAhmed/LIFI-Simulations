%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function n=bin2str(bin)
rp=floor(length(bin)/7);
rez=num2str(bin(1:7*rp)')';
n=char(bin2dec(reshape(rez,7,rp)'))';
end