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

%ploting the centers and legend
figure(2)
plot(x0,y0,'r*','MarkerSize',4);hold on;
  plot(x1,y1,'go','MarkerSize',4);hold on;
  plot(-7.5,7.5,'b.','MarkerSize',4);hold on;

  legend('LiFi Lamda 1','Lifi Lamda 2','WiFi')
%Draw a circles
th=0:0.1:2*pi;
xp=r*cos(th); yp=r*sin(th);
figure(2)
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
%for i=1:N 
%   if (x(i)-x0)^2+(y(i)-y0)^2<=(r+d1)^2||(x(i)-x0)^2+(y(i)-y0)^2<=(r+d3)^2
 %       plot(x(i),y(i),'b*');
  %       else if (x(i)-x1)^2+(y(i)-y1)^2<=(r+d2)^2||(x(i)-x1)^2+(y(i)-y1)^2<=(r+d4)^2
   %           plot(x(i),y(i),'go');
        
    %    else if ((x(i)-x2)^2+(y(i)-y2)^2<=(r+d2)^2||(x(i)-x2)^2+(y(i)-y2)^2<=(r+d4)^2)
     %           plot(x(i),y(i),'sc','MarkerFaceColor','c');
           
      %      else if ((x(i)-x3)^2+(y(i)-y3)^2<=(r+d1)^2||(x(i)-x3)^2+(y(i)-y3)^2<=(r+d3)^2)
       %              plot(x(i),y(i),'k^','MarkerFaceColor',[1 1 0]);
    %else
     %    plot(x(i),y(i),'r.');
      %          end
       %     end
        %     end
       %axis([-3.5 3.5 -3.5 3.5]);  
    %end
%end
%axis equal; 
%axis([-8 8 -8 8]); 
%Draw squares
s1x=[0 0 -6.5 -6.5 0];
s1y=[0 6.5 6.5 0 0];
s2x=[0 0 6.5 6.5 0];
s2y=[0 6.5 6.5 0 0];
s3x=[0 0 6.5 6.5 0];
s3y=[-6.5 0 0 -6.5 -6.5];
s4x=[0 0 -6.5 -6.5 0];
s4y=[-6.5 0 0 -6.5 -6.5];
s5x=[-6.5 6.5 6.5 -6.5 -6.5];
s5y=[6.5 6.5 -6.5 -6.5 6.5];

in1=inpolygon(x,y,s1x,s1y);
in2=inpolygon(x,y,s2x,s2y);
in3=inpolygon(x,y,s3x,s3y);
in4=inpolygon(x,y,s4x,s4y);
in5=inpolygon(x,y,s5x,s5y);
plot(x(in1),y(in1),'r*','MarkerSize',4)

      plot(x(in2),y(in2),'go','MarkerSize',4)
       plot(x(~in5),y(~in5),'b.','MarkerSize',4)
      plot(x(in3),y(in3),'r*','MarkerSize',4)
      plot(x(in4),y(in4),'go','MarkerSize',4)
      hold on
     
     %in1=inpolygon(x(i),y(i),s1x,s1y);
      
      

axis equal; 
   
axis([-8 8 -8 8]); 
%legend('','','',)
plot (s1x,s1y,'k-','LineWidth',2);
hold on;

plot (s2x,s2y,'k-','LineWidth',2);hold on;
plot (s3x,s3y,'k-','LineWidth',2);hold on;
plot (s4x,s4y,'k-','LineWidth',2);hold on;
axis equal; 

plot(xp+x0,yp+y0,'m--','LineWidth',2);hold on;
plot(xp+x1,yp+y1,'m--','LineWidth',2);hold on;
plot(xp+x2,yp+y2,'m--','LineWidth',2);hold on;
plot(xp+x3,yp+y3,'m--','LineWidth',2);
hold on;
plot(xroom,yroom,'y-','LineWidth',2,'MarkerSize',20);hold on;
title ('Users served by different APs with frequancy reuse techniques');