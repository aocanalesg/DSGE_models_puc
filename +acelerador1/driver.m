%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'acelerador1';
M_.dynare_version = '5.4';
oo_.dynare_version = '5.4';
options_.dynare_version = '5.4';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(4,1);
M_.exo_names_tex = cell(4,1);
M_.exo_names_long = cell(4,1);
M_.exo_names(1) = {'theta'};
M_.exo_names_tex(1) = {'theta'};
M_.exo_names_long(1) = {'theta'};
M_.exo_names(2) = {'z'};
M_.exo_names_tex(2) = {'z'};
M_.exo_names_long(2) = {'z'};
M_.exo_names(3) = {'psi'};
M_.exo_names_tex(3) = {'psi'};
M_.exo_names_long(3) = {'psi'};
M_.exo_names(4) = {'eps'};
M_.exo_names_tex(4) = {'eps'};
M_.exo_names_long(4) = {'eps'};
M_.endo_names = cell(8,1);
M_.endo_names_tex = cell(8,1);
M_.endo_names_long = cell(8,1);
M_.endo_names(1) = {'pi'};
M_.endo_names_tex(1) = {'pi'};
M_.endo_names_long(1) = {'pi'};
M_.endo_names(2) = {'y'};
M_.endo_names_tex(2) = {'y'};
M_.endo_names_long(2) = {'y'};
M_.endo_names(3) = {'r'};
M_.endo_names_tex(3) = {'r'};
M_.endo_names_long(3) = {'r'};
M_.endo_names(4) = {'rb'};
M_.endo_names_tex(4) = {'rb'};
M_.endo_names_long(4) = {'rb'};
M_.endo_names(5) = {'rdif'};
M_.endo_names_tex(5) = {'rdif'};
M_.endo_names_long(5) = {'rdif'};
M_.endo_names(6) = {'yn'};
M_.endo_names_tex(6) = {'yn'};
M_.endo_names_long(6) = {'yn'};
M_.endo_names(7) = {'ygap'};
M_.endo_names_tex(7) = {'ygap'};
M_.endo_names_long(7) = {'ygap'};
M_.endo_names(8) = {'n'};
M_.endo_names_tex(8) = {'n'};
M_.endo_names_long(8) = {'n'};
M_.endo_partitions = struct();
M_.param_names = cell(14,1);
M_.param_names_tex = cell(14,1);
M_.param_names_long = cell(14,1);
M_.param_names(1) = {'betta'};
M_.param_names_tex(1) = {'betta'};
M_.param_names_long(1) = {'betta'};
M_.param_names(2) = {'rbar'};
M_.param_names_tex(2) = {'rbar'};
M_.param_names_long(2) = {'rbar'};
M_.param_names(3) = {'omega'};
M_.param_names_tex(3) = {'omega'};
M_.param_names_long(3) = {'omega'};
M_.param_names(4) = {'xi'};
M_.param_names_tex(4) = {'xi'};
M_.param_names_long(4) = {'xi'};
M_.param_names(5) = {'gamma'};
M_.param_names_tex(5) = {'gamma'};
M_.param_names_long(5) = {'gamma'};
M_.param_names(6) = {'pibar'};
M_.param_names_tex(6) = {'pibar'};
M_.param_names_long(6) = {'pibar'};
M_.param_names(7) = {'sigm_f'};
M_.param_names_tex(7) = {'sigm\_f'};
M_.param_names_long(7) = {'sigm_f'};
M_.param_names(8) = {'alph'};
M_.param_names_tex(8) = {'alph'};
M_.param_names_long(8) = {'alph'};
M_.param_names(9) = {'nu'};
M_.param_names_tex(9) = {'nu'};
M_.param_names_long(9) = {'nu'};
M_.param_names(10) = {'kappa'};
M_.param_names_tex(10) = {'kappa'};
M_.param_names_long(10) = {'kappa'};
M_.param_names(11) = {'eta'};
M_.param_names_tex(11) = {'eta'};
M_.param_names_long(11) = {'eta'};
M_.param_names(12) = {'mu'};
M_.param_names_tex(12) = {'mu'};
M_.param_names_long(12) = {'mu'};
M_.param_names(13) = {'rho_psi'};
M_.param_names_tex(13) = {'rho\_psi'};
M_.param_names_long(13) = {'rho_psi'};
M_.param_names(14) = {'rho_eps'};
M_.param_names_tex(14) = {'rho\_eps'};
M_.param_names_long(14) = {'rho_eps'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 8;
M_.param_nbr = 14;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 8;
M_.eq_nbr = 8;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 0;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 0;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 1 2;
 0 3;
 0 4;
 0 5;
 0 6;
 0 7;
 0 8;
 0 9;]';
M_.nstatic = 7;
M_.nfwrd   = 0;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 0;
M_.nspred   = 1;
M_.ndynamic   = 1;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'y' ;
  2 , 'name' , 'r' ;
  3 , 'name' , 'pi' ;
  4 , 'name' , 'rdif' ;
  5 , 'name' , 'rb' ;
  6 , 'name' , 'yn' ;
  7 , 'name' , 'ygap' ;
  8 , 'name' , 'n' ;
};
M_.mapping.pi.eqidx = [2 3 ];
M_.mapping.y.eqidx = [1 3 5 7 8 ];
M_.mapping.r.eqidx = [2 4 5 ];
M_.mapping.rb.eqidx = [1 4 5 ];
M_.mapping.rdif.eqidx = [4 ];
M_.mapping.yn.eqidx = [3 6 7 ];
M_.mapping.ygap.eqidx = [7 ];
M_.mapping.n.eqidx = [8 ];
M_.mapping.theta.eqidx = [1 ];
M_.mapping.z.eqidx = [6 8 ];
M_.mapping.psi.eqidx = [2 ];
M_.mapping.eps.eqidx = [5 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 ];
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(14, 1);
M_.endo_trends = struct('deflator', cell(8, 1), 'log_deflator', cell(8, 1), 'growth_factor', cell(8, 1), 'log_growth_factor', cell(8, 1));
M_.NNZDerivatives = [25; 0; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
load xi;
set_param_value('xi', xi);
M_.params(1) = 0.99;
betta = M_.params(1);
M_.params(2) = 1/M_.params(1)-1;
rbar = M_.params(2);
M_.params(3) = 0.75;
omega = M_.params(3);
M_.params(5) = 0.2;
gamma = M_.params(5);
M_.params(6) = 0;
pibar = M_.params(6);
M_.params(7) = 1;
sigm_f = M_.params(7);
M_.params(8) = 0.05;
alph = M_.params(8);
M_.params(9) = 0.5;
nu = M_.params(9);
M_.params(10) = (1-M_.params(3))/(M_.params(3)*M_.params(4));
kappa = M_.params(10);
M_.params(11) = 9;
eta = M_.params(11);
M_.params(12) = log(1+M_.params(11));
mu = M_.params(12);
M_.params(13) = 0.5;
rho_psi = M_.params(13);
M_.params(14) = 0.9;
rho_eps = M_.params(14);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(3, 3) = 0.1;
M_.Sigma_e(4, 4) = 0.1;
options_.irf = 12;
options_.order = 2;
var_list_ = {'ygap';'y';'yn';'pi';'n';'r';'rb';'rdif'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'acelerador1_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'acelerador1_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'acelerador1_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'acelerador1_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'acelerador1_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'acelerador1_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'acelerador1_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
