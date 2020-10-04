%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
p_total= 3;
h1=4;
h2=1;
f=0:0.03:1;
p1=p_total*f;
p2=p_total-p1;
R1=1.55*(log2(1+p1*h1))/2+(log2(1+p1*h1));
R2=3.8*log2(1+p2*h2)./(h2*p1+1)
R3=1.45*(f.*log2(1+p1*h1./f))/1.099;
R4=1.7*(1.45*(1-f).*log2(1+p2*h2./(1-f)));

p_total2= 25;
h12=15;
h22=2.5;
f2=0:0.03:1;
p12=p_total2*f2;
p22=p_total2-p12;
R12=log2(1+p12*h12);
R22=1.3*log2(1+p22*h22./(h22*p12+1))
R32=f2.*log2(1+p12*h12./f2);
R42=0.8*(1-f2).*log2(1+p22*h22./(1-f2));
subplot(2,2,[1,3])
plot(R2,R1,'-*r',R4,R3,'-sb');grid
%title('( a )')

xlabel('T1'); ylabel('T2');
legend({'NOMA+SDMA','TDMA'},'FontSize',8);
 subplot(2,2,[2,4])
plot(R22,R12,'-*r',R42,R32,'-sb');grid
%title(' ( b )')
xlabel('T1'); ylabel('T2');
legend({'NOMA+SDMA','TDMA'},'FontSize',8);