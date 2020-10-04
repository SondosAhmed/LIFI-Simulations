%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; close all; clc;
r=2; %Circle raduis
N=500; %Number of users
%%%%%%%%%%%%%
lifi=1000;
wifi= 120; %Wifi througput in Mbps
 
if (wifi==lifi)
    re =r - (log(1+( wifi/1000)));
else re= r-(log( wifi/100)); %affected raduis by wifi througput in Mbps 
end
%%%%%%%%%%%%%%%
W=7;%Room width
L=7;%Room Length
xroom=[-3.5 3.5 3.5 -3.5 -3.5 ]; %Room dimentions in the x-axis
yroom=[3.5 3.5 -3.5 -3.5 3.5 ]; %Room dimentions in the y axis
% uniform Random distribution of users in the room
x=W*rand(1,N)- W/2; %Random X position of users 
y=L*rand(1,N)-L/2;  %Random Y position of users
%Circles center
x0=-1.5; y0=0;
x1=1.5;  y1=0;
%plot centers and legend
figure(2)
plot (x0,y0,'bo');hold on;
plot (x1,y1,'go');hold on;

plot (0,0,'r.');hold on;
legend ('LIFI 1','LiFi 2','WiFi')

%x2=1.5;  y2=-1.5;
%x3=-1.5; y3=-1.5;

%Draw a circles
th=0:0.1:2*pi;
xp=r*cos(th); yp=r*sin(th);

plot(xp+x0,yp+y0,'m--','LineWidth',2);hold on;
plot(xp+x1,yp+y1,'m--','LineWidth',2);hold on;
%plot(xp+x2,yp+y2,'m--','LineWidth',2);hold on;
%plot(xp+x3,yp+y3,'m--','LineWidth',2);
hold on;
plot(xroom,yroom,'y-','LineWidth',2,'MarkerSize',20);hold on;axis equal;
%Calculate ditances between each 2 circles
h1= sqrt((x1-x0)^2+(y1-y0)^2) %Horizantal distance between the upper 2 circles 
%h2= sqrt((x3-x2)^2+(y3-y2)^2); %Horizantal distance between the lower 2 circles
%v1= sqrt((x3-x0)^2+(y3-y0)^2); %Vertical distance between the first 2 circles
%v2= sqrt((x2-x1)^2+(y2-y1)^2); %Vertical distance between the second 2 circles
%Calculate intersection distance in CCI case


d1=(2*re)-h1;
%re=(r-d1);
%new centers
x00=x0-d1; y0=0;
x11=x1+d1; y1=0;
%check if the point inside the circle 
for i=1:N 
    if (x(i)-x0)^2+(y(i)-y0)^2<=(re^2) && (x(i)-x00)^2+(y(i)-y0)^2<=(re^2)
        plot(x(i),y(i),'bo');
         else if (x(i)-x1)^2+(y(i)-y1)^2<=(re^2)&&(x(i)-x11)^2+(y(i)-y1)^2<=(re^2)
               plot(x(i),y(i),'go');
               
    else plot(x(i),y(i),'r.');  
        
                  end
             end
    end
   
   
 
axis equal; 
%axis([-4 4 -4 4]); 
axis equal; 
title ('Distribution of users in CCI channel case');