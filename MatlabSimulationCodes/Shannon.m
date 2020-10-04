%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
p_total= 100;
h1=10;
h2=1;
f=0:0.03:1;
p1=p_total*f;
p2=p_total-p1;
%FDMA 
R1=log2(1+p1*h1);
R2=log2(1+p2*h2./(h2*p1+1));
%NOMA
R3=f.*log2(1+p1*h1./f);
R4=(1-f).*log2(1+p2*h2./(1-f));

p_total2= 100;
h12=10;
h22=0.066;
f2=0:0.03:1;
p12=p_total2*f2;
p22=p_total2-p12;
%FDMA
R12=log2(1+p12*h12);
R22=log2(1+p22*h22./(h22*p12+1));
%NOMA
R32=f2.*log2(1+p12*h12./f2);
R42=(1-f2).*log2(1+p22*h22./(1-f2));

%Plotting everything
subplot(2,1,1)
plot(R2,R1,'-*r',R4,R3,'-sb');grid
title('Shannon Spectral efficiency Between NOMA&FDMA')

xlabel('T1'); ylabel('T2');
legend({'NOMA','FDMA'},'FontSize',8);
 subplot(2,1,2)
plot(R22,R12,'-*r',R42,R32,'-sb');grid
title('With distinctive channel conditions')
xlabel('T1'); ylabel('T2');
legend({'NOMA','FDMA'},'FontSize',8);