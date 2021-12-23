clear all; close all; clc

%% import MM7520 data
Data_table1 = readtable('Modulus_vs_temperature_MM7520_data.txt', 'HeaderLines', 60); %Test 1
Data1       = table2array(Data_table1);
Temperature_MM7520 = Data1(1:end,2);
Estore_MM7520      = Data1(1:end,3); 
Eloss_MM7520       = Data1(1:end,4);
TanDelta_MM7520    = Data1(1:end,6);
Emodulus_MM7520    = sqrt(Estore_MM7520.^2+Eloss_MM7520.^2);

% import MM4520 data
Data_table2 = readtable('Modulus_vs_temperature_MM4520_data.txt', 'HeaderLines', 60); %Test 1
Data2       = table2array(Data_table2);
Temperature_MM4520 = Data2(1:end,2);
Estore_MM4520      = Data2(1:end,3); 
Eloss_MM4520       = Data2(1:end,4);
TanDelta_MM4520    = Data2(1:end,6);
Emodulus_MM4520    = sqrt(Estore_MM4520.^2+Eloss_MM4520.^2);

%% SET FIGURE parameters
hF1 = figure();
set(hF1,'position',[50 50 900 600])
box on, grid on, hold on
pcolor = get(gca,'colororder');

plot(Temperature_MM7520, Emodulus_MM7520,'s-','markersize',2.5,'linewidth',0.5,'Color',pcolor(1,:),'MarkerFaceColor',pcolor(1,:));
plot(Temperature_MM4520, Emodulus_MM4520,'o-','markersize',2.5,'linewidth',0.5,'Color',pcolor(2,:),'MarkerFaceColor',pcolor(2,:));

set(gca, 'YScale', 'log')
xlim([0 120])
ylim([6 3000])

xlabel('\it Temperature [\circC]','fontsize',12,'FontName','Arial')
ylabel('\it Young''s modulus [MPa]','fontsize',12, 'FontName','Arial')
set(gca,'fontname','Arial','fontsize',12,'linewidth',0.75)
legend ({'MM7520', 'MM4520','Recipe 2 Test 1', 'Recipe 2 Test 2'},'Location','southwest', 'fontname','Arial','fontsize',10)