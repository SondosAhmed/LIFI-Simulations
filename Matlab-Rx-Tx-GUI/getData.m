%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function a= getData()

r=serial('COM6','BaudRate',9600);
fopen(r);
pause(2);
a=fscanf(r);
pause(2);
fclose(r);
delete(r);
clear r;
end
