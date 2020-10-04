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
W=7;%Room width
L=7;%Room Length
xroom=[-3.5 3.5 3.5 -3.5 -3.5 ]; %Room dimentions in the x-axis
yroom=[3.5 3.5 -3.5 -3.5 3.5 ]; %Room dimentions in the y axis
% uniform Random distribution of users in the room
x=W*rand(1,N)- W/2; %Random X position of users 
y=L*rand(1,N)-L/2;  %Random Y position of users
%Circles center
x0=0; y0=0;
%x1=1.5;  y1=1.5;
%x2=1.5;  y2=-1.5;
%x3=-1.5; y3=-1.5;
%Draw center and legend
figure(2)
plot(0,0,'bo');hold on;
plot(2,3,'r.');hold on;
legend('LiFi','WiFi')
%Draw a circles
th=0:0.1:2*pi;
xp=r*cos(th); yp=r*sin(th);

plot(xp+x0,yp+y0,'m--','LineWidth',2);hold on;
%plot(xp+x1,yp+y1,'m--','LineWidth',2);hold on;
%plot(xp+x2,yp+y2,'m--','LineWidth',2);hold on;
%plot(xp+x3,yp+y3,'m--','LineWidth',2);
hold on;
plot(xroom,yroom,'y-','LineWidth',2,'MarkerSize',20);hold on;axis equal;
%check if the point inside the circle 
for i=1:N 
    if (x(i)-x0)^2+(y(i)-y0)^2<=(r^2)/4
        plot(x(i),y(i),'bo','MarkerSize',14);
         else if (x(i)-x0)^2+(y(i)-y0)^2<=(r^2)/2
               plot(x(i),y(i),'bo','MarkerSize',10);
              else if (x(i)-x0)^2+(y(i)-y0)^2<=(r^2)
               plot(x(i),y(i),'bo','MarkerSize',6);   
    else plot(x(i),y(i),'r.');  
        
                  end
             end
    end
   
    end
 
axis equal; 

axis equal; 
title ('Distribution of SNR in LiFi cell ');