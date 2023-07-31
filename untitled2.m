close all;
clear all;
clc;
%% Loop sobre parmetros
% Se itera sobre parametro psi
xis=[0.2 10];
%% Matrices para almacenar resultados (order: pi y r rb rdif yn ygap n)
h_irf=12;
endo_v=8;
loop_mod=zeros(h_irf,endo_v,length(xis));
ss_mod=zeros(endo_v,length(xis));
for i=1:length(xis)
xi=xis(i);
save xi;
dynare acelerador1 noclearall;
loop_mod(:,:,i)=[pi_psi y_psi r_psi rb_psi rdif_psi yn_psi ygap_psi n_psi];
ss_mod(:,i)=oo_.steady_state(1:8);
end
%%
close all
% Matrices para almacenar resultados (order: c i k y)
h_irf=12;
endo_v=8;
loop_param=zeros(h_irf,endo_v,length(xis));
ss_param=zeros(endo_v,length(xis));
first_time = 1; % para iniciar loop
for i=1:length(xis)
if first_time==1
set_param_value('xi',xis(i));
dynare acelerador2 noclearall;
loop_param(:,:,i)=[pi_psi y_psi r_psi rb_psi rdif_psi yn_psi ygap_psi n_psi];
ss_param(:,i)=oo_.dr.ys(1:8);
first_time = 0;
else
set_param_value('xi',xis(i));
[info, oo_] = stoch_simul(M_, options_, oo_, var_list_);
loop_param(:,:,i)=[pi_psi y_psi r_psi rb_psi rdif_psi yn_psi ygap_psi n_psi];
ss_param(:,i)=oo_.dr.ys(1:8);
end
end
%% Se comparan IRFs entre parmetros
close all
var_name={'Inflacion';'Producto';'R';'Rb';
'Spread de tasas';'Producto natural';'Brecha del producto';'Trabajo'};
figure(1)=figure('name', 'irf','units','inch','position',[0,0,14,13]);
for i=1:8
subplot(3,3,i)
plot(1:1:12,loop_mod(:,i,1),'--r');
hold on;
%yyaxis right
plot(1:1:12,loop_mod(:,i,2),'o-b');hold off
eval(['title(' ,' var_name{i} ', ');' ]);
legend('$\xi$=0.2', '$\xi$=10','Interpreter','latex','Location','northeast');
end
exportgraphics(figure(1),'picture2.png','Resolution',700)