clear all; close all; clc
% cd('G:\My Drive\2. SMP + EMAs for multi-DoF soft actuators\7. Experiment and measurement -Bfield measurement')

%% import data
Data_table1 = readtable('Bfieldmeasurement_Test3.xlsx', 'HeaderLines', 1); %Test 2 r=0:5:50, and z=5:5:50 
rVect = table2array(Data_table1(:,1));
zVect = table2array(Data_table1(:,2));
BzVect = table2array(Data_table1(:,3));
BrVect = table2array(Data_table1(:,4));

%% reshape the vector data
Bz = reshape(BzVect,[31,10]);
Br = reshape(BrVect,[31,10]);
r  = reshape(rVect,[31,10]);
z  = reshape(zVect,[31,10]);

Br (1,1:end) = 0; %br =0 at the center to correct measurement error
Br(2,1:end)  = (Br(1,1:end)+Br(3,1:end))/2;
%% apphend data using symmetry 
r = [-flipud(r); r]; %symetric data
Z = [flipud(z); z]; %symetric data
Bz = [flipud(Bz); Bz]; %symetric data
Br = [-flipud(Br); Br]; %symetric data

xr = rVect*cos(pi/4);
xy = rVect*cos(pi/4);

%% calculated magnetic flux density
R = 35e-3; %in m
D = 35e-3; %in m
Br0 = 1.32; %in T

zo = 0:1e-3:50e-3; % in mm

Bzcalc = Br0/2*((D+zo)./sqrt(R^2+(D+zo).^2) - zo./sqrt(R^2+zo.^2));
delB = gradient(Bzcalc,zo);
delB2 = diff(Bzcalc)./diff(zo);

%% SET FIGURE parameters
hF1 = figure();
wfig = 16; % width in cm
hfig = 12; % height in cm
xfig = 2;
yfig = 2;
set(hF1,'position',[50 50 1000 750])
box on
grid on
hold on

%sample #1
plot(r,Bz,'o-','markersize',2.0,'linewidth',0.5, 'MarkerFaceColor',[0,0,0]);
ylim([-75 400])


xlabel('\it r [mm]','fontsize',12,'FontName','Arial')
ylabel('\it B_z [mT]','fontsize',12, 'FontName','Arial')
set(gca,'fontname','Arial','fontsize',12,'linewidth',0.75)
legend ({'z=5mm', 'z=10mm', 'z=15mm','z=20mm', 'z=25mm', 'z=30mm','z=35mm', 'z=40mm', 'z=45mm', 'z=50mm'},'Location','south', 'fontname','Arial','fontsize',10,'NumColumns',4)

set(hF1,'InvertHardcopy','on')
set(hF1,'PaperUnits','centimeters')
set(hF1,'PaperPosition',[xfig yfig wfig hfig])
% print(hF1,'-dpdf','-r600','Bfieldmeasurement_Test3_Bz')
% close all

%% SET FIGURE parameters
hF1 = figure();
wfig = 16; % width in cm
hfig = 12; % height in cm
xfig = 2;
yfig = 2;
set(hF1,'position',[50 50 1000 750])
box on
grid on
hold on

%sample #1
plot(r,Br,'o-','markersize',2.0,'linewidth',0.5, 'MarkerFaceColor',[0,0,0]);

xlabel('\it r [mm]','fontsize',12,'FontName','Arial')
ylabel('\it B_r [mT]','fontsize',12, 'FontName','Arial')
set(gca,'fontname','Arial','fontsize',12,'linewidth',0.75)
legend ({'z=5mm', 'z=10mm', 'z=15mm','z=20mm', 'z=25mm', 'z=30mm','z=35mm', 'z=40mm', 'z=45mm', 'z=50mm'},'Location','southwest', 'fontname','Arial','fontsize',10,'NumColumns',2)

set(hF1,'InvertHardcopy','on')
set(hF1,'PaperUnits','centimeters')
set(hF1,'PaperPosition',[xfig yfig wfig hfig])
% print(hF1,'-dpdf','-r600','Bfieldmeasurement_Test32_Br')
% close all

%% comparison: SET FIGURE parameters
hF1 = figure();
wfig = 16; % width in cm
hfig = 12; % height in cm
xfig = 2;
yfig = 2;
set(hF1,'position',[50 50 1000 750])
box on
grid on
hold on

plot(zo*1e3,Bzcalc*1e3,'-','markersize',2.0,'linewidth',1.5, 'MarkerFaceColor',[0,0,0]);
plot(Z(31,:),Bz(31,:),'o-','markersize',3.5,'linewidth',1.0, 'MarkerFaceColor',[1,0,0]);

xlabel('\it z [mm]','fontsize',12,'FontName','Arial')
ylabel('\it B_z [mT]','fontsize',12, 'FontName','Arial')
set(gca,'fontname','Arial','fontsize',12,'linewidth',0.75)
legend ({'Calculated', 'Measured'},'Location','northeast', 'fontname','Arial','fontsize',10,'NumColumns',1)

set(hF1,'InvertHardcopy','on')
set(hF1,'PaperUnits','centimeters')
set(hF1,'PaperPosition',[xfig yfig wfig hfig])
% print(hF1,'-dtiff','-r600','Bfieldmeasurement_Test3_Comparison')
% close all