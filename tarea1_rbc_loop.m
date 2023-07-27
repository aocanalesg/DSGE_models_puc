close all;
clear all;
clc;

%% Loop sobre parámetros

% Se itera sobre parametro de depreciacion
psis=[0 6];

%% Matrices para almacenar resultados (order: c i k y)
h_irf=40;
endo_v=4;
loop_mod=zeros(h_irf,endo_v,length(deltas));
ss_mod=zeros(endo_v,length(deltas));
 for i=1:length(deltas)
    delta=deltas(i);
    save delta ;
    dynare rbc_param noclearall;
    loop_mod(:,:,i)=[c_e i_e k_e y_e];     
    ss_mod(:,i)=oo_.steady_state(1:4);
 end

%%
close all
% Matrices para almacenar resultados (order: c i k y)
h_irf=40;
endo_v=4;
loop_param=zeros(h_irf,endo_v,length(deltas));
ss_param=zeros(endo_v,length(deltas));
first_time = 1;             % para iniciar loop
for i=1:length(deltas)
    if first_time==1
        set_param_value('delta',deltas(i));
        dynare rbc_param2 noclearall;
        loop_param(:,:,i)=[c_e i_e k_e y_e];     
        ss_param(:,i)=oo_.dr.ys(1:4);
        first_time = 0;
    else
        set_param_value('delta',deltas(i));
        [info, oo_] = stoch_simul(M_, options_, oo_, var_list_);
        loop_param(:,:,i)=[c_e i_e k_e y_e];     
        ss_param(:,i)=oo_.dr.ys(1:4);
    end
end

%% Se comparan IRFs
close all

var_name={'Consumo';'Inversion';'Capital';'Producto'};

figure(1)
for i=1:4
    subplot(2,2,i)
    plot(1:1:40,loop_mod(:,i,2)/ss_mod(i,2),'--r');
    hold on;
    plot(1:1:40,loop_param(:,i,2)/ss_param(i,2),'o');hold off
    eval(['title(' ,' var_name{i} ', ');' ]);
    legend('$\phi$=0 - modelo', '$\phi$=0 - parametro','Interpreter','latex','Location','southwest');
end

%% Se comparan IRFs entre parámetros
close all

var_name={'Consumo';'Inversion';'Capital';'Producto'};

figure(1)
for i=1:4
    subplot(2,2,i)
    plot(1:1:40,loop_mod(:,i,2)/ss_mod(i,2),'--r');
    hold on;
    %yyaxis right
    plot(1:1:40,loop_mod(:,i,3)/ss_mod(i,3),'o');hold off
    eval(['title(' ,' var_name{i} ', ');' ]);
    legend('$\phi$=0.025 - modelo', '$\phi$=0.5 - modelo','Interpreter','latex','Location','southwest');
end

%horizon=20;
%eval(['dynare rbc_param -Dirf_horizon=',num2str(horizon)])