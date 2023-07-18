close all;
clear all;
clc;

%% Resolución de modelo RBC linealizado y log-linealizado.

t=40;       % Periodos para IRFs
time=(1:1:t)';
% Se crean matrices para guardar resultados
irf_c=[(1:1:t)' zeros(t,2)];
irf_y=[(1:1:t)' zeros(t,2)];
irf_k=[(1:1:t)' zeros(t,2)];
irf_i=[(1:1:t)' zeros(t,2)];

% Se resuelve RBC linealizado.
dynare rbc.mod noclearall
irf_c(:,2)=c_e;
irf_y(:,2)=y_e;
irf_k(:,2)=k_e;
irf_i(:,2)=i_e;

ss_lev=oo_.steady_state;
% Se resualve modelo loglinealizado
dynare rbc_log.mod noclearall
irf_c(:,3)=c_e;
irf_y(:,3)=y_e;
irf_k(:,3)=k_e;
irf_i(:,3)=i_e;

%% Se comparan IRFs
close all
%plot(time,irf_c(:,2), time, irf_c(:,3))

% Se ajusta modelo en nivel por estado estacionatio
irf_mod_c=irf_c(:,2)/ss_lev(1);
irf_mod_y=irf_y(:,2)/ss_lev(4);
irf_mod_k=irf_k(:,2)/ss_lev(3);
irf_mod_i=irf_i(:,2)/ss_lev(2);

figure(1)
subplot(2,1,1)
plot(time,irf_c(:,2), time, irf_c(:,3),'o')
title('Sin ajustar');
legend('Nivel','Logaritmo');
subplot(2,1,2)
plot(time,irf_mod_c, time, irf_c(:,3),'o')
title('Ajustadas')
legend('Nivel ajustado','Logaritmo');
sgtitle('Consumo')

%%
var_name={'Consumo';'Inversión';'Capital';'Producto'};
inic={'c';'i';'k';'y'};

figure(2)
for i=1:4
    subplot(2,2,i)
    eval(['plot(time,irf_mod_',inic{i}, ', time, irf_',inic{i},'(:,3),''o'')']);
    eval(['title(' ,' var_name{i} ', ');' ]);
end


