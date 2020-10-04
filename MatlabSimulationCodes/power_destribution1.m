%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
theta = 70;% you Can change it and see the difference
% semi-angle at half power
ml=-log10(2)/log10(cosd(theta));
%Lambertian order of emission
P_LED=20;
%transmitted optical power by individual LED
nLED=60;
% number of LED array nLED*nLED
P_total=nLED*nLED*P_LED;
%Total transmitted power
Adet=10^ - 4;
%detector physical area of a PD
Ts=1;
%gain of an optical filter; ignore if no filter is used
index=1.5;
%refractive index of a lens at a PD; ignore if no lens is used
FOV=70;
%FOV of a receiver
G_Con=(index^2)/(sind(FOV).^2);
%gain of an optical concentrator; ignore if no lens is used
%%
lx=5; ly=5; lz=3;
% room dimension in meter
h=2.15;
%the distance between source and receiver plane
[XT,YT]=meshgrid([-lx/4 lx/4],[-ly/4 ly/4]);
% position of LED; it is assumed all LEDs are located at samepoint for
% faster simulation
% for one LED simulation located at the central of the room,use XT=0 and YT=0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nx=lx*5; Ny=ly*5;
% number of grid in the receiver plane
x=linspace(-lx/2,lx/2,Nx);
y=linspace(-ly/2,ly/2,Ny);
[XR,YR]=meshgrid(x,y);
D1=sqrt((XR-XT(1,1)).^2+(YR-YT(1,1)).^2+h^2);
% distance vector from source 1
cosphi_A1=h./D1;
% angle vector
receiver_angle=acosd(cosphi_A1);
% alternative methods to calculate angle, more accurate if the angle are
% negatives
% nr=[0 0 1];
% RT=[1.25 1.25]; % transmitter location
% for r=1:length(x)
% for c=1:length(y)
%
% angleA12=atan(sqrt((x(r)?1.25).^2+(y(c)?1.25).^2)./h);
% costheta(r,c)=cos(angleA12);
% end
% end
%
%%
% D2=fliplr(D1);
% % due to symmetry
% D3=flipud(D1);
% D4=fliplr(D3);
H_A1=(ml+1)*Adet.*cosphi_A1.^(ml+1)./(2*pi.*D1.^2);
% channel DC gain for source 1
P_rec_A1=P_total.*H_A1.*Ts.*G_Con;
% received power from source 1;
P_rec_A1(find(abs(receiver_angle)>FOV))=0;
% if the anlge of arrival is greater than FOV, no current isgenerated at
% the photodiode.
P_rec_A2=fliplr(P_rec_A1);
% received power from source 2, due to symmetry no need separate
% calculations
P_rec_A3=flipud(P_rec_A1);
P_rec_A4=fliplr(P_rec_A3);
P_rec_total=P_rec_A1+P_rec_A2+P_rec_A3+P_rec_A4;
P_rec_dBm=10*log10(P_rec_total);
%%
opengl('save','software')
surfc(x,y,P_rec_dBm);
% contour(x,y,P_rec_dBm);hold on
% mesh(x,y,P_rec_dBm);
xlabel('x(m)'); ylabel('y(m)');zlabel('Received power (dBm)'); 
title ('Optical power distribution of LOS four transmitter for typical room')