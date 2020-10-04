%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rb=1;
P_req_OOK=1;
for M = 1:5% bit resolutions
% *****ppm hard decision decoding***********
P_req_PPM_hard(M) =10*log10(sqrt(4/(M*2^M)));
BW_PPM(M)=2^M/M;
%*****ppm soft decision decoding************
P_req_PPM_soft(M)=10*log10(sqrt(2/(M*2^M)));
% *******************dpim*******************
P_req_DPIM(M) =10*log10(sqrt(8/(M*(2^M+1))));
BW_DPIM(M) =(2^M+1)/(2*M);
% ************************DH-PIM1********************
alpha=1;
Lavg=(2^(M-1)+2*alpha+1)/2;
P_req_DHPIM1(M) =10*log10(sqrt(9*alpha^2/(4*M*Lavg)));
BW_DHPIM1(M) = (2^ (M-1)+2*alpha+1)/(alpha*M);
% ************************DH-PIM2********************
alpha=2;
Lavg=(2^(M-1)+2*alpha+1)/2;
P_req_DHPIM2(M) =10*log10(sqrt(9*alpha^2/(4*M*Lavg)));
BW_DHPIM2(M) = (2^(M-1)+2*alpha+1)/(alpha*M);
end
duty_cycle=[10.5 0.33 0.25];
BW_OOK=1./duty_cycle;
P_req_OOK=10*log10(sqrt(duty_cycle));
figure;
plot(BW_OOK,P_req_OOK,'-kv','LineWidth',2,'MarkerSize',10);hold on
plot(BW_PPM,P_req_PPM_hard,'-rs','LineWidth',2,'MarkerSize',10);
plot(BW_PPM,P_req_PPM_soft,'-ro','LineWidth',2,'MarkerSize',10);
plot(BW_DPIM,P_req_DPIM,'-ks','LineWidth',2,'MarkerSize',10);
plot(BW_DHPIM1,P_req_DHPIM1,'-bs','LineWidth',2,'MarkerSize',10);
plot(BW_DHPIM2,P_req_DHPIM2,'-bo','LineWidth',2,'MarkerSize',10);
legend('OOK','PPM (soft)', 'PPM(hard)', 'DPIM', 'DH-PIM_1','DH-PIM_2');
ylabel('Normalized average optical power requirements');
xlabel('Normalized bandwidth requirements');
title('Optical power requirement normalized versus bandwidth requirement normalized')