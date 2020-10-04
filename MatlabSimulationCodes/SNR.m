
%For the equations, kindly refer to the paper
%L. Zeng et al., "Improvement of Data Rate by using Equalization in an Indoor Visible Light
%Communication System", 2008.
%T. Komine, "Visible Light Wireless Communications and its Fundamental
%Study", 2005.
clear all; clc;
%electron charge (C)
q = 1.60E-19;
%angle of irradiance (half phi)
phi = (25*pi)/180;
%angle of incidence
psi = (15*pi)/180;
%power emitted by LED (mW)
PLED = 30;
%detector area, ARX (or photodiode active area) (cmˆ2)
ARX = 50/100;
%FOV (field of view) of detector, psi_c
psi_c = (40*pi)/180;
%distance between tx and rx (m)
H = 2.0;
%order of Lambertian emission
m = real(-log(2)/log(cos(phi)));
%Lambertian radiant intensity (or transmitter radiant intensity)
Ro = real(((m+1)/(2*pi))*cos(phi)^m);
%transmitted power, PTX
PTX = PLED*Ro;
%LOS (line of sight) propagation path channel transfer function - HLOS
if (psi>=0) && (psi<=psi_c)
HLOS = (ARX/H^2)*Ro*cos(psi);
elseif (psi>psi_c)
HLOS = 0.0;
end;
%number of LEDs per led array - NoLEDs
NoLEDs = 30;
%total power of i LEDs in the directed path - PRXLOS
PRXLOS = NoLEDs*PTX*HLOS;
%photodiode responsitivity
response = 0.4;
%noise power of ambient light
pn = 5840E-6*sqrt(5);
%data rate
Rb = 115200;
%noise bandwidth factor
I2 = 0.562;
Bn = Rb*I2;
%amplifier bandwidth
Ba = 250E5;
%amplifier noise current
iamplifier = 5E-12*Ba;
%total surface area of room - Aroom
Aroom = 5*5*2 + 5*H*2 + 5*H*2;
Floor_area = 5*5;
Wall1_area = 5*H*2;
Wall2_area = 5*H*2;
Ceiling_area = 5*5;
%average reflectivity - rho
rho = (1/Aroom)*(Floor_area*0.15 + Wall1_area*0.7 + Wall2_area*0.7 + Ceiling_area*0.8);
%the first diffused reflection of a wide-beam optical source emits an
%intensity ’Iprime’ over the whole room surface ’Aroom’.
I = rho*PRXLOS/Aroom;
Iprime = I/(1-rho);
%received diffused power ’pdiff’ with the photodiode’s receiving area ARX
pdiff = ARX*Iprime;
%At the receiver, light passes through the optical filter ’Tf’ and
%concentrator gain ’g’.
%Tf is the transmission coefficient of the optical filter.
Tf = 1.0;
%g is the concentrator gain*. The refractive index of plastic is 1.46.
%(My concentrator is a general cheapo plastic lens.
%See the list at http://interactagram.com/physics/optics/refraction/)
%*N. Kumar and N. R. Lourenco, "LED-based visible light communication
%system: a brief survey and investigation", J. Engineering and Applied
%Sciences, vol. 5, no. 4, pp. 296-307, 2010.
ri_conc = 1.46;
if (psi>=0) && (psi<=psi_c)
g = (ri_conc^2)/(sin(psi_c)^2);
elseif (psi>psi_c)
g = 0.0;
end;
%so the received power prx is
prx = (PRXLOS+pdiff)*Tf*g;
%In fact, there is also the refractive index of the lens/glass/plastic
%covering the photodiode to consider (whose value is about 1.0-1.5);
%however, it is usually ignored.
%shot noise variance - omegashot
omegashot = 2*q*response*(prx+pn)*Bn;
%amplifier noise variance - omegaamplifier
omegaamplifier = iamplifier^2*Ba;
%total noise variance - omegatotal
omegatotal = omegashot+omegaamplifier;
%signal-to-noise ratio SNR
snr = (response*prx)^2/(omegatotal);
%convert SNR unit to dB
SNRdb = 20*log10(snr);
%get radius from height H (between the transmitter and receiver) at
%irradiance angle phi
radius = H/tan(pi-pi/2-phi);
%set grid using radius
[X,Y] = meshgrid(-radius:.1:radius);
%Geometry - get hypotenuse R
R = sqrt((X).^2 + (Y).^2)./cos(pi-pi/2-phi);
%distance between each led array [m]
dist_apart = 1.5;
%translate SNR array to the graph function fx = (sin x)/x.
%Refer to http://press.princeton.edu/books/maor/chapter_10.pdf for
%more info on sin graphs.
Z = SNRdb*sin(R)./R;
figure(2)
mesh(X+dist_apart,Y,Z,'EdgeColor','black')
xlabel('Length of room [m]')
ylabel('Width of room [m]')
zlabel('SNR [db]')
%axis([-2.5 2.5 -2.5 2.5 0 1])
hold on
mesh(X,Y,Z,'EdgeColor','black')
xlabel('Length of room [m]')
ylabel('Width of room [m]')
zlabel('SNR [db]')
%axis([-2.5 2.5 -2.5 2.5 0 1])
hold on
mesh(X,Y+dist_apart,Z,'EdgeColor','black')
xlabel('Length of room [m]')
ylabel('Width of room [m]')
zlabel('SNR [db]')
%axis([-2.5 2.5 -2.5 2.5 0 1])
hold on
mesh(X+dist_apart,Y+dist_apart,Z,'EdgeColo','black')
xlabel('Length of room [m]')
ylabel('Width of room [m]')
zlabel('SNR [db]')
%axis([-2.5 2.5 -2.5 2.5 0 1])
hold on
title('Communication using White-LED: SNR 3D Plot for Room Illumination')