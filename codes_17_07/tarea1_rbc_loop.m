close all;
clear all;
clc;

%% Loop sobre parámetros

% Se itera sobre parametro psi
psis=[0 6];

%% Matrices para almacenar resultados (order: c i k y a w q l r)
h_irf=40;
endo_v=9;
loop_mod=zeros(h_irf,endo_v,length(psis));
ss_mod=zeros(endo_v,length(psis));
 for i=1:length(psis)
    psi=psis(i);
    save psi ;
    dynare tarea1_rbc noclearall;
    loop_mod(:,:,i)=[c_e i_e k_e y_e a_e w_e q_e l_e r_e];     
    ss_mod(:,i)=oo_.steady_state(1:9);
 end

%%
close all
% Matrices para almacenar resultados (order: c i k y)
h_irf=40;
endo_v=9;
loop_param=zeros(h_irf,endo_v,length(psis));
ss_param=zeros(endo_v,length(psis));
first_time = 1;             % para iniciar loop
for i=1:length(psis)
    if first_time==1
        set_param_value('psi',psis(i));
        dynare tarea1_rbc2 noclearall;
        loop_param(:,:,i)=[c_e i_e k_e y_e a_e w_e q_e l_e r_e];     
        ss_param(:,i)=oo_.dr.ys(1:9);
        first_time = 0;
    else
        set_param_value('psi',psis(i));
        [info, oo_] = stoch_simul(M_, options_, oo_, var_list_);
        loop_param(:,:,i)=[c_e i_e k_e y_e a_e w_e q_e l_e r_e];     
        ss_param(:,i)=oo_.dr.ys(1:9);
    end
end


%% Se comparan IRFs entre parámetros
close all

var_name={'Consumo';'Inversion';'Capital';'Producto'; 'Productividad';'Salario';'Ratio';'Trabajo';'Retorno_capital'};

figure(1)
for i=1:9
    subplot(3,3,i)
    plot(1:1:40,loop_mod(:,i,1),'--r');
    hold on;
    %yyaxis right
    plot(1:1:40,loop_mod(:,i,2),'o');hold off
    eval(['title(' ,' var_name{i} ', ');' ]);
    legend('$\psi$=6 - modelo', '$\phi$=0.5 - modelo','Interpreter','latex','Location','southwest');
end

%horizon=20;
%eval(['dynare rbc_param -Dirf_horizon=',num2str(horizon)])
keyboard
%% Se comparan IRFs
close all

var_name={'Consumo';'Inversion';'Capital';'Producto'; 'Productividad';'Salario';'Ratio';'Trabajo';'Retorno_capital'};

figure(1)
for i=1:9
    subplot(3,3,i)
    plot(1:1:40,loop_mod(:,i,1)/ss_mod(i,1),'--r');
    hold on;
    plot(1:1:40,loop_param(:,i,2)/ss_param(i,2),'o');hold off
    eval(['title(' ,' var_name{i} ', ');' ]);
    legend('$\phi$=0 - modelo', '$\phi$=0 - parametro','Interpreter','latex','Location','southwest');
end
