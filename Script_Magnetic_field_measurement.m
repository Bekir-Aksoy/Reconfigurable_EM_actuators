clear all; close all; clc

%% import data
Data_table1 = readtable('Magnetic_field_measurement_data.xlsx', 'HeaderLines', 1); % data
rVect = table2array(Data_table1(:,1));
zVect = table2array(Data_table1(:,2));
BzVect = table2array(Data_table1(:,3));
BrVect = table2array(Data_table1(:,4));

%% reshape the vector data
Bz = reshape(BzVect,[31,10]);
Br = reshape(BrVect,[31,10]);
r  = reshape(rVect,[31,10]);
z  = reshape(zVect,[31,10]);

Br(1,1:end) = 0; %br =0 at the center to correct measurement error
Br(2,1:end)  = (Br(1,1:end)+Br(3,1:end))/2;
%% apphend data using symmetry 
r = [-flipud(r); r]; %symetric data
Z = [flipud(z); z]; %symetric data
Bz = [flipud(Bz); Bz]; %symetric data
Br = [-flipud(Br); Br]; %symetric data

xr = rVect*cos(pi/4);
xy = rVect*cos(pi/4);

%% SET FIGURE parameters
hF1 = figure();
set(hF1,'position',[50 50 900 600])
box on, grid on, hold on

plot(r,Bz,'o-','markersize',2.0,'linewidth',0.5, 'MarkerFaceColor',[0,0,0]);
ylim([-75 400])

xlabel('\it r [mm]','fontsize',12,'FontName','Arial')
ylabel('\it B_z [mT]','fontsize',12, 'FontName','Arial')
set(gca,'fontname','Arial','fontsize',12,'linewidth',0.75)
legend ({'z=5mm', 'z=10mm', 'z=15mm','z=20mm', 'z=25mm', 'z=30mm','z=35mm', 'z=40mm', 'z=45mm', 'z=50mm'},'Location','south', 'fontname','Arial','fontsize',10,'NumColumns',4)

%% SET FIGURE parameters
hF2 = figure();
set(hF2,'position',[50 50 900 600])
box on, grid on, hold on

plot(r,Br,'o-','markersize',2.0,'linewidth',0.5, 'MarkerFaceColor',[0,0,0]);

xlabel('\it r [mm]','fontsize',12,'FontName','Arial')
ylabel('\it B_r [mT]','fontsize',12, 'FontName','Arial')
set(gca,'fontname','Arial','fontsize',12,'linewidth',0.75)
legend ({'z=5mm', 'z=10mm', 'z=15mm','z=20mm', 'z=25mm', 'z=30mm','z=35mm', 'z=40mm', 'z=45mm', 'z=50mm'},'Location','southwest', 'fontname','Arial','fontsize',10,'NumColumns',2)
