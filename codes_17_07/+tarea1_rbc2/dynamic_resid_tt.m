function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 15);

T(1) = (1-params(6))/params(6)*exp(y(4))/(1-exp(y(11)));
T(2) = exp(y(4))*params(2)/exp(y(13));
T(3) = T(2)*(exp(y(16))+y(15)*(1-params(3)));
T(4) = params(7)/2;
T(5) = exp(y(5))/exp(y(1));
T(6) = T(5)-1;
T(7) = 1-T(4)*(exp(y(5))/exp(y(14))-1)^2-T(5)*params(7)*T(6);
T(8) = params(7)*y(15)*params(2)*exp(y(4))/exp(y(13));
T(9) = exp(y(14))/exp(y(5));
T(10) = T(9)^2;
T(11) = T(6)*T(8)*T(10);
T(12) = exp(y(11))^(1-params(1));
T(13) = exp(y(5))*(1-T(4)*T(6)^2);
T(14) = exp(y(8))*exp(y(2))^params(1);
T(15) = T(12)*T(14);

end
