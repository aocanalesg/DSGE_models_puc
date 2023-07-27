%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'tarea1_rbc2';
M_.dynare_version = '5.4';
oo_.dynare_version = '5.4';
options_.dynare_version = '5.4';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'e'};
M_.exo_names_tex(1) = {'e'};
M_.exo_names_long(1) = {'e'};
M_.endo_names = cell(9,1);
M_.endo_names_tex = cell(9,1);
M_.endo_names_long = cell(9,1);
M_.endo_names(1) = {'c'};
M_.endo_names_tex(1) = {'c'};
M_.endo_names_long(1) = {'consumption'};
M_.endo_names(2) = {'i'};
M_.endo_names_tex(2) = {'i'};
M_.endo_names_long(2) = {'investment'};
M_.endo_names(3) = {'k'};
M_.endo_names_tex(3) = {'k'};
M_.endo_names_long(3) = {'capital'};
M_.endo_names(4) = {'y'};
M_.endo_names_tex(4) = {'y'};
M_.endo_names_long(4) = {'output'};
M_.endo_names(5) = {'a'};
M_.endo_names_tex(5) = {'a'};
M_.endo_names_long(5) = {'AR(1) technology shock'};
M_.endo_names(6) = {'w'};
M_.endo_names_tex(6) = {'w'};
M_.endo_names_long(6) = {'wage'};
M_.endo_names(7) = {'q'};
M_.endo_names_tex(7) = {'q'};
M_.endo_names_long(7) = {'ratio of multipliers'};
M_.endo_names(8) = {'l'};
M_.endo_names_tex(8) = {'l'};
M_.endo_names_long(8) = {'labor'};
M_.endo_names(9) = {'r'};
M_.endo_names_tex(9) = {'r'};
M_.endo_names_long(9) = {'capital rate return'};
M_.endo_partitions = struct();
M_.param_names = cell(7,1);
M_.param_names_tex = cell(7,1);
M_.param_names_long = cell(7,1);
M_.param_names(1) = {'alph'};
M_.param_names_tex(1) = {'\alpha'};
M_.param_names_long(1) = {'capital share'};
M_.param_names(2) = {'betta'};
M_.param_names_tex(2) = {'\beta'};
M_.param_names_long(2) = {'discount factor'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'\delta'};
M_.param_names_long(3) = {'depreciation rate'};
M_.param_names(4) = {'sigm_e'};
M_.param_names_tex(4) = {'\sigma_e'};
M_.param_names_long(4) = {'standard deviation'};
M_.param_names(5) = {'rho'};
M_.param_names_tex(5) = {'\rho'};
M_.param_names_long(5) = {'autocorrelation technology shock'};
M_.param_names(6) = {'gamma'};
M_.param_names_tex(6) = {'\gamma'};
M_.param_names_long(6) = {'elasticity substitution'};
M_.param_names(7) = {'psi'};
M_.param_names_tex(7) = {'\psi'};
M_.param_names_long(7) = {'cost of adjustment'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 9;
M_.param_nbr = 7;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.predetermined_variables = [ 3 ];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.orig_eq_nbr = 9;
M_.eq_nbr = 9;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 4 13;
 1 5 14;
 2 6 0;
 0 7 0;
 3 8 0;
 0 9 0;
 0 10 15;
 0 11 0;
 0 12 16;]';
M_.nstatic = 3;
M_.nfwrd   = 3;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 3;
M_.ndynamic   = 6;
M_.dynamic_tmp_nbr = [15; 1; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , 'q' ;
  3 , 'name' , '3' ;
  4 , 'name' , '4' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , 'a' ;
  8 , 'name' , '8' ;
  9 , 'name' , '9' ;
};
M_.mapping.c.eqidx = [1 2 3 6 ];
M_.mapping.i.eqidx = [3 5 6 ];
M_.mapping.k.eqidx = [4 5 8 ];
M_.mapping.y.eqidx = [4 6 8 9 ];
M_.mapping.a.eqidx = [4 7 ];
M_.mapping.w.eqidx = [1 9 ];
M_.mapping.q.eqidx = [2 3 ];
M_.mapping.l.eqidx = [1 4 9 ];
M_.mapping.r.eqidx = [2 8 ];
M_.mapping.e.eqidx = [7 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [2 3 5 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(7, 1);
M_.endo_trends = struct('deflator', cell(9, 1), 'log_deflator', cell(9, 1), 'growth_factor', cell(9, 1), 'log_growth_factor', cell(9, 1));
M_.NNZDerivatives = [35; -1; -1; ];
M_.static_tmp_nbr = [4; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
set_param_value('psi', psi);
M_.params(1) = 0.3;
alph = M_.params(1);
M_.params(2) = 0.96;
betta = M_.params(2);
M_.params(6) = 0.4;
gamma = M_.params(6);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(5) = 0.90;
rho = M_.params(5);
M_.params(4) = 0.01;
sigm_e = M_.params(4);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(5) = 1;
oo_.steady_state(7) = 1;
oo_.steady_state(9) = (1-(1-M_.params(3))*M_.params(2))/M_.params(2);
oo_.steady_state(3) = M_.params(1)/exp(oo_.steady_state(9))*oo_.steady_state(4);
oo_.steady_state(2) = M_.params(3)*oo_.steady_state(3);
oo_.steady_state(1) = (1-M_.params(3)*M_.params(1)/exp(oo_.steady_state(9)))*exp(oo_.steady_state(4));
oo_.steady_state(8) = (1-(1-M_.params(3))*M_.params(2))*M_.params(6)*(1-M_.params(1))/((1-(1-M_.params(3))*M_.params(2))*M_.params(6)*(1-M_.params(1))+(1-M_.params(6))*(1-(1-M_.params(3))*M_.params(2)-M_.params(3)*M_.params(2)*M_.params(1)));
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
resid(1);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(4)^2;
options_.irf = 40;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'tarea1_rbc2_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tarea1_rbc2_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tarea1_rbc2_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tarea1_rbc2_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tarea1_rbc2_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tarea1_rbc2_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tarea1_rbc2_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
