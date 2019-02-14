close all 
clear all 
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Polarization distribution based on the Stoke Parameters
%   Manuel Ferrer, Job Mendoza, 2019 
%   Version 1.0
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Intensity measurements 

I=im2double(rgb2gray(imread('m1.jpg')));
Ph=im2double(rgb2gray(imread('ph.jpg')));   
Pv=im2double(rgb2gray(imread('pv.jpg')));
Pr=im2double(rgb2gray(imread('pr.jpg')));
Pl=im2double(rgb2gray(imread('pl.jpg')));
P45=im2double(rgb2gray(imread('p45.jpg')));
P135=im2double(rgb2gray(imread('p135.jpg')));


% Stokes parameter calculations 
s0=I;
s1=Ph-Pv;
s2=P45-P135;
s3=(Pr-Pl);

%Image size 
[a,b]=size(Ph);

% Displaying parameters, 
Xmin=350; 
Xmax=650;
Ymin=500;
Ymax=800;




figure(1); 
imagesc(0:a,0:b,s0)
colormap gray
title('s0')
axis([Xmin, Xmax, Ymin, Ymax])
axis square

figure(2)
imagesc(0:a,0:b,s1)
colormap gray
title('s1')
axis([Xmin, Xmax, Ymin, Ymax])
axis square

figure(3)
imagesc(0:a,0:b,s2); 
colormap gray
title('s2')
axis([Xmin, Xmax, Ymin, Ymax])
axis square

figure(4)
imagesc(0:a,0:b,s3)
colormap gray
title('s3')
axis([Xmin, Xmax, Ymin, Ymax])

%% Ellipse parameters 

% Semimajor axis length 
Emax= 5*sqrt(0.5* (s0+sqrt(s1.^2+s2.^2)));

% Semi minor axis length
Emin= 5*sqrt(0.5* (s0-sqrt(s1.^2+s2.^2)));

% Inclination fo the ellipse 
alpha= 0.5*atan2(s2,s1);

% Helicity angle 
delta= angle ((s2+1i*s3)./sqrt(s2.^2+s3.^2));

figure(5)
t=linspace(0,2*pi,150); 

% Intensity 
imagesc(0:a,0:b,s0)
set(gca,'YDir','normal')
colormap gray

%Construction of the ellipses 
hold on 
for x=350:round((400/30)):650 
    for y=500:round(400/30):800
        xp=(Emax(x,y)*cos(alpha(x,y))*cos(t)-Emin(x,y)*sin(alpha(x,y))*sin(t))+x;
        yp=Emax(x,y)*sin(alpha(x,y))*cos(t)+Emin(x,y)*cos(alpha(x,y))*sin(t)+y;
        if sin(delta(x,y))>=0 % Positive helicity - Left
            plot(xp,yp,'r','LineWidth',2)
        else                    % Negative helicity - right
            plot(xp,yp,'b','LineWidth',2)
        end
    end
end
axis([Xmin, Xmax, Ymin, Ymax])
axis square
hold off
















