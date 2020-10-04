%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; clc;
r=4.5; %Circle real raduis
lifi=1000;
wifi= 120; %Wifi througput in Mbps
 
if (wifi==lifi)
    re =r - (log(4.5+( wifi/1000)));
else re= r-(log(0.1+( wifi/100))); %affected raduis by wifi througput in Mbps 
end
N=500; %Number of users
W=18;%Room width
L=18;%Room Length
xroom=[-9 9 9 -9 -9 ]; %Room dimentions in the x-axis
yroom=[9 9 -9 -9 9 ]; %Room dimentions in the y axis
% uniform Random distribution of users in the room
x=W*rand(1,N)- W/2; %Random X position of users 
y=L*rand(1,N)-L/2;  %Random Y position of users
%Circles center
x0=-4.5; y0=4.5;
x1=4.5;  y1=4.5;
x2=4.5;  y2=-4.5;
x3=-4.5; y3=-4.5;
%plot centers and legend
figure(2)
plot (x0,y0,'b*');hold on;
plot (x1,y1,'go');hold on;
plot (x2,y2,'sc','MarkerFaceColor','c');hold on;
plot (x3,y3,'k^','MarkerFaceColor',[1 1 0]);hold on;
plot (-8,0,'r.');hold on;
legend ('LIFI 1','LiFi 2','LiFi 3','LiFi 4','WiFi')
%Draw a circles
th=0:0.1:2*pi;
xp=r*cos(th); yp=r*sin(th);

plot(xp+x0,yp+y0,'m--','LineWidth',2);hold on;
plot(xp+x1,yp+y1,'m--','LineWidth',2);hold on;
plot(xp+x2,yp+y2,'m--','LineWidth',2);hold on;
plot(xp+x3,yp+y3,'m--','LineWidth',2);
hold on;
plot(xroom,yroom,'y-','LineWidth',2,'MarkerSize',20);hold on;
%grid on 
%check if the point inside the circle 
for i=1:N 
    if (x(i)-x0)^2+(y(i)-y0)^2<=re^2
        plot(x(i),y(i),'b*');
         else if (x(i)-x1)^2+(y(i)-y1)^2<=re^2
              plot(x(i),y(i),'go');
        
        else if (x(i)-x2)^2+(y(i)-y2)^2<=re^2
                plot(x(i),y(i),'sc','MarkerFaceColor','c');
           
            else if (x(i)-x3)^2+(y(i)-y3)^2<=re^2
                     plot(x(i),y(i),'k^','MarkerFaceColor',[1 1 0]);
    else
         plot(x(i),y(i),'r.');
                end
            end
             end
        
    end
end
axis equal; 
axis([-9 9 -9 9]); 
axis equal; 
title ('Users served by different AP in non-CCI Case with wifi throughput 120Mb/s');