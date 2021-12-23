clear all; close all; clc

%% import data 
Data_table1 = readtable('Temperature_data.csv', 'HeaderLines', 1); %data
temp_cursor1 = table2array(Data_table1(1:end,4));
temp_cursor2 = table2array(Data_table1(1:end,5));
temp_cursor3 = table2array(Data_table1(1:end,6));
time = table2array(Data_table1(1:end,3)); 
time =time-time(1); 

%% SET FIGURE parameters
hF1 = figure();
set(hF1,'position',[50 50 900 600])
box on, grid on, hold on
plotcolors = get(gca,'colororder');

plot(time, temp_cursor1,  'o-','markersize',1.50,'linewidth',0.75,'Color',plotcolors(1,:),'MarkerFaceColor',plotcolors(1,:));
plot(time, temp_cursor2,  'o-','markersize',1.50,'linewidth',0.5,'Color',plotcolors(2,:),'MarkerFaceColor',plotcolors(2,:));
plot(time, temp_cursor3,  'o-','markersize',1.50,'linewidth',0.5,'Color',plotcolors(3,:),'MarkerFaceColor',plotcolors(3,:));

ylim([25 120])
xlim([0 1450])

xlabel('Time [s]','fontsize',12,'FontName','Arial')
ylabel(' Temperature [\circC]','fontsize',12, 'FontName','Arial')
set(gca,'fontname','Arial','fontsize',12,'linewidth',0.75)
legend({'Joint #1','Joint #2','Joint #3'}, 'Location','northeast','fontname','Arial','fontsize',10,'NumColumns',3)
