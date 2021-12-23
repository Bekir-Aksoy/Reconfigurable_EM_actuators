clear, close all

%% import data
data_cold = load('Joint_stiffness_cold_data.txt'); 
disp_cold = data_cold(1:end,9) - data_cold(1,9);
force_cold = -data_cold(1:end,4);

data_hot = load('Joint_stiffness_hot_data.txt');  
disp_hot = data_hot(1:end,9) - data_hot(1,9);
force_hot = -data_hot(1:end,4);

disp_cold=smoothdata(disp_cold,'gaussian',10);
force_cold=smoothdata(force_cold,'gaussian',10);
disp_hot=smoothdata(disp_hot,'gaussian',10);
force_hot=smoothdata(force_hot,'gaussian',10);

%% SET FIGURE parameters
hF1 = figure();
set(hF1,'position',[100 100 900 600])
hold on, box on, grid on
pcolor = get(gca,'colororder');
inc = 200;

plot(disp_cold(1:inc:end), force_cold(1:inc:end), 'o-','markersize',2.5,'linewidth',0.5,'Color',pcolor(6,:),'MarkerFaceColor',pcolor(6,:));
plot(disp_hot(1:inc:end), force_hot(1:inc:end), 'o-','markersize',2.5,'linewidth',0.5,'Color',pcolor(7,:),'MarkerFaceColor',pcolor(7,:));

xlabel('Displacement [mm]','fontsize',12,'FontName','Arial')
ylabel('Force [N]','fontsize',12,'FontName','Arial')
set(gca,'fontname','Arial','fontsize',12,'linewidth',0.75)
legend({'Cold state','Hot state'},'Location','best','fontname','Arial','fontsize',12)
xlim([0 2])
ylim([-0.005 0.6])