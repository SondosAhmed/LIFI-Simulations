%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function []= sendData(toArduino)
delete(instrfindall);
s=serial('COM11','BaudRate',9600);
flushoutput(s)
fopen(s);
flushoutput(s)
pause(2);
flushoutput(s)
fprintf(s,toArduino);
pause(2);
flushoutput(s);
fclose(s);
delete(s);
clear s;
end


%fprintf(s,'1111111111111111111');

