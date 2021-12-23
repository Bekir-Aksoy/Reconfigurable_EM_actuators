clear all; close all; clc

%% import data
Data_table = readtable('DMA_MM7520_data.txt', 'HeaderLines', 60); %Test 1
Data1      = table2array(Data_table);
Temperature = Data1(1:end,2);
Estore      = Data1(1:end,3); 
Eloss       = Data1(1:end,4);
TanDelta    = Data1(1:end,6);
Emodulus    = sqrt(Estore.^2+Eloss.^2);

%% SET FIGURE parameters
hF1 = figure();
set(hF1,'position',[50 50 900 600])
box on, grid on, hold on
pcolor = get(gca,'colororder');

yyaxis left
plot(Temperature, Estore,'o-','markersize',2.5,'linewidth',0.75,'Color',pcolor(1,:),'MarkerFaceColor',pcolor(1,:));
set(gca, 'YScale', 'log')
ylim([4 2000])
xlim([20 120])
ylabel('Storage modulus [MPa]','fontsize',12, 'FontName','Arial')

yyaxis right
plot(Temperature, Eloss,'o-','markersize',2.5,'linewidth',0.75,'Color',pcolor(2,:),'MarkerFaceColor',pcolor(2,:));
set(gca, 'YScale', 'log')
xlim([20 120])
ylim([0.5 200])

ylabel('Loss modulus ([MPa]','fontsize',12, 'FontName','Arial')
xlabel('Temperature [\circC]','fontsize',12,'FontName','Arial')
set(gca,'fontname','Arial','fontsize',12,'linewidth',0.75)

%% SET FIGURE parameters
hF2 = figure();
set(hF2,'position',[50 50 900 600])
box on, grid on, hold on

plot(Temperature, TanDelta,'o-','markersize',2.5,'linewidth',0.75,'Color',pcolor(3,:),'MarkerFaceColor',pcolor(3,:));
xlim([20 120])

ylabel('Loss factor','fontsize',12, 'FontName','Arial')
xlabel('Temperature [\circC]','fontsize',12,'FontName','Arial')
set(gca,'fontname','Arial','fontsize',12,'linewidth',0.75)