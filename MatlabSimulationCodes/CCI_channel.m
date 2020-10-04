%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; clc;
r=4.5; %Circle raduis
N=500; %Number of users
lifi=1000;
wifi= 1000; %Wifi througput in Mbps


W=16;%Room width
L=16;%Room Length
xroom=[-8 8 8 -8 -8 ]; %Room dimentions in the x-axis
yroom=[8 8 -8 -8 8 ]; %Room dimentions in the y axis
% uniform Random distribution of users in the room
x=W*rand(1,N)- W/2; %Random X position of users 
y=L*rand(1,N)-L/2;  %Random Y position of users
%Circles center
x0=-3.5; y0=3.5;
x1=3.5;  y1=3.5;
x2=3.5;  y2=-3.5;
x3=-3.5; y3=-3.5;
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
%Calculate ditances between each 2 circles
h1= sqrt((x1-x0)^2+(y1-y0)^2); %Horizantal distance between the upper 2 circles 
h2= sqrt((x3-x2)^2+(y3-y2)^2); %Horizantal distance between the lower 2 circles
v1= sqrt((x3-x0)^2+(y3-y0)^2); %Vertical distance between the first 2 circles
v2= sqrt((x2-x1)^2+(y2-y1)^2); %Vertical distance between the second 2 circles
%Calculate intersection distance in CCI case
d1=-((2*r)-h1);
d2=-((2*r)-h2);
d3=-((2*r)-v1);
d4=-((2*r)-v2);
%new centers
%x00=x0+d1; y00=y0-d3;
%x11=x1-d1; y11=y1-d4;
%x22=x2-d2; y22=y2+d4;
%x33=x3+d2; y33=y3+d3;
%check if the point inside the circle 
re=2
for i=1:N 
    if (x(i)-x0)^2+(y(i)-y0)^2<=(r+d1)^2||(x(i)-x0)^2+(y(i)-y0)^2<=(r+d3)^2
        plot(x(i),y(i),'b*');
         else if (x(i)-x1)^2+(y(i)-y1)^2<=(r+d2)^2||(x(i)-x1)^2+(y(i)-y1)^2<=(r+d4)^2
              plot(x(i),y(i),'go');
        
        else if ((x(i)-x2)^2+(y(i)-y2)^2<=(r+d2)^2||(x(i)-x2)^2+(y(i)-y2)^2<=(r+d4)^2)
                plot(x(i),y(i),'sc','MarkerFaceColor','c');
           
            else if ((x(i)-x3)^2+(y(i)-y3)^2<=(r+d1)^2||(x(i)-x3)^2+(y(i)-y3)^2<=(r+d3)^2)
                     plot(x(i),y(i),'k^','MarkerFaceColor',[1 1 0]);
    else
         plot(x(i),y(i),'r.');
                end
            end
             end
       axis([-3.5 3.5 -3.5 3.5]);  
    end
end
axis equal; 
axis([-8 8 -8 8]); 
axis equal; 
title ('Location of users served by different AP in CCI case with 1Gbps Wifi');